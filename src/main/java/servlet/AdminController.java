package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDAO;
import dto.GameStatsDTO;
import dto.MembersDTO;


@WebServlet("*.admins")
public class AdminController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF8");
		response.setContentType("text/html; charset=UTF-8");

		String cmd = request.getRequestURI();
		AdminDAO dao = AdminDAO.getInstance();
		
		try {
			if(cmd.equals("/list.admins")) {
				List<MembersDTO>list = dao.selectAll();
				request.setAttribute("list", list);
				request.getRequestDispatcher("/admin/adminpage.jsp").forward(request, response);
			
			}else if(cmd.equals("/delete.admins")) {
				String id = request.getParameter("m_id");
			    dao.deleteMember(id);
			    response.sendRedirect("/list.admins");
			
			}else if(cmd.equals("/warning.admins")) {
				String id = request.getParameter("m_id");
				dao.increaseWarningCount(id);
				response.sendRedirect("/list.admins");
			
			}else if(cmd.equals("/black.admins")) {
				String id = request.getParameter("m_id");
				dao.addBlackList(id);
				response.sendRedirect("/list.admins");
			
			}else if(cmd.equals("/blacklist.admins")) {
				List<MembersDTO>list = dao.selectBlackList();
				request.setAttribute("list", list);
				request.getRequestDispatcher("/admin/blacklist.jsp").forward(request, response);
			
			}else if(cmd.equals("/blackcancel.admins")) {
				String id = request.getParameter("m_id");
				dao.escapeBlackList(id);
				response.sendRedirect("/blacklist.admins");
			}else if(cmd.equals("/dashboard.admins")) {
			    List<GameStatsDTO> stats = dao.getGameStats();
			    request.setAttribute("stats", stats);
			    request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
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
