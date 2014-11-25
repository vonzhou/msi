package com.example.msi;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import java.sql.PreparedStatement;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.Menu;
import android.view.MotionEvent;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.TextView;

public class MediaRetrieveActivity extends Activity {
	
	private List<String> list = new ArrayList<String>();     
	    private TextView myTextView;     
	    private Spinner mySpinner;     
	    private ArrayAdapter<String> adapter;   
	    int mediaID=-1;


	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_media_retrieve);
		 //��һ�������һ�������б����list��������ӵ�����������б�Ĳ˵���     
		list.add("��ѡ��Ҫ���͵�ý�壺");
		        list.add("grape.jpg");     
		        list.add("watermelon.jpg");     
		        list.add("��һ��.mp3");     
		        list.add("far away form home.mp3");     
		        myTextView = (TextView)findViewById(R.id.TextView_Show);     
		        mySpinner = (Spinner)findViewById(R.id.spinner_media);     
		        //�ڶ�����Ϊ�����б���һ����������������õ���ǰ�涨���list��     
		        adapter = new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item, list);     
		        //��������Ϊ���������������б�����ʱ�Ĳ˵���ʽ��     
		        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);     
		        //���Ĳ�������������ӵ������б���     
		        mySpinner.setAdapter(adapter);     
		        //���岽��Ϊ�����б����ø����¼�����Ӧ���������Ӧ�˵���ѡ��     
		        mySpinner.setOnItemSelectedListener(new Spinner.OnItemSelectedListener(){     
		            @SuppressWarnings("unchecked")  
		            public void onItemSelected(AdapterView arg0, View arg1, int arg2, long arg3) {     
		                // TODO Auto-generated method stub     
		                /* ����ѡmySpinner ��ֵ����myTextView ��*/  
		            	mediaID=arg2;
		                myTextView.setText("��ѡ����ǣ�"+ adapter.getItem(arg2));
		                System.out.println(arg2+" what you choose is ?////////////////");
		               /* ��mySpinner ��ʾ*/    
		                arg0.setVisibility(View.VISIBLE);   
		               //�������ݿ�Ӧ���ڷ������˽��С�
		                final Handler myHandler =new Handler(){
							public void handleMessage(Message msg) {
								String response =(String)msg.obj;
								if(!(response.equals("erro"))){
									System.out.println("���ͳɹ���������������������������������������������");
								}
							}
						};
						new Thread(new Runnable(){
							@Override
							public void run() {
								ConnToServer connToServer=new ConnToServer();
								String result=connToServer.doGet(Constant.BUTTON_MEDIAPUSH,mediaID);
								Message msg=new Message();
								msg.obj=result;
								myHandler.sendMessage(msg);
							}
						}).start();
		                /* 
		                Connection conn=DBUtil.getConnection();
		                String sql="update media set name="+arg2+" where id=9999;";
		                PreparedStatement stmt=null;
		                
		                
						try {
							 stmt = conn.prepareStatement(sql);
							 stmt.executeUpdate(sql);
						} catch (SQLException e) {
							e.printStackTrace();
						}
						try {
							stmt.close();
							conn.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
						
		               */
		                
		                
		                
		                
		                
		                
		                
		                
		                
		                
		                
		                
		            }     
		            @SuppressWarnings("unchecked")  
		            public void onNothingSelected(AdapterView arg0) {     
		                // TODO Auto-generated method stub     
		                myTextView.setText("NONE");     
		                arg0.setVisibility(View.VISIBLE);     
		            }     
		        });     
		        /*�����˵�����������ѡ����¼�����*/    
		        mySpinner.setOnTouchListener(new Spinner.OnTouchListener(){     
		            public boolean onTouch(View v, MotionEvent event) {     
		                // TODO Auto-generated method stub     
		                /* ��mySpinner ���أ�������Ҳ���ԣ����Լ�����*/    
		                v.setVisibility(View.INVISIBLE);     
		                return false;     
		            }     
		        });     
		        /*�����˵�����������ѡ���ı��¼�����*/    
		        mySpinner.setOnFocusChangeListener(new Spinner.OnFocusChangeListener(){     
		        public void onFocusChange(View v, boolean hasFocus) {     
		        // TODO Auto-generated method stub     
		            v.setVisibility(View.VISIBLE);     
		        }     
		        });     

	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.media_retrieve, menu);
		return true;
	}

}
