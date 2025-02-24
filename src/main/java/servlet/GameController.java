package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GamescoreDAO;
import dto.GameRankingDTO;

@WebServlet("*.games")
public class GameController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // 요청 URI 분석
        String cmd = request.getRequestURI();

        // GameDAO 객체 생성
        GamescoreDAO dao = GamescoreDAO.getInstance();

        try {
            if (cmd.equals("/ranklist.games")) {
            	// 모든 게임 랭킹 조회
                List<GameRankingDTO> allRankList = dao.getAllGameRankBoards();

                // 게임별로 그룹화
                Map<String, List<GameRankingDTO>> groupedRanks = new HashMap<>();
                for (GameRankingDTO rank : allRankList) {
                    String gameName = rank.getGameName();
                    if (!groupedRanks.containsKey(gameName)) {
                        groupedRanks.put(gameName, new ArrayList<>());
                    }
                    groupedRanks.get(gameName).add(rank);
                }

                // 그룹화된 랭킹 데이터를 request에 저장하여 JSP로 전달
                request.setAttribute("groupedRanks", groupedRanks);


                // JSP로 포워딩
                request.getRequestDispatcher("/rank/ranklist.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);  // POST 요청은 GET 요청으로 전달
    }
}
