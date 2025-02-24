package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Qna_answersDTO;

public class Qna_answerDAO {

	
	public static Qna_answerDAO instance;
	
	public synchronized static Qna_answerDAO getInstance() {
		if(instance == null) {
			instance = new Qna_answerDAO();
		}
		return instance;
	}
	
	
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}
	
	public int add(Qna_answersDTO dto) throws Exception {
		String sql = "insert into qna_answers values(r_seq.nextval,?,?,?,sysdate)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {

			pstat.setInt(1, dto.getQ_parent_seq());
			pstat.setString(2, dto.getM_id());
			pstat.setString(3, dto.getContents());
			int result = pstat.executeUpdate();
			return result;
	}
	}
	
	
	public List<Qna_answersDTO> list(int q_parent_seq) throws Exception{
		String sql = "select * from qna_answers where q_parent_seq = ?";
		Connection con = this.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, q_parent_seq);
		
		ResultSet rs = pstmt.executeQuery();
		List<Qna_answersDTO> lists = new ArrayList<>();
		while (rs.next()) {
			lists.add(new Qna_answersDTO(rs.getInt("a_seq"), rs.getInt("q_parent_seq"), rs.getString("m_id"),  rs.getString("contents"), null));
		}
		return lists;
	}
	
	public boolean hasAnswer(int q_parent_seq) throws Exception {
	    String sql = "SELECT COUNT(*) FROM qna_answers WHERE q_parent_seq = ?";
	    try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
	        pstmt.setInt(1, q_parent_seq);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            return rs.getInt(1) > 0;  // 댓글이 있으면 true, 없으면 false
	        }
	    }
	    return false;  // 댓글 없음
	}
	
}
