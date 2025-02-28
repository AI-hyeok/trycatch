package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import dto.GameRankingDTO;  // GameRankingDTO 클래스 사용

public class GamescoreDAO {
    private GamescoreDAO() {}

    private static GamescoreDAO instance;

    public synchronized static GamescoreDAO getInstance() {
        if(instance == null) {
            instance = new GamescoreDAO();
        }
        return instance;
    }

    private Connection getConnection() throws Exception {
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/orcl");
        return ds.getConnection();
    }
    
	public int addGameScore(String m_id, int g_id, int score)throws Exception{
		String sql = "insert into game_scores values(s_seq.nextval,?,?,?)";
		try(Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, g_id);
			pstmt.setString(2, m_id);
			pstmt.setInt(3, score);
			
			int result = pstmt.executeUpdate();
			return result;
		}
		// 정보 입력
	}

    // 모든 게임 랭크보드 조회
    public List<GameRankingDTO> getAllGameRankBoards() throws Exception{
        List<GameRankingDTO> allRankList = new ArrayList<>();
        String sql = "SELECT g_id, gamename FROM games"; // 모든 게임 조회


        try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
        		ResultSet rs = pstat.executeQuery();){

            // 각 게임에 대해 랭킹 조회
            while (rs.next()) {
                int gameId = rs.getInt("g_id");
                String gameName = rs.getString("gamename");
                List<GameRankingDTO> rankList = getGameRankBoard(con, gameId); // 게임별 랭킹 조회

                // 랭킹 정보를 추가
                for (GameRankingDTO dto : rankList) {
                    dto.setGameName(gameName);  // 각 게임의 이름을 추가
                    allRankList.add(dto);
                }
            }
        }

        return allRankList;
    }

    // 게임별 랭크보드 조회
    public List<GameRankingDTO> getGameRankBoard(Connection conn, int gameId) throws Exception {
        List<GameRankingDTO> rankList = new ArrayList<>();
        String sql = "SELECT RANK() OVER (ORDER BY score DESC) AS rank, g.gamename, m.m_nickname, gs.score, g.g_id " +
                     "FROM game_scores gs " +
                     "JOIN games g ON gs.g_id = g.g_id " +
                     "JOIN members m ON gs.m_id = m.m_id " +
                     "WHERE g.g_id = ? " +
                     "ORDER BY score DESC ";

        try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

        
            pstat.setInt(1, gameId);
            ResultSet rs = pstat.executeQuery();

            while (rs.next()) {
                GameRankingDTO dto = new GameRankingDTO();
                dto.setRank(rs.getInt("rank"));
                dto.setGameName(rs.getString("gamename"));
                dto.setNickname(rs.getString("m_nickname"));
                dto.setScore(rs.getInt("score"));
                dto.setGameId(rs.getInt("g_id")); // gameId 설정
                rankList.add(dto);
            }
        } 

        return rankList;
    }
    
	public int deleteGameScore(String id)throws Exception {
	      String sql ="delete from game_scores where m_id=?";
	      
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){


	         pstat.setString(1,id);
	      
	         int result = pstat.executeUpdate();

	         return result;
	      }
	      
	   }
}
