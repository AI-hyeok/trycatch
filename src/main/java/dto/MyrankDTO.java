package dto;

public class MyrankDTO {
	private String gamename;
	private String id;
	private int highScore;
	public String getGamename() {
		return gamename;
	}
	public void setGamename(String gamename) {
		this.gamename = gamename;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getHighScore() {
		return highScore;
	}
	public void setHighScore(int highScore) {
		this.highScore = highScore;
	}
	public MyrankDTO(String gamename, String id, int highScore) {
		super();
		this.gamename = gamename;
		this.id = id;
		this.highScore = highScore;
	}
	
	
}
