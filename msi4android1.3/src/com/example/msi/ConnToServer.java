package com.example.msi;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

public class ConnToServer {
	public static int CS=1;  //current screen
	private String url="http://10.0.2.2:8080/msi2/SwitchScreenServlet";//±Õ¸¡À «msi2
	//private String url="http://10.0.2.2:8080/msi/index.jsp";
	String result="";
	public String doGet(int flag){
		if(flag==Constant.BUTTON_OK)
			url="http://10.0.2.2:8080/msi2/EnterServlet";
		else if(flag==Constant.BUTTON_ENTER2INDEX)
			url="http://10.0.2.2:8080/msi2/Enter2IndexServlet";
		else if(flag==Constant.BUTTON_MEDIAPUSH)
			url="http://10.0.2.2:8080/msi2/MediaPushServlet";
		String urlStr=url+"?flag="+flag;
		System.out.println("do get//////////////" +flag);
		HttpClient hc=new DefaultHttpClient();
		HttpGet hg=new HttpGet(urlStr);
		try {
			HttpResponse resp=hc.execute(hg);
			if(resp.getStatusLine().getStatusCode()==HttpStatus.SC_OK){
				HttpEntity he=resp.getEntity();
				InputStream is=he.getContent();
				BufferedReader br=new BufferedReader(new InputStreamReader(is));
				String readLine=null;
				while((readLine=br.readLine())!=null){
					result +=readLine;
				}
				System.out.println("rrrrrrrrrrrrr+ "+result);
			}
			else{
				result="error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return result;
	}
	public String doGet(int flag,int mediaID){
		url="http://10.0.2.2:8080/msi2/MediaPushServlet";
		
		String urlStr=url+"?flag="+mediaID;
		System.out.println("do get//////////////" +mediaID);
		HttpClient hc=new DefaultHttpClient();
		HttpGet hg=new HttpGet(urlStr);
		try {
			HttpResponse resp=hc.execute(hg);
			//System.out.println(resp.getStatusLine().getStatusCode());
			if(resp.getStatusLine().getStatusCode()==HttpStatus.SC_OK){
				//resp.se
				HttpEntity he=resp.getEntity();
				InputStream is=he.getContent();
				BufferedReader br=new BufferedReader(new InputStreamReader(is));
				String readLine=null;
				while((readLine=br.readLine())!=null){
					result +=readLine;
				}
				System.out.println("rrrrrrrrrrrrr+ "+result);
			}
			else{
				result="error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return result;
	}

	public String doGet() {
		String urlStr=url;
		HttpClient hc=new DefaultHttpClient();
		HttpGet hg=new HttpGet(urlStr);
		try {
			HttpResponse resp=hc.execute(hg);
			//System.out.println(resp.getStatusLine().getStatusCode());
			if(resp.getStatusLine().getStatusCode()==HttpStatus.SC_OK){
				//resp.se
				HttpEntity he=resp.getEntity();
				InputStream is=he.getContent();
				BufferedReader br=new BufferedReader(new InputStreamReader(is));
				String readLine=null;
				while((readLine=br.readLine())!=null){
					result +=readLine;
				}
			}
			else{
				result="error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


}
