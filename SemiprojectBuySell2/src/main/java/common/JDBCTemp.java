package common;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemp {
	// getConnection()
	public static Connection getConnection() {
		Connection conn = null;
		Properties settings = new Properties();		
		
		try {
			String currentPath = JDBCTemp.class.getResource("./").getPath();
			
			settings.load(new FileReader(currentPath + "jdbc.properties"));
			
			String driver = settings.getProperty("driver");
			String url = settings.getProperty("url");
			String user = settings.getProperty("user");
			String passwd = settings.getProperty("passwd");
			
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, passwd);
			conn.setAutoCommit(false);		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// close(Connection)
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// close(Statement)
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// close(ResultSet)
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// commit
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// rollback
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
