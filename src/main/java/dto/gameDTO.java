package dto;

public class GameDTO {
	private int id;
	private String gamename;
	private int favorite_game;
	
    public GameDTO() {
    }
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public String getGamename() {
		return gamename;
	}
	public void setGamename(String gamename) {
		this.gamename = gamename;
	}
	public int getFavorite_game() {
		return favorite_game;
	}
	public void setFavorite_game(int favorite_game) {
		this.favorite_game = favorite_game;
	}
	public GameDTO(int id, String gamename, int favorite_game) {
		this.id = id;
		this.gamename = gamename;
		this.favorite_game = favorite_game;
	}
	
	
}
