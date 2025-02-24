package dto;

import java.sql.Timestamp;

public class QnaboardDTO {
	private int q_seq;
	private String m_nickname;
	private String title;
	private String contents;
	private Timestamp write_date;
	private String secret;
	private boolean hasAnswer;
	
	public boolean isHasAnswer() {
		return hasAnswer;
	}
	public void setHasAnswer(boolean hasAnswer) {
		this.hasAnswer = hasAnswer;
	}
	public int getQ_seq() {
		return q_seq;
	}
	public void setQ_seq(int q_seq) {
		this.q_seq = q_seq;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
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
	public QnaboardDTO(int q_seq, String m_nickname, String title, String contents, Timestamp write_date, String secret) {
		this.q_seq = q_seq;
		this.m_nickname = m_nickname;
		this.title = title;
		this.contents = contents;
		this.write_date = write_date;
		this.secret = secret;
	}
	
	
}
