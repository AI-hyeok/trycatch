package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.ComBoardDTO;

public class ComBoardDAO {
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}

	private static ComBoardDAO instance;
	public synchronized static ComBoardDAO getInstance() {
		if(instance == null) {																						
			instance = new ComBoardDAO();
		}
		return instance;
	}
	
	public int getRecordTotalCount()throws Exception {
		String sql = "select count(*) from common_board";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			rs.next();
			return rs.getInt(1);
		}
	}

	
	public List <ComBoardDTO> selectFromTo(int start, int end)throws Exception {
		String sql ="select * from (SELECT common_board.*, row_number() over(order by c_seq desc) rnum FROM common_board) where rnum between ? and ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, start);
			pstat.setInt(2, end);

			try(ResultSet rs = pstat.executeQuery();){
				List <ComBoardDTO> list = new ArrayList<>();
				while(rs.next()) {
					
					int c_seq = rs.getInt("c_seq");
					String m_id = rs.getString("m_id");
					String m_nickname = this.getBoardNickname(c_seq);
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					int view_count = rs.getInt("view_count");
					String notice = rs.getString("notice");
					
					String timeLabel = getTimeLabel(write_date);
					ComBoardDTO dto = new ComBoardDTO(c_seq, m_id, m_nickname, title, contents, write_date, view_count, notice);
					dto.setTimeLabel(timeLabel);
					
					list.add(dto);
				}
				return list;
			}
		}
	}
	
	public void addContents(String m_id, String title, String contents, String notice) throws Exception {
		String sql = "insert into common_board (c_seq, m_id, title, contents, write_date, view_count, notice) values (c_seq.nextval, ?,?,?, sysdate, 0, ?)";
	
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, m_id);
			pstat.setString(2, title);
			pstat.setString(3, contents);
			if(notice != null) {
				pstat.setString(4, notice);
			}
			pstat.executeUpdate();
			
		}
	}
	
	public ComBoardDTO getBoardDetail(int c_seq)throws Exception {
		String sql = "select * from common_board where c_seq = ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			
			pstat.setInt(1, c_seq);
			
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				int seq = rs.getInt("c_seq");
				String m_nickname = this.getNickname(seq);
				String m_id = rs.getString("m_id");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				Timestamp write_date = rs.getTimestamp("write_date");
				int view_count = rs.getInt("view_count");
				String notice = rs.getString("notice");
				view_count += 1;

				String sql2="UPDATE common_board SET VIEW_COUNT = ? WHERE c_seq = ?";
				try(PreparedStatement pstat2 = con.prepareStatement(sql2);){
					pstat2.setInt(1, view_count);
					pstat2.setInt(2, seq);
					pstat2.executeUpdate();
				}
				
			
				
				ComBoardDTO dto = new ComBoardDTO(seq, m_id, m_nickname, title, contents, write_date, view_count, notice);
				return dto;
			}
			
		}
		
	}
	
	
	public String getNickname(int r_seq)throws Exception {
		String sql = "select m.m_nickname from members m join reply r on m.m_id=r.m_id where r_seq = ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, r_seq);
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next()) {
					String nickname = rs.getString("m_nickname");
					return nickname;
				}else {
					return "null";
				}
				
			}
		}
	}
	
	public String getBoardNickname(int c_seq)throws Exception {
		String sql = "select m.m_nickname from members m join common_board cb on m.m_id=cb.m_id where c_seq = ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, c_seq);
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next()) {
					String nickname = rs.getString("m_nickname");
					return nickname;
				}else {
					return "null";
				}
				
			}
		}
	}
	
	public List<ComBoardDTO> selectNotice()throws Exception{
		String sql = "SELECT * FROM common_board WHERE notice = 'Y' order by c_seq desc";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			List <ComBoardDTO> noticeList = new ArrayList<>();

			try(ResultSet rs = pstat.executeQuery();){
				while(rs.next()) {
					int seq = rs.getInt("c_seq");
					String m_id =  rs.getString("m_id");
					String m_nickname = this.getNickname(seq);
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					int view_count = rs.getInt("view_count");
					String notice = rs.getString("notice");
					
					String timeLabel = getTimeLabel(write_date);
					ComBoardDTO dto = new ComBoardDTO(seq, m_id, m_nickname, title, contents, write_date, view_count, notice);
					dto.setTimeLabel(timeLabel);
					noticeList.add(dto);

				}
				
				return noticeList;

			}
		}
		
		}
		public  void deleteBoard(int c_seq)throws Exception {
			String sql = "delete FROM common_board WHERE c_seq = ?";
			try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
				pstat.setInt(1, c_seq);
				pstat.executeUpdate();
			}
		}
		
		public void updateComboard(int c_seq, String title, String contents)throws Exception {
			String sql = "UPDATE common_board SET title= ?, contents = ? WHERE c_seq = ?";
			try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
				pstat.setString(1, title);
				pstat.setString(2, contents);
				pstat.setInt(3, c_seq);
				pstat.executeUpdate();
			}
		}
		
	
		public List<ComBoardDTO> searchByInputText(String inputSearch, int start, int end)throws Exception{
			String sql = "SELECT * FROM (SELECT common_board.*,row_number() OVER (ORDER BY c_seq DESC) AS rnum FROM common_board WHERE title LIKE ? OR contents LIKE ?)WHERE rnum BETWEEN ? AND ?";
			try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);){
				
				pstat.setString(1, "%" + inputSearch + "%");
				pstat.setString(2, "%" + inputSearch + "%");
				pstat.setInt(3, start);
				pstat.setInt(4, end);
				List <ComBoardDTO> list = new ArrayList<>();
				
				try(ResultSet rs = pstat.executeQuery();){
					
					while(rs.next()) {
						int c_seq = rs.getInt("c_seq");
						String m_id = rs.getString("m_id");
						String m_nickname = this.getNickname(c_seq);
						String title = rs.getString("title");
						String contents = rs.getString("contents");
						Timestamp write_date = rs.getTimestamp("write_date");
						int view_count = rs.getInt("view_count");
						String notice = rs.getString("notice");
						String timeLabel = getTimeLabel(write_date);
						ComBoardDTO dto = new ComBoardDTO(c_seq, m_id, m_nickname, title, contents, write_date, view_count, notice);
						dto.setTimeLabel(timeLabel);
						list.add(dto);
					}
					return list;
				}
			}
		}

	
	public List<ComBoardDTO> showMyComBoard(String id)throws Exception {
		String sql = "select * from common_board c join members m on c.m_id = m.m_id where m.m_id = ?";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			
				pstat.setString(1, id);
				ResultSet rs = pstat.executeQuery();
			
			List<ComBoardDTO> list = new ArrayList<>();
			while(rs.next()) {

				int c_seq = rs.getInt("c_seq");
				String m_id = rs.getString("m_id");
				String nickname = rs.getString("m_nickname");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				Timestamp write_date = rs.getTimestamp("write_date");
				int viewcount = rs.getInt("view_count");				
				String notice = rs.getString("notice");
				
				String timeLabel = getTimeLabel(write_date);
				
				ComBoardDTO dto = new ComBoardDTO(c_seq,m_id,nickname,title,contents,write_date,viewcount,notice);
				dto.setTimeLabel(timeLabel);
				list.add(dto);
				
			
			}
			return list;
		}
		
		
	}
	
	private String getTimeLabel(Timestamp write_date) {
		long currentTime = System.currentTimeMillis();
		long writeTime = write_date.getTime();
		long diff = (currentTime - writeTime) / 1000;

		if (diff < 60) return "1분 이내";
		if (diff < 300) return "5분 이내";
		if (diff < 3600) return "1시간 이내";


		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return sdf.format(new Date(writeTime));
	}
	
	public int getNextVal() throws Exception{
        String sql = "SELECT c_seq.nextval FROM dual";
        try(Connection con = this.getConnection();
           PreparedStatement pstat = con.prepareStatement(sql);
           ResultSet rs = pstat.executeQuery();){
           rs.next();
           return rs.getInt(1);
        }
     }
	
	public int getSearchRecordTotalCount(String inputSearch)throws Exception {
		String sql = "select count(*) from common_board where title like ? or contents like ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, "%" + inputSearch + "%");
			pstat.setString(2, "%" + inputSearch + "%");
			
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				return rs.getInt(1);
			}
			
			
		}
	}
	
	public int getNoticeRecordTotalCount()throws Exception {
		String sql = "select count(*) from common_board where notice = 'Y'";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				return rs.getInt(1);
			}
			
			
		}
	}
	
	public int deleteComboardById(String id)throws Exception {
	      String sql ="delete from common_board where m_id=?";
	      
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){


	         pstat.setString(1,id);
	      
	         int result = pstat.executeUpdate();

	         return result;
	      }
	      
	   }
	
}
