package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.Qna_answerDAO;
import dto.Qna_answersDTO;

@WebServlet("*.answer")
public class QnaAnswerController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF8");
		
		String cmd = request.getRequestURI();
		
		Qna_answerDAO answerDao = Qna_answerDAO.getInstance();
		Gson g = new Gson();
		
		try {
			if(cmd.equals("/add.answer")) {
				String loginID = (String)request.getSession().getAttribute("loginID");
				int parent_seq = Integer.parseInt(request.getParameter("q_parent_seq"));
				String contents =request.getParameter("answer");
					
				answerDao.add(new Qna_answersDTO(0, parent_seq,loginID, contents, null));   
				response.sendRedirect("/qnadetail.qnaboard?q_seq="+parent_seq);
				
			}else if(cmd.equals("/answerlist.answer")) {
				int parent_seq = Integer.parseInt(request.getParameter("q_parent_seq"));
				List<Qna_answersDTO>lists = answerDao.list(parent_seq);
				if(lists == null) lists = new ArrayList<>();
				response.setContentType("text/html; charset=utf8");
				response.getWriter().append(g.toJson(lists));
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
