package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MembersDAO;
import dto.MembersDTO;

@WebServlet("*.members")
public class MembersController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF8");
		response.setContentType("text/html; charset=UTF-8");
		MembersDAO dao = MembersDAO.getInstance();
		
		
		String cmd = request.getRequestURI();

		try {
			
		if(cmd.equals("/membersInfoAdd.members")) {
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String nickname = request.getParameter("nickname");
			String birth = request.getParameter("birth");
			String phone = request.getParameter("phone");
			String gender = request.getParameter("gender");
			String postcode = request.getParameter("postcode");
			String address = request.getParameter("address");
			String detailAddress = request.getParameter("detailAddress");

			int result = dao.membersInfoInsert(id,password,name,nickname,birth,email,phone,gender,postcode,address,detailAddress,null,0);
			response.sendRedirect("/members/login.jsp");	
		
		}else if(cmd.equals("/idcheck.members")) {
			
			String id = request.getParameter("id");
			
			boolean result = dao.idCheck(id);
			  String exist = "";
		         if(result==true) {
		            exist = "이미 사용중인 아이디입니다.";
		         }
		         else if(result == false) {
		            exist = "아이디 사용이 가능합니다.";
		         }
		         
		         response.getWriter().append(exist);


			
		}else if(cmd.equals("/login.members")){ // 로그인하기
			String id = request.getParameter("id");
			String pw = request.getParameter("password");
			
			boolean result = dao.loginSuccess(id,pw);
			if(result==true){
				request.getSession().setAttribute("loginID", id);
			}
			response.getWriter().append(String.valueOf(result));
			
		}else if(cmd.equals("/logout.members")) {
			request.getSession().invalidate();
			response.sendRedirect("/index.jsp");
		}
		
		else if(cmd.equals("/findId.members")) { 	// 아이디 찾기
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			
			String result = dao.findId(name,email);
			request.setAttribute("m_id", result);
		    
		    request.getRequestDispatcher("/members/findoutId.jsp").forward(request, response);
		
			
		
		
		}else if(cmd.equals("/findPw.members")) {	// 비밀번호 찾기
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			boolean result = dao.findPw(id,name,email);
			
			response.getWriter().append(String.valueOf(result));

			
		
		}else if(cmd.equals("/nicknameCheck.members")) {
			String nickname = request.getParameter("nickname");
			request.setAttribute("nickname",nickname);
			
			boolean result = dao.nicknameCheck(nickname);
			  String exist = "";
		         if(result==true) {
		            exist = "이미 사용중인 닉네임입니다.";
		         }
		         else if(result == false) {
		            exist = "사용 가능한 닉네임입니다.";
		         }
		         
		         response.getWriter().append(exist);
			
		}else if(cmd.equals("/passwordUpdate.members")) {
			String id = request.getParameter("id");
			String password = request.getParameter("password");

			int result = dao.passwordUpdate(id,password);		
			boolean isUpdated = (result > 0);
			
			response.getWriter().append(String.valueOf(isUpdated));
		}

		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
