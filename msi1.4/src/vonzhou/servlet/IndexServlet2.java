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
public class IndexServlet2 extends HttpServlet {
	
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
		System.out.println("IndexServlet2 invoked!!!!!!!!!!");
		//out.println("hello");
		//����Ķ�ʱˢ����ָ��ǰҳ��2���ˢ�£�Ȼ����ת��ĳҳ��
		//response.setHeader("Refresh","2;URL=http://127.0.0.1:8080/msi/index.jsp");
		//response.setHeader(s, s1);
		
		
		
		//1.������һЩDB��ʼ������
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
		try {
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate(sql);
			stmt = conn.prepareStatement(sql2);
			stmt.executeUpdate(sql2);
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
        
        
		//2.Ԥ���û�����ӿڣ���½����ע�ᡣ
		//��ģ����롣
		
		
		
		//������ɺ���뵼��ҳ��
		response.sendRedirect("http://127.0.0.1:8080/msi2/index.jsp");
			
		
		
		//out.println(new java.util.Date());
		//out.flush();
		//out.close();
	}

}
