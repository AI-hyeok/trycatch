package dto;

public class GamescoreDTO {
	private int s_seq;
	private int g_id;
	private String m_id;
	private int score;
	
    public GamescoreDTO() {
    }
	
	public int getS_seq() {
		return s_seq;
	}
	public void setS_seq(int s_seq) {
		this.s_seq = s_seq;
	}
	public int getG_id() {
		return g_id;
	}
	public void setG_id(int g_id) {
		this.g_id = g_id;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	public GamescoreDTO(int s_seq, int g_id, String m_id, int score) {
		this.s_seq = s_seq;
		this.g_id = g_id;
		this.m_id = m_id;
		this.score = score;
	}
	
	
}
