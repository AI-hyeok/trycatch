package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import dto.MembersDTO;
import dto.MyrankDTO;

public class MembersDAO {
	private MembersDAO(){}

	private static MembersDAO instance;

	public synchronized static MembersDAO getInstance() {

		if(instance == null) {
			instance = new MembersDAO(); 
		}
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
		return	ds.getConnection();
	}

	public int membersInfoInsert(String id, String password,String name, String nickname, String birth, String email, String phone,String gender, String postcode, String address, String detailAddress, Timestamp signup_date, int warning_count )throws Exception{
		String sql = "insert into members values(?,?,?,?,?,?,?,?,?,?,?,sysdate,?)";
		try(Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setString(4, nickname);
			pstmt.setString(5, birth);
			pstmt.setString(6, email);
			pstmt.setString(7, phone);
			pstmt.setString(8, gender);
			pstmt.setString(9,postcode);
			pstmt.setString(10, address);
			pstmt.setString(11,detailAddress);
			pstmt.setInt(12, warning_count);
			int result = pstmt.executeUpdate();
			return result;
		}
		// 정보 입력
	}

	public boolean idCheck(String id)throws Exception{
		String sql = "select * from members where m_id = ?";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, id);

			ResultSet rs = pstmt.executeQuery();
			
			boolean result = rs.next();
			return result;
		}
		
		// 아이디 중복검사
	}
	
	public MembersDTO getMembersById(String id) throws Exception {
		String sql = "select * from members where m_id = ?";

		try (Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, id);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					

					return new MembersDTO(
							rs.getString("m_id"),
							rs.getString("pw"),
							rs.getString("name"),
							rs.getString("m_nickname"),
							rs.getString("birth"),
							rs.getString("email"),
							rs.getString("phone"),
							rs.getString("sexual"),
							rs.getString("postcode"),
							rs.getString("address1"),
							rs.getString("address2"),
							rs.getTimestamp("signup_date"),
							rs.getInt("warning_count")
							);
				}
			}
		}
		return null;
	}

	public boolean loginSuccess(String id, String pw) throws Exception{
		String sql ="select * from members where m_id = ? and pw = ?";
		
		try(Connection con = this.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			ResultSet rs = pstmt.executeQuery();
			boolean result = rs.next();
			return result;
		} 
		//로그인 하기
		
	}
	
	public String findId(String name, String email)throws Exception{
		String sql = "select m_id from members where name = ? and email = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			ResultSet rs = pstmt.executeQuery(); 
			
			if(rs.next()) {
				return rs.getString("m_id");
			}else {
				return null;
			}
		}
	}

	public boolean findPw(String id, String name, String email)throws Exception{
		String sql = "select * from members where m_id =? and name = ? and email = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			ResultSet rs = pstmt.executeQuery();
			
			return rs.next();
			 
		}
		// 비밀번호 찾기
	}
	
	public boolean nicknameCheck(String nickname)throws Exception{
		String sql = "select * from members where m_nickname = ? ";
		try(Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
				
			pstmt.setString(1,nickname);
			ResultSet rs = pstmt.executeQuery();
			
			boolean result = rs.next();
			return result;
		}
	}

	public int passwordUpdate(String id, String password) throws Exception{
		String sql = "update members set pw = ? where m_id = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1, password);
			pstmt.setString(2, id);
			int result = pstmt.executeUpdate();
			return result;
			
		}
		
	}


	public int updateMyInformation(String name, String nickname, String phone, String email, String id)throws Exception {
		String sql = "update members set name=?, m_nickname=?, phone=?, email=? where  m_id=?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){


			pstat.setString(1,name);
			pstat.setString(2,nickname);
			pstat.setString(3,phone);
			pstat.setString(4,email);
			pstat.setString(5,id.trim());


			int result = pstat.executeUpdate();

			System.out.println("Executing SQL: " + sql);
			System.out.println("Parameters: [name: " + name + ", nickname: " + nickname + ", phone: " + phone + ", email: " + email + ", id: " + id + "]");
			System.out.println("PreparedStatement: " + pstat.toString());
			System.out.println("Update 결과: " + result);
			return result;
		}
	}

	public boolean check(String id, String password)throws Exception {
		String sql = "select * from members where m_id=? and pw=? ";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setString(1,id);
			pstat.setString(2,password);
			
			ResultSet rs = pstat.executeQuery();


			boolean result = rs.next();


			return result;
		}

	}
	
	public int deleteMember(String id, String password)throws Exception {
	      String sql ="delete from members where m_id=? and pw=?";
	      
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){


	         pstat.setString(1,id);
	         pstat.setString(2,password);
	      
	         int result = pstat.executeUpdate();

	         return result;
	      }
	      
	   }

	public MembersDTO showMembersById(String id)throws Exception {
		String sql = "select * from members where m_id=?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setString(1,id);

			ResultSet rs = pstat.executeQuery();


			rs.next();
			MembersDTO dto = new MembersDTO(rs.getString("m_id"),rs.getString("pw"),rs.getString("name"),rs.getString("m_nickname"),rs.getString("birth"),rs.getString("email"),rs.getString("phone"),rs.getString("sexual"),null,null,null,rs.getTimestamp("signup_date"),rs.getInt("warning_count"));


			return dto;
		}

	}

	public List<MyrankDTO> showMyRank(String id)throws Exception {
		String sql = "select g.gamename,gs.m_id,max(gs.score) as highest_score from game_scores gs JOIN games g ON gs.g_id = g.g_id where gs.m_id = ? GROUP BY g.gamename,gs.m_id order by 1";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			System.out.println(id);
			
			pstat.setString(1,id.trim());

			try(ResultSet rs = pstat.executeQuery()){
				List<MyrankDTO> list = new ArrayList<>();
						
				
				while(rs.next()) {
				
					String gamename = rs.getString("GAMENAME");
					String gameid = rs.getString("M_ID");
					int score = rs.getInt("HIGHEST_SCORE");
					

					
					list.add(new MyrankDTO(gamename,gameid,score));

				}
				return list;
			}
		}

	}



}
