package vonzhou.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Enter2IndexServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		Connection conn=DBUtil.getConnection();
		String sqlUpdate="update enter2Index set valid=1 where id=1;";
		Statement stmt=null;
		//Enter ¼üÈë£¬set it valid
		
		try {
			stmt = conn.prepareStatement(sqlUpdate);
			stmt.executeUpdate(sqlUpdate);
		} catch (SQLException e) {e.printStackTrace();}
		finally{
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {e.printStackTrace();}
		}
		PrintWriter out = response.getWriter();
		out.println("ok");
		
	}

}
