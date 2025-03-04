package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ComBoardDAO;
import dao.GamescoreDAO;
import dao.MembersDAO;
import dao.QnaBoardDAO;
import dao.ReplyDAO;
import dto.ComBoardDTO;
import dto.MembersDTO;
import dto.MyrankDTO;
import dto.QnaboardDTO;


@WebServlet("*.mypages")
public class MypageController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=UTF-8");
		String cmd = request.getRequestURI();
		MembersDAO dao = MembersDAO.getInstance();
		ComBoardDAO comdao = ComBoardDAO.getInstance();
		QnaBoardDAO qnadao = QnaBoardDAO.getInstance();
		GamescoreDAO gamescoredao = GamescoreDAO.getInstance();
		ReplyDAO rdao = ReplyDAO.getInstance();
		try {

			if(cmd.equals("/mypage.mypages")) { //마이페이지로 갈때 
				String loginID = (String)request.getSession().getAttribute("loginID");
				
				MembersDTO list = dao.showMembersById(loginID);

				request.setAttribute("list", list);
				
				request.getRequestDispatcher("/mypage/mypage.jsp").forward(request, response);
				
			}
			else if(cmd.equals("/myupdate.mypages")) {
				String loginID = (String)request.getSession().getAttribute("loginID");
				

				MembersDTO list = dao.showMembersById(loginID); 

				request.setAttribute("list", list);
				request.getRequestDispatcher("/mypage/myupdate.jsp").forward(request, response);


			}
			else if(cmd.equals("/updateMyInformation.mypages")) {
				String loginID = (String)request.getSession().getAttribute("loginID");
				String nickname = request.getParameter("nickname");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
			

				dao.updateMyInformation(nickname,phone,email,loginID);

				response.sendRedirect("/myupdate.mypages");



			}
			
			else if(cmd.equals("/checkNickname.mypages")) {
				
				String nickname = request.getParameter("nickname");
				
				boolean result = dao.nicknameCheck(nickname);
				
				response.getWriter().append(String.valueOf(result));
				
			}

			else if(cmd.equals("/myboard.mypages")) {
				
				String loginID = (String)request.getSession().getAttribute("loginID");

				List<ComBoardDTO> comlist = comdao.showMyComBoard(loginID);
				List<QnaboardDTO> qnalist = qnadao.showMyQnaBoard(loginID);

				request.setAttribute("comlist", comlist);
				request.setAttribute("qnalist", qnalist);


				request.getRequestDispatcher("/mypage/myboard.jsp").forward(request, response);

			}

			else if(cmd.equals("/check.mypages")) {
				String loginID = (String)request.getSession().getAttribute("loginID");

				String password = request.getParameter("password");
			
				boolean result = dao.check(loginID,password);

				
				response.getWriter().append(String.valueOf(result));

			}

			else if(cmd.equals("/myrank.mypages")) {
				String loginID = (String)request.getSession().getAttribute("loginID");

				List<MyrankDTO> list = dao.showMyRank(loginID);

				request.setAttribute("list",list);
				request.getRequestDispatcher("/mypage/myrank.jsp").forward(request, response);


			}
			
			else if(cmd.equals("/delete.mypages")) {
				String loginID = (String)request.getSession().getAttribute("loginID");
				String password = request.getParameter("password");
				
				dao.deleteMember(loginID, password);
				comdao.deleteComboardById(loginID);
				qnadao.deleteQnaboardById(loginID);
				gamescoredao.deleteGameScore(loginID);
				rdao.deleteMyReply(loginID);
				
				request.getSession().invalidate();
				response.sendRedirect("/index.jsp");	
			}

		}catch(Exception e) {
			e.printStackTrace();
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
