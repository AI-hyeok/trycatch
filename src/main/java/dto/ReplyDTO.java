package dto;

import java.sql.Timestamp;

public class ReplyDTO {

	private int r_seq ;
	private int c_parent_seq;
	private String m_id;
	private String m_nickname;
	private String contents;
	private Timestamp write_date;
	public int getR_seq() {
		return r_seq;
	}
	public void setR_seq(int r_seq) {
		this.r_seq = r_seq;
	}
	public int getC_parent_seq() {
		return c_parent_seq;
	}
	public void setC_parent_seq(int c_parent_seq) {
		this.c_parent_seq = c_parent_seq;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	
	public ReplyDTO(int r_seq, int c_parent_seq, String m_id, String m_nickname,String contents, Timestamp write_date) {
		this.r_seq = r_seq;
		this.c_parent_seq = c_parent_seq;
		this.m_id = m_id;
		this.m_nickname = m_nickname;
		this.contents = contents;
		this.write_date = write_date;
	}
	
	
}
