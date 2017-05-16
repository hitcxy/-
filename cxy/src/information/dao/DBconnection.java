package information.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;

import com.mysql.jdbc.Connection;
import java.sql.PreparedStatement;

public class DBconnection {
	static private String user = "root";
	static private String password = "090511";
	public Connection getConnection(){
		String DBDRIVER="com.mysql.jdbc.Driver";
		String DBURL="jdbc:mysql://localhost:3306/BookDB?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		Connection con=null;
		try{
			Class.forName(DBDRIVER);
			con=(Connection)DriverManager.getConnection(DBURL,user,password);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return con;
	}
	public void Close(Connection con,PreparedStatement stmt,ResultSet rs){
		if(rs!=null){
			try{
				rs.close();
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		if(stmt!=null){
			try{
				stmt.close();
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		if(con!=null){
			try{
				con.close();
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
	}
}
