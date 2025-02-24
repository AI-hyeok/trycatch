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

import dto.GameStatsDTO;
import dto.MembersDTO;
import dto.MembersDTO;

public class AdminDAO {
	private AdminDAO() {}

	private static AdminDAO instance;

	public synchronized static AdminDAO getInstance() {
		if(instance == null) {
			instance = new AdminDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}
	
	public List<MembersDTO> selectAll() throws Exception {
		String sql = "select * from members where warning_count<3";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			
				List<MembersDTO> result = new ArrayList<>();
				while(rs.next()) {
					String id = rs.getString(1);
					String pw = rs.getString(2);
					String name = rs.getString(3);
					String nickname = rs.getString(4);
					String birth  = rs.getString(5);
					String email = rs.getString(6);
					String phone = rs.getString(7);
					String sexual = rs.getString(8);
					String postcode = rs.getString(9);
					String address1 = rs.getString(10);
					String address2 = rs.getString(11);
					Timestamp signup_date = rs.getTimestamp(12);
					int warning_count = rs.getInt(13);
					
					MembersDTO dto = new MembersDTO(id,pw,name,nickname,birth,email,phone,sexual,postcode,address1,address2,signup_date,warning_count);
					result.add(dto);
				}
				return result;
				
		}
	}
	
	public void deleteMember(String id) throws Exception {
	    String sql = "DELETE FROM members WHERE m_id = ?";
	    try(Connection con = this.getConnection();
	        PreparedStatement pstat = con.prepareStatement(sql)) {
	        pstat.setString(1, id);
	        pstat.executeUpdate();
	    }
	}
	
	public void increaseWarningCount(String id) throws Exception {
		String sql = "update members set warning_count = warning_count + 1 where m_id = ?";

		try (Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}
	}
	
	public void addBlackList(String id) throws Exception {
		String sql = "update members set warning_count = 3 where m_id = ?";

		try (Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}
	}
	
	public void escapeBlackList(String id) throws Exception {
		String sql = "update members set warning_count = 0 where m_id = ?";

		try (Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}
	}
	
	public List<MembersDTO> selectBlackList() throws Exception {
		String sql = "select * from members where warning_count >= 3";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			
				List<MembersDTO> result = new ArrayList<>();
				while(rs.next()) {
					String id = rs.getString(1);
					String pw = rs.getString(2);
					String name = rs.getString(3);
					String nickname = rs.getString(4);
					String birth  = rs.getString(5);
					String email = rs.getString(6);
					String phone = rs.getString(7);
					String sexual = rs.getString(8);
					String postcode = rs.getString(9);
					String address1 = rs.getString(10);
					String address2 = rs.getString(11);
					Timestamp signup_date = rs.getTimestamp(12);
					int warning_count = rs.getInt(13);
					
					MembersDTO dto = new MembersDTO(id,pw,name,nickname,birth,email,phone,sexual,postcode,address1,address2,signup_date,warning_count);
					result.add(dto);
				}
				return result;	
		}
	}
	
	public List<GameStatsDTO> getGameStats() throws Exception {
	    String sql = "SELECT g.gamename, COUNT(s.s_seq) as play_count, AVG(s.score) as avg_score " +
	                 "FROM games g LEFT JOIN game_scores s ON g.g_id = s.g_id " +
	                 "GROUP BY g.gamename";

	    List<GameStatsDTO> list = new ArrayList<>();
	    try (Connection conn = this.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         ResultSet rs = pstmt.executeQuery()) {
	        while (rs.next()) {
	            GameStatsDTO stat = new GameStatsDTO(
	                rs.getString("gamename"),
	                rs.getInt("play_count"),
	                rs.getDouble("avg_score")
	            );
	            list.add(stat);
	        }
	    }
	    return list;
	}

}
