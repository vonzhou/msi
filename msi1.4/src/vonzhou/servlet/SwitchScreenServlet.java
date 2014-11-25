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


public class SwitchScreenServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html");
		int flag=Integer.parseInt(req.getParameter("flag"));
		Connection conn=DBUtil.getConnection();
		String sql = "select * from indexctrl;";
		Statement stmt=null;
		ResultSet rs=null;
		String which=null;
		int valid=0;
		try {
			stmt=conn.createStatement();
			 rs= stmt.executeQuery(sql);
			while(rs.next()){
				if(rs.getString(1).equals("1")){
					which=rs.getString(2);
					break;
				}
			}
					
		} catch (SQLException e) {	e.printStackTrace();}
		
		if(which==null || which.equals(""))
			which="1";
		int temp=Integer.parseInt(which);
		if(flag==-1){
			temp=temp<=1?9:(temp-1);
		}else if(flag==-2){
			temp=temp>=9?1:(temp+1);
		}else if(flag>=1 && flag<=9){
			temp=flag;//说明数字键按下，直接操纵数据库即可，控制切屏
		}else if(flag==8889){
			//temp=-1;
		}else if(flag==8899){//进入控制stb.htm页面，标志有效。
			String x="update stbctrl set valid=1 where id=8899;";
			try {
				stmt = conn.prepareStatement(x);
				stmt.executeUpdate(x);
			} catch (SQLException e) {e.printStackTrace();}
			
		}
		
		
		String sqlUpdate="update indexctrl set which="+temp+" where id=1;";
		try {
			stmt = conn.prepareStatement(sqlUpdate);
			stmt.executeUpdate(sqlUpdate);
		} catch (SQLException e) {e.printStackTrace();}
		
		if(valid==1){
			sqlUpdate="update indexctrl set which=1 where id=13;";
			try {
				stmt = conn.prepareStatement(sqlUpdate);
				stmt.executeUpdate(sqlUpdate);
			} catch (SQLException e) {e.printStackTrace();}
		}
		
		
		try {
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		//System.out.println(valid);
		
		
		
	
		PrintWriter out = resp.getWriter();
		out.println(temp);   //android客户端可以获取此信息，进行显示
		//ServletContext sc=this.getServletContext();
		//sc.setAttribute("which", which);
		//System.out.println(which);
		
		
		//根据android客户端的请求，控制机顶盒首页滚屏。
		
	}

}
