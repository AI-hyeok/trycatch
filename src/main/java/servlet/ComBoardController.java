package servlet;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Statics;
import dao.ComBoardDAO;
import dao.FilesDAO;
import dto.ComBoardDTO;
import dto.FilesDTO;


@WebServlet("*.comboard")
public class ComBoardController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String cmd = request.getRequestURI();

		FilesDAO fdao = FilesDAO.getInstance();
		ComBoardDAO CBdao = ComBoardDAO.getInstance();

		try {
			if(cmd.equals("/list.comboard")){
				String loginId = (String)request.getSession().getAttribute("loginID");
				String scpage = (String)request.getParameter("cpage");
				if(scpage == null) {
					scpage = "1";
				}

				int recordTotalCount = CBdao.getRecordTotalCount();
				int pageTotalCount = 0;
				if(recordTotalCount % Statics.recordCountPerPage > 0) {
					pageTotalCount = recordTotalCount / Statics.recordCountPerPage + 1;
				}else {
					pageTotalCount = recordTotalCount / Statics.recordCountPerPage;
				}

				int cpage = Integer.parseInt(scpage);


				if(cpage < 1) {
					cpage = 1;
				}else if(cpage > pageTotalCount) {
					cpage=pageTotalCount;
				}
				int end = cpage * Statics.recordCountPerPage;
				int start = end - (Statics.recordCountPerPage-1);
				List <ComBoardDTO> list = CBdao.selectFromTo(start, end);
				int startNavi = (cpage-1) /Statics.naviCountPerPage * Statics.naviCountPerPage + 1;
				int endNavi = startNavi + Statics.naviCountPerPage - 1;


				boolean needPrev = true;
				boolean needNext = true;


				if(endNavi > pageTotalCount) {
					endNavi = pageTotalCount;
				}

				if(startNavi == 1) {needPrev = false;}
				if(endNavi >= pageTotalCount) {needNext = false;}



				if(CBdao.selectNotice() != null) {
					List <ComBoardDTO> noticeList = CBdao.selectNotice();
					request.setAttribute("notice", noticeList);
				}
				
				request.getSession().setAttribute("loginID", loginId);
				request.setAttribute("list", list);
				request.setAttribute("cpage", cpage);
				request.setAttribute("startNavi", startNavi);
				request.setAttribute("endNavi", endNavi);
				request.setAttribute("needPrev", needPrev);
				request.setAttribute("needNext", needNext);


				request.getRequestDispatcher("/common/comlist.jsp").forward(request, response);


			

		}else if(cmd.equals("/write.comboard")) {
			String loginId = (String)request.getSession().getAttribute("loginID");
			
			request.getSession().setAttribute("loginID", loginId);
			request.getRequestDispatcher("/common/comwrite.jsp").forward(request, response);


		}else if (cmd.equals("/insert.comboard")) {
			int maxSize = 1024 * 1024 * 10;
			String savePath = request.getServletContext().getRealPath("upload");

			File filePath = new File(savePath);
			
			if(!filePath.exists()) {
				filePath.mkdir();
			}
			
			
			
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "utf8", new DefaultFileRenamePolicy());

			int seq = CBdao.getNextVal()+1;
			
			
			
			Enumeration<String> fileNames = multi.getFileNames();

			while(fileNames.hasMoreElements()) {

				String name = fileNames.nextElement();
				String oriName = multi.getOriginalFileName(name);
				
				if(oriName == null) {continue;}
				
				String sysName = multi.getFilesystemName(name);

				int result = fdao.insertFIles(new FilesDTO(0, oriName, sysName, seq));

			}
			
			String loginId = (String)request.getSession().getAttribute("loginID");
			String title = multi.getParameter("title");
			String contents = multi.getParameter("contents");
			String notice = multi.getParameter("noticeCheckbox");
			
			if(notice == null) {
				
				CBdao.addContents(loginId, title, contents, "N");
				
			}else {
				CBdao.addContents(loginId, title, contents, "Y");
			}

			request.getRequestDispatcher("/list.comboard").forward(request, response);


		}else if (cmd.equals("/detail.comboard")) {
			int c_seq = Integer.parseInt(request.getParameter("c_seq"));
	         
	         String loginID = (String)request.getSession().getAttribute("loginID");
	         ComBoardDTO dto = CBdao.getBoardDetail(c_seq);
	         List <FilesDTO> fdtoList = fdao.selectFile(c_seq);
	         request.setAttribute("loginID", loginID);
	         request.setAttribute("Files", fdtoList);
	         request.setAttribute("DTO", dto);

			request.getRequestDispatcher("/common/comdetail.jsp").forward(request, response);

		}else if (cmd.equals("/delete.comboard")) {
			int c_seq = Integer.parseInt(request.getParameter("c_seq"));

			CBdao.deleteBoard(c_seq);
			response.sendRedirect("/list.comboard?cpage=1");
			
		}else if (cmd.equals("/update.comboard")) {
			int c_seq = Integer.parseInt(request.getParameter("c_seq"));
			String title = request.getParameter("title");
			String contents = request.getParameter("contents");
			CBdao.updateComboard(c_seq, title, contents);
			
			request.setAttribute("c_seq", c_seq);
			request.getRequestDispatcher("/detail.comboard").forward(request, response);
			
		}else if(cmd.equals("/searchBoard.comboard")) {
			String inputSearch = request.getParameter("inputSearch");
			List <ComBoardDTO> searchResultList = CBdao.searchByInputText(inputSearch);
			
			request.setAttribute("resultList", searchResultList);
			request.getRequestDispatcher("/common/comboardSearchResult.jsp").forward(request, response);
		
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
