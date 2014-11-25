package vonzhou.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SuppressWarnings("serial")
public class IndexServlet extends HttpServlet {
	
	@Override
	public void service(ServletRequest req, ServletResponse res)
			throws ServletException, IOException {
		this.doPost((HttpServletRequest)req, (HttpServletResponse)res);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");

		PrintWriter out = response.getWriter();
		System.out.println("IndexServlet invoked!!!!!!!!!!");
		//out.println("hello");
		//下面的定时刷新是指当前页面2秒后刷新，然后跳转到某页面
		//response.setHeader("Refresh","2;URL=http://127.0.0.1:8080/msi/index.jsp");
		//response.setHeader(s, s1);
		
		
		
		//1.这里做一些DB初始化工作
		Connection conn=DBUtil.getConnection();
		String sql = "update currentURL set url='erro' where id=1;";
	    Statement stmt=null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		sql = "update Timer set value=0 where id=1;";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		sql = "update CurrentKey set value=-1 where id=1;";
		String sql2 = "update CurrentKey set value=0 where id=2;";
		String sql3="update media set name='-1' where id=9999;";
		String sql4="update stbctrl set valid=0 where id=8899;";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate(sql);
			stmt = conn.prepareStatement(sql2);
			stmt.executeUpdate(sql2);
			stmt = conn.prepareStatement(sql3);
			stmt.executeUpdate(sql3);
			stmt = conn.prepareStatement(sql4);
			stmt.executeUpdate(sql4);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		sql= "update enter2Index set valid=0 where id=1;";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {e.printStackTrace();}
		}
        
        
		//2.预留用户管理接口，登陆或者注册。
		//待模块接入。
		
		
		
		//处理完成后进入导航页面
		response.sendRedirect("http://127.0.0.1:8080/msi2/welcome.jsp");
			
		
		
		//out.println(new java.util.Date());
		//out.flush();
		//out.close();
	}

}
