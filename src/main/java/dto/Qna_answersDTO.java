package dto;

import java.sql.Timestamp;

public class Qna_answersDTO {
	private int a_seq;
	private int q_parent_seq;
	private String m_id;
	private String contents;
	private Timestamp write_date;
	public int getA_seq() {
		return a_seq;
	}
	public void setA_seq(int a_seq) {
		this.a_seq = a_seq;
	}
	public int getQ_parent_seq() {
		return q_parent_seq;
	}
	public void setQ_parent_seq(int q_parent_seq) {
		this.q_parent_seq = q_parent_seq;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
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
	public Qna_answersDTO(int a_seq, int q_parent_seq, String m_id, String contents, Timestamp write_date) {
		this.a_seq = a_seq;
		this.q_parent_seq = q_parent_seq;
		this.m_id = m_id;
		this.contents = contents;
		this.write_date = write_date;
	}
	
	
}
