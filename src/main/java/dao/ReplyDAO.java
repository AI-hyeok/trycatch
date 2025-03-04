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

import dto.ReplyDTO;

public class ReplyDAO {
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}

	private static ReplyDAO instance;
	public synchronized static ReplyDAO getInstance() {
		if(instance == null) {																						
			instance = new ReplyDAO();
		}
		return instance;
	}
	

	
	public List<ReplyDTO> selectALlReplies(int parent_seq)throws Exception{
		String sql = "select * from reply where c_parent_seq= ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, parent_seq);

			
			try(ResultSet rs = pstat.executeQuery();){
				List <ReplyDTO> dtoList = new ArrayList<>();
				ComBoardDAO CBdao = ComBoardDAO.getInstance();
				while(rs.next()) {

					int r_seq = rs.getInt("r_seq");
					int c_parent_seq = rs.getInt("c_parent_seq");
					String m_id = rs.getString("m_id");
					String m_nickname = CBdao.getNickname(r_seq);
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					ReplyDTO dto = new ReplyDTO(r_seq, c_parent_seq, m_id, m_nickname, contents, write_date);
					dtoList.add(dto);

				}
				return dtoList;
			}

		}

	}

	public void addReply(int c_parent_seq, String m_id, String contents)throws Exception {
		String sql = "insert into reply (r_seq, c_parent_seq, m_id, contents, write_date) values (r_seq.nextval, ?, ?, ?, sysdate)";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, c_parent_seq);
			pstat.setString(2, m_id);
			pstat.setString(3, contents);
			pstat.executeUpdate();
		}
	}
	
	public void deleteReply(int r_seq)throws Exception {
		String sql = "delete from reply where r_seq = ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, r_seq);
			pstat.executeUpdate();
		}
	}
	
	public void updateReply(int r_seq, String contents)throws Exception {
		String sql = "UPDATE reply SET CONTENTS = ? WHERE r_seq = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(2, r_seq);
			pstat.setString(1, contents);
			pstat.executeUpdate();

		}
	}
	
	public void deleteMyReply(String m_id)throws Exception {
		String sql = "delete from reply where m_id = ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, m_id);
			pstat.executeUpdate();
		}
	}
}
