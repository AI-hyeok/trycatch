package servlet;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Statics;
import dao.QnaBoardDAO;
import dao.Qna_answerDAO;
import dto.Qna_answersDTO;
import dto.QnaboardDTO;

@WebServlet("*.qnaboard")
public class QnaBoardController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF8");

		String cmd = request.getRequestURI();

		QnaBoardDAO dao = QnaBoardDAO.getInstance();
		Qna_answerDAO adao = Qna_answerDAO.getInstance(); 
		try {
			if (cmd.equals("/qnalist.qnaboard")) {
				String loginId = (String) request.getSession().getAttribute("loginID");

				
				String scpage = (String)request.getParameter("cpage");
				if(scpage==null) {
					scpage ="1";
				}
				int cpage = Integer.parseInt(scpage);
				int recordTotalCount =  dao.getRecordTotalCount();
				int pageTotalCount = 0;			
				if(recordTotalCount % Statics.recordCountPerPage > 0) {
					pageTotalCount = recordTotalCount / Statics.recordCountPerPage +1;
				}else {
					pageTotalCount = recordTotalCount / Statics.recordCountPerPage;
				}
				if(cpage<1) {
					cpage=1;
				}else if(cpage>pageTotalCount){
					cpage = pageTotalCount;
				}
				int end = cpage * Statics.recordCountPerPage;
				int start = end -(Statics.recordCountPerPage-1);
				
			
				List<QnaboardDTO> list = dao.selectFromTo(start, end);
				
				
				int stratNavi = (cpage-1) / Statics.naviCountPerPage * Statics.naviCountPerPage+1;
				int endNavi = stratNavi + Statics.naviCountPerPage-1;
				if(endNavi > pageTotalCount) {
					endNavi = pageTotalCount;
				}
				
				boolean needPrev = true;
				boolean needNext = true;
				
				if(stratNavi == 1) {needPrev = false;}
				if(endNavi == pageTotalCount) {needNext = false;}
				
				for (QnaboardDTO dto : list) {
	                 boolean hasAnswer = adao.hasAnswer(dto.getQ_seq());
	                 dto.setHasAnswer(hasAnswer);  
	                }
				request.getSession().setAttribute("loginID", loginId);
				
				request.setAttribute("list", list);	
				request.setAttribute("cpage", cpage);
				request.setAttribute("startNavi", stratNavi);
				request.setAttribute("endNavi", endNavi);
				request.setAttribute("needPrev", needPrev);
				request.setAttribute("needNext", needNext);
				
				request.getRequestDispatcher("/qna/qnalist.jsp").forward(request, response);
			
			}else if (cmd.equals("/qnawrite.qnaboard")) {

				response.sendRedirect("/qna/qnawrite.jsp");
			}else if (cmd.equals("/toqnawrite.qnaboard")) {
				String loginID = (String)request.getSession().getAttribute("loginID");
				
			String title = request.getParameter("title");
			

			String contents = request.getParameter("contents");

			String secret = request.getParameter("secret");

			if (secret!=null) {

				dao.addList(new QnaboardDTO(0, title, loginID, contents, null, "Y"));
			}else if(secret ==null){

				dao.addList(new QnaboardDTO(0, title, loginID, contents, null, "N"));

			}
				response.sendRedirect("/qnalist.qnaboard");
			}else if(cmd.equals("/qnadetail.qnaboard")) {
				
				request.setCharacterEncoding("UTF8");
				String loginID = (String)request.getSession().getAttribute("loginID");
				int seq = Integer.parseInt(request.getParameter("q_seq"));
				
				QnaboardDTO dto = dao.clickByList(seq);

				
				request.setAttribute("dto", dto);
				request.getSession().setAttribute("loginID", loginID);
				request.getRequestDispatcher("/qna/qnadetail.jsp").forward(request, response);
			
			}else if(cmd.equals("/search.qnaboard")) {
				String search = request.getParameter("search");
				String loginID = (String)request.getSession().getAttribute("loginID");
				String scpage = (String)request.getParameter("cpage");
				if(scpage==null) {
					scpage ="1";
				}
				int cpage = Integer.parseInt(scpage);
				int recordTotalCount =  dao.getSearchRecordTotalCount(search);

				int pageTotalCount = 0;			
				if(recordTotalCount % Statics.recordCountPerPage > 0) {
					pageTotalCount = recordTotalCount / Statics.recordCountPerPage +1;
				}else {
					pageTotalCount = recordTotalCount / Statics.recordCountPerPage;
				}
				if(cpage<1) {
					cpage=1;
				}else if(cpage>pageTotalCount){
					cpage = pageTotalCount;
				}
				int end = cpage * Statics.recordCountPerPage;
				int start = end -(Statics.recordCountPerPage-1);
				
				
				List<QnaboardDTO> checkList = dao.CheckSelectFromTo(start, end, search);
				
				int stratNavi = (cpage-1) / Statics.naviCountPerPage * Statics.naviCountPerPage+1;
				int endNavi = stratNavi + Statics.naviCountPerPage-1;
				if(endNavi > pageTotalCount) {
					endNavi = pageTotalCount;
				}
				
				boolean needPrev = true;
				boolean needNext = true;
				
				if(stratNavi == 1) {needPrev = false;}
				if(endNavi == pageTotalCount) {needNext = false;}
				
				request.getSession().setAttribute("loginID", loginID);
				request.setAttribute("checkList", checkList);
				request.setAttribute("search", search);
				request.setAttribute("cpage", cpage);
				request.setAttribute("startNavi", stratNavi);
				request.setAttribute("endNavi", endNavi);
				request.setAttribute("needPrev", needPrev);
				request.setAttribute("needNext", needNext);
				
				
				
				
				
				
				request.getRequestDispatcher("/qna/searchListQna.jsp").forward(request, response); 
				
				
			}
			
				
			
		}catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
