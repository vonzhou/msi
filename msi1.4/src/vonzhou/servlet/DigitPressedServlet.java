package vonzhou.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DigitPressedServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
resp.setContentType("text/html");
int flag=Integer.parseInt(req.getParameter("flag"));
//System.out.println(which);
Connection conn=DBUtil.getConnection();
String sql = "select * from indexctrl;";
Statement stmt=null;
ResultSet rs=null;
String which=null;
try {
	//stmt = conn.prepareStatement(sql);
	stmt=conn.createStatement();
	 rs= stmt.executeQuery(sql);
	while(rs.next()){
		if(rs.getString(1).equals("1")){
			which=rs.getString(2);
			break;
		}
	}
			
} catch (SQLException e) {
	e.printStackTrace();
}finally{
	try {
		//rs.close();
		//stmt.close(); 
		//conn.close();
	} catch (Exception e) {e.printStackTrace();} 
}  //end try

if(which==null || which.equals(""))
	which="1";
int temp=Integer.parseInt(which);
if(flag==-1){
	temp=temp<=1?8:(temp-1);
}else if(flag==-2){
	temp=temp>=8?1:(temp+1);
}

String sqlUpdate="update indexctrl set which="+temp+" where id=1;";
try {
	stmt = conn.prepareStatement(sqlUpdate);
	stmt.executeUpdate(sqlUpdate);
} catch (SQLException e) {e.printStackTrace();}








PrintWriter out = resp.getWriter();
out.println(temp);   //android客户端可以获取此信息，进行显示
//ServletContext sc=this.getServletContext();
//sc.setAttribute("which", which);
//System.out.println(which);


//根据android客户端的请求，控制机顶盒首页滚屏。

}

}
