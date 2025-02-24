package dao;


import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;


import com.google.gson.JsonObject;
import dto.FilesDTO;

public class FilesDAO {
	

	private FilesDAO() {}
	private static FilesDAO instance;
	public synchronized static FilesDAO getInstance() {
		if(instance == null) {																						
			instance = new FilesDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}

	public int insertFIles(FilesDTO dto)throws Exception {
		String sql = "INSERT INTO files VALUES (files_seq.nextval, ? , ? , ?)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, dto.getOriName());
			pstat.setString(2, dto.getSysName());
			pstat.setInt(3, dto.getParent_seq());
			return pstat.executeUpdate();

		}
	}

	public List <FilesDTO> selectFile(int num)throws Exception {
		String sql ="SELECT * FROM files WHERE parent_seq = ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, num);
			
			try(ResultSet rs = pstat.executeQuery();){
				List <FilesDTO> flist = new ArrayList<>();
				while(rs.next()) {
					int id = rs.getInt("id");
					String oriName = rs.getString("oriname");
					String sysName = rs.getString("sysname");
					int r_seq = rs.getInt("parent_seq");
					FilesDTO fdto = new FilesDTO(id, oriName, sysName, r_seq);
					flist.add(fdto);
				}
				
				
				return flist;
			}

		}
	}
	
	

	

}
