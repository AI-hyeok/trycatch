package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import dto.GameDTO;
import dto.GamescoreDTO;

public class GameDAO {
    private GameDAO() {}

    private static GameDAO instance;

    public synchronized static GameDAO getInstance() {
        if(instance == null) {
            instance = new GameDAO();
        }
        return instance;
    }

    // DataSource를 이용한 DB 연결
    private Connection getConnection() throws SQLException, NamingException {
        Context ctx = new InitialContext();
        DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
        return ds.getConnection();
    }

   
}
