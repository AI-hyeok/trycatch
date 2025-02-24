package servlet;

import java.io.DataInputStream;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.gson.JsonObject;

import dao.FilesDAO;







@WebServlet("*.files")
public class FilesController extends HttpServlet {
	
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String cmd = request.getRequestURI();
		FilesDAO fdao = FilesDAO.getInstance();
		
		try {
		if(cmd.equals("/download.files")) {

			String fileName = request.getParameter("filename");	
			String oriName = request.getParameter("oriname");
			String path = request.getServletContext().getRealPath("upload");

			File target = new File(path+"/"+fileName);
			byte[] fileContents = new byte[(int)target.length()];	

			oriName = new String(oriName.getBytes("utf8"), "ISO-8859-1");
			
			response.setHeader("Content-Disposition", "attachment; filename="+oriName);
			
			try(DataInputStream dis = new DataInputStream(new FileInputStream(target));
					ServletOutputStream sos = response.getOutputStream();){

				dis.readFully(fileContents);
				sos.write(fileContents);
				sos.flush();
			}

		}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}




	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
