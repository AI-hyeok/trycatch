package dto;

import java.sql.Timestamp;

public class qnaboardDTO {
	private int q_seq;
	private String m_id;
	private String title;
	private String contents;
	private Timestamp write_date;
	private String secret;
	public int getQ_seq() {
		return q_seq;
	}
	public void setQ_seq(int q_seq) {
		this.q_seq = q_seq;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
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
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public qnaboardDTO(int q_seq, String m_id, String title, String contents, Timestamp write_date, String secret) {
		this.q_seq = q_seq;
		this.m_id = m_id;
		this.title = title;
		this.contents = contents;
		this.write_date = write_date;
		this.secret = secret;
	}
	
	
}
