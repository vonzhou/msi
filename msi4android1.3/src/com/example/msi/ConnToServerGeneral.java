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

public class ConnToServerGeneral {
	private String url="http://10.0.2.2:8080/msi2/GeneralServlet4Android?flag=";
	String result="";
	
	public String doGet(int flag){
		url+=flag;
		System.out.println("ConnToServerGeneral//////////////do get "+flag);
		HttpClient hc=new DefaultHttpClient();
		HttpGet hg=new HttpGet(url);
		try {
			HttpResponse resp=hc.execute(hg);
			//System.out.println(resp.getStatusLine().getStatusCode());
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


}
