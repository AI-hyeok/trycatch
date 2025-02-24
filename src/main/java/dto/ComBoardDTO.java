package dto;

import java.sql.Timestamp;

public class ComBoardDTO {
   private int c_seq;
   private String m_id;
   private String m_nickname;
   private String title;
   private String contents;
   private Timestamp write_date;
   private int view_count;
   private String notice;
   private String timeLabel;
   
   public String getTimeLabel() {
	return timeLabel;
}
public void setTimeLabel(String timeLabel) {
	this.timeLabel = timeLabel;
}
public int getC_seq() {
      return c_seq;
   }
   public void setC_seq(int c_seq) {
      this.c_seq = c_seq;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getContents() {
      return contents;
   }
   public void setContents(String contents) {
      this.contents = contents;
   }
   public String getM_id() {
      return m_id;
   }
   public void setM_id(String m_id) {
      this.m_id = m_id;
   }
   public Timestamp getWrite_date() {
      return write_date;
   }
   public void setWrite_date(Timestamp write_date) {
      this.write_date = write_date;
   }
   public int getView_count() {
      return view_count;
   }
   public void setView_count(int view_count) {
      this.view_count = view_count;
   }
   public String getNotice() {
      return notice;
   }
   public void setNotice(String notice) {
      this.notice = notice;
   }
   
   public String getM_nickname() {
      return m_nickname;
   }
   public void setM_nickname(String m_nickname) {
      this.m_nickname = m_nickname;
   }
   public ComBoardDTO(int c_seq, String m_id, String m_nickname, String title, String contents, Timestamp write_date, int view_count,
         String notice) {
      this.c_seq = c_seq;
      this.m_id = m_id;
      this.m_nickname = m_nickname;
      this.title = title;
      this.contents = contents;
      this.write_date = write_date;
      this.view_count = view_count;
      this.notice = notice;
   }
 
}
