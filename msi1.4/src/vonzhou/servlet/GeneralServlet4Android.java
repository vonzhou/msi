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

public class GeneralServlet4Android extends HttpServlet{
	/**
	 * 别忘了web.xml注册servlet
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html");
		int key=Integer.parseInt(req.getParameter("flag"));
		System.out.println("server:  flag="+key);
		Connection conn=DBUtil.getConnection();
		String sql = "update CurrentKey set value="+key+" where id=1;";
		Statement stmt=null;
		ResultSet rs=null;
		
		if(key==Key.KEY_UP || key==Key.KEY_LEFT ||key==468|| key==Key.KEY_RIGHT || key==Key.KEY_DOWN || key==Key.KEY_OK){
			try {
				stmt = conn.prepareStatement(sql);
				stmt.executeUpdate(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(key==13){
			System.out.println("in   generalServlet  for android   13.。。。");
			sql="update CurrentKey set value=1 where id=2;";
			try {
				stmt = conn.prepareStatement(sql);
				stmt.executeUpdate(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		
		
		
		//获取定时器之前的值，进行更新操作
		sql = "select * from Timer;";
		String pre=null;
		try {
			stmt = conn.prepareStatement(sql);
		    rs = stmt.executeQuery(sql);
		    while(rs.next()){
		    	if(rs.getString(1).equals("1")){
		    		pre=rs.getString(2);
		    		break;
		    	}
		    }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
	    
		String updatedTimerValue=(Integer.parseInt(pre)+1)+"";
		
		sql = "update Timer set value="+updatedTimerValue+" where id=1;";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//已经进入到stb页面所以将有效标志置为无效，否则当点击返回主页时会出现问题。
		sql = "update stbctrl set valid=0 where id=8899;";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				stmt.close(); 
				conn.close();
			} catch (Exception e) {e.printStackTrace();} 
		}  //end try
	
		PrintWriter out = resp.getWriter();
		out.println("GeneralServlet4Android ok!");   //android客户端可以获取此信息，进行显示
		
	}

}

