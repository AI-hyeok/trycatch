package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import common.Statics;
import dao.ReplyDAO;
import dto.ComBoardDTO;
import dto.ReplyDTO;


@WebServlet("*.reply")
public class ReplyController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String cmd = request.getRequestURI();

		ReplyDAO CBRDAO = ReplyDAO.getInstance();
		Gson g = new Gson();
		
		try{
			if(cmd.equals("/replyList.reply")) {
				int c_parent_seq = Integer.parseInt(request.getParameter("c_parent_seq"));
				List <ReplyDTO> dtoList = CBRDAO.selectALlReplies(c_parent_seq);
				response.setContentType("text/html; charset=utf8"); // 한글 안 깨지게 해주는 코드
				response.getWriter().append(g.toJson(dtoList));
				
				
				
			}else if (cmd.equals("/insertReply.reply")) {
				int c_parent_seq = Integer.parseInt(request.getParameter("c_seq"));
				String m_id = request.getParameter("m_id");
				String contents = request.getParameter("contents");
				CBRDAO.addReply(c_parent_seq, m_id, contents);
				response.sendRedirect("/detail.comboard?c_seq=" + c_parent_seq);
			
			
			}else if(cmd.equals("/deleteReply.reply")) {
				int r_seq = Integer.parseInt(request.getParameter("r_seq"));
				int c_parent_seq = Integer.parseInt(request.getParameter("c_seq"));
				CBRDAO.deleteReply(r_seq);
				
				request.setAttribute("c_seq", c_parent_seq);
				request.getRequestDispatcher("/detail.comboard").forward(request, response);
			}else if(cmd.equals("/updateReply.reply")){
				int r_seq = Integer.parseInt(request.getParameter("seq"));
				String contents = request.getParameter("contents");
				CBRDAO.updateReply(r_seq, contents);
				response.getWriter().append(contents);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
