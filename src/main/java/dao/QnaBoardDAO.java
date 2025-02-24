package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.QnaboardDTO;

public class QnaBoardDAO {

public static QnaBoardDAO instance;
	
	public synchronized static QnaBoardDAO getInstance(){
		if(instance==null) {
			instance = new QnaBoardDAO(); 
		}
		return instance;
	}
	
	public Connection getConnection()throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}
	
	public List<QnaboardDTO> list() throws Exception {
		String sql = "SELECT q.q_seq, q.title, m.m_nickname,q.contents, q.write_date, q.secret FROM qna_board q left JOIN members m ON q.m_id = m.m_id order by q.q_seq desc";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			ResultSet rs = pstmt.executeQuery();

			List<QnaboardDTO> lists = new ArrayList<>();
			while (rs.next()) {
				int seq = rs.getInt("q_seq");
				String title = rs.getString("title");
				String nickname = rs.getString("m_nickname");
				String contents = rs.getString("contents");
				Timestamp write_date = rs.getTimestamp("write_date");
				String secret = rs.getString("secret");

				QnaboardDTO dto = new QnaboardDTO(seq, nickname, title, contents, write_date, secret);
				lists.add(dto);
			}
			return lists;
		}
	}

	public List<QnaboardDTO> selectFromTo(int start, int end) throws Exception{
	    String sql = "select * from (select qna_board.q_seq, qna_board.title, m.m_nickname, qna_board.contents, qna_board.write_date, qna_board.secret,  row_number() over(order by qna_board.q_seq desc) rnum from qna_board left join members m on qna_board.m_id = m.m_id) where rnum between ? and ?";		
                try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			try(ResultSet rs = pstat.executeQuery();){
				List<QnaboardDTO> lists = new ArrayList<>();
				while (rs.next()) {
					int seq = rs.getInt("q_seq");
					String title = rs.getString("title");
					String nickname = rs.getString("m_nickname");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					String secret = rs.getString("secret");

					QnaboardDTO dto = new QnaboardDTO(seq, nickname, title, contents, write_date, secret);
					lists.add(dto);
				}
				return lists;
			}
		}
	}
	public List<QnaboardDTO> CheckSelectFromTo(int start, int end, String m_nickname) throws Exception{
	    String sql = "select * from (select qna_board.q_seq, qna_board.title, m.m_nickname, qna_board.contents, qna_board.write_date, qna_board.secret,  row_number() over(order by qna_board.q_seq desc) rnum from qna_board join members m on qna_board.m_id = m.m_id where m.m_nickname like ?) where rnum between ? and ?";		
                try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
                	pstat.setString(1, "%" + m_nickname + "%");
			pstat.setInt(2, start);
			pstat.setInt(3, end);
			try(ResultSet rs = pstat.executeQuery();){
				List<QnaboardDTO> lists = new ArrayList<>();
				while (rs.next()) {
					int seq = rs.getInt("q_seq");
					String title = rs.getString("title");
					String nickname = rs.getString("m_nickname");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					String secret = rs.getString("secret");

					QnaboardDTO dto = new QnaboardDTO(seq, nickname, title, contents, write_date, secret);
					lists.add(dto);
				}
				return lists;
			}
		}
	}
	
	public int addList(QnaboardDTO dto) throws Exception {
		String sql = "insert into qna_board values(q_seq.nextval,?,?,?,sysdate,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {

			
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getM_nickname());
			pstat.setString(3, dto.getContents());
			pstat.setString(4, dto.getSecret());
		
			int result = pstat.executeUpdate();
			return result;
		}
	}

	public QnaboardDTO clickByList(int q_seq) throws Exception {
		String sql = "select q.q_seq, m.m_nickname, q.title, q.contents, q.write_date, q.secret FROM qna_board q left JOIN members m ON q.m_id = m.m_id WHERE q.q_seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {

			pstat.setInt(1, q_seq);

			ResultSet rs = pstat.executeQuery();
			if (rs.next()) {
				return new QnaboardDTO(rs.getInt("q_seq"), rs.getString("m_nickname"), rs.getString("title"),
						rs.getString("contents"), rs.getTimestamp("write_date"), rs.getString("secret"));
			}
			return null;
		}
	}

	public List<QnaboardDTO> checkNickname(String nickname) throws Exception {
		String sql = "select q.q_seq, q.title, m.m_nickname, q.contents, q.write_date, q.secret from qna_board q join members m on q.m_id = m.m_id where m.m_nickname like ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, "%" + nickname + "%");

			ResultSet rs = pstat.executeQuery();

			List<QnaboardDTO> checkList = new ArrayList<>();

			while (rs.next()) {
				int q_seq = rs.getInt("q_seq");
				String m_nickname = rs.getString("m_nickname");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				Timestamp write_date = rs.getTimestamp("write_date");
				String secret = rs.getString("secret");
				QnaboardDTO qna = new QnaboardDTO(q_seq, m_nickname, title, contents, write_date, secret);
				checkList.add(qna);
			}
			return checkList;
		}

	}

	public int getRecordTotalCount() throws Exception {
		String sql = "select count(*) from qna_board";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			return rs.getInt(1);
		}
	}

	public int getSearchRecordTotalCount(String nickname) throws Exception {
	    String sql = "select count(*) from qna_board q join members m on q.m_id = m.m_id where m.m_nickname like ?";
	    try (Connection con = this.getConnection();
	         PreparedStatement pstat = con.prepareStatement(sql)) {
	        
	    
	        pstat.setString(1, "%" + nickname + "%");
	        
	        try (ResultSet rs = pstat.executeQuery()) {
	            if (rs.next()) {
	                return rs.getInt(1); 
	            } else {
	                return 0; 
	            }
	        }
	    }
	}
	
	public List<QnaboardDTO> showMyQnaBoard(String id)throws Exception {
		String sql = "select * from qna_board where m_id=?";
		List<QnaboardDTO> list = new ArrayList();
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
				pstat.setString(1, id);
				
				ResultSet rs = pstat.executeQuery();
		
			
			while(rs.next()) {
			
				int q_seq = rs.getInt("q_seq");
				String m_nickname = rs.getString("m_id");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				Timestamp write_date = rs.getTimestamp("write_date");		
				String secret = rs.getString("secret");
				QnaboardDTO dto = new QnaboardDTO(q_seq,m_nickname,title,contents,write_date,secret);
				list.add(dto);
				
			
			
			}
		
			return list;
			
	}
		
	
}
}
	

