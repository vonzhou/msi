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


public class EnterServlet extends HttpServlet{  //Don't forget register it in web.xml file
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html");
		int flag=Integer.parseInt(req.getParameter("flag"));
		System.out.println("valid="+flag);
		Connection conn=DBUtil.getConnection();
		String sql = "select * from indexctrl;";
		Statement stmt=null;
		ResultSet rs=null;
		String which=null;
		String url="erro";
		int valid=0;
		//Enter ���룬set it valid
		String sqlUpdate="update indexctrl set which=1 where id=13;";
		try {
			stmt = conn.prepareStatement(sqlUpdate);
			stmt.executeUpdate(sqlUpdate);
		} catch (SQLException e) {e.printStackTrace();}
		//���ҷ��ظ��ͻ�����Ч��URL���Ա�����ת��
		try {
			stmt=conn.createStatement();
			 rs= stmt.executeQuery(sql);
			while(rs.next()){
				if(rs.getString(1).equals("1")){
					which = rs.getString(2);
					break;
				}
			}
		} catch (Exception e) {e.printStackTrace();}
		
		sql="select * from urltab where id="+which+";";
		try {
			stmt=conn.createStatement();
			 rs= stmt.executeQuery(sql);
			while(rs.next()){
				url=rs.getString(2);
				break;
			}
		}catch (SQLException e) {e.printStackTrace();}
		
		System.out.println("enterServlet "+valid);
		
	
		PrintWriter out = resp.getWriter();
		out.println(url);   //android�ͻ��˿��Ի�ȡ����Ϣ��������ʾ
		//ServletContext sc=this.getServletContext();
		//sc.setAttribute("which", which);
		//System.out.println(which);
		
		
		//����android�ͻ��˵����󣬿��ƻ�������ҳ������
		
	}

}
