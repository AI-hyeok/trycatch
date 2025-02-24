package dto;

public class GameStatsDTO {
    private String gameName;
    private int playCount;
    private double avgScore;

    public GameStatsDTO(String gameName, int playCount, double avgScore) {
        this.gameName = gameName;
        this.playCount = playCount;
        this.avgScore = avgScore;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public int getPlayCount() {
        return playCount;
    }

    public void setPlayCount(int playCount) {
        this.playCount = playCount;
    }

    public double getAvgScore() {
        return avgScore;
    }

    public void setAvgScore(double avgScore) {
        this.avgScore = avgScore;
    }
}

