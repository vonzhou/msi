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
		 //第一步：添加一个下拉列表项的list，这里添加的项就是下拉列表的菜单项     
		list.add("请选择要推送的媒体：");
		        list.add("grape.jpg");     
		        list.add("watermelon.jpg");     
		        list.add("那一刻.mp3");     
		        list.add("far away form home.mp3");     
		        myTextView = (TextView)findViewById(R.id.TextView_Show);     
		        mySpinner = (Spinner)findViewById(R.id.spinner_media);     
		        //第二步：为下拉列表定义一个适配器，这里就用到里前面定义的list。     
		        adapter = new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item, list);     
		        //第三步：为适配器设置下拉列表下拉时的菜单样式。     
		        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);     
		        //第四步：将适配器添加到下拉列表上     
		        mySpinner.setAdapter(adapter);     
		        //第五步：为下拉列表设置各种事件的响应，这个事响应菜单被选中     
		        mySpinner.setOnItemSelectedListener(new Spinner.OnItemSelectedListener(){     
		            @SuppressWarnings("unchecked")  
		            public void onItemSelected(AdapterView arg0, View arg1, int arg2, long arg3) {     
		                // TODO Auto-generated method stub     
		                /* 将所选mySpinner 的值带入myTextView 中*/  
		            	mediaID=arg2;
		                myTextView.setText("您选择的是："+ adapter.getItem(arg2));
		                System.out.println(arg2+" what you choose is ?////////////////");
		               /* 将mySpinner 显示*/    
		                arg0.setVisibility(View.VISIBLE);   
		               //操纵数据库应该在服务器端进行。
		                final Handler myHandler =new Handler(){
							public void handleMessage(Message msg) {
								String response =(String)msg.obj;
								if(!(response.equals("erro"))){
									System.out.println("推送成功！！！！！！！！！！！！！！！！！！！！！！");
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
		        /*下拉菜单弹出的内容选项触屏事件处理*/    
		        mySpinner.setOnTouchListener(new Spinner.OnTouchListener(){     
		            public boolean onTouch(View v, MotionEvent event) {     
		                // TODO Auto-generated method stub     
		                /* 将mySpinner 隐藏，不隐藏也可以，看自己爱好*/    
		                v.setVisibility(View.INVISIBLE);     
		                return false;     
		            }     
		        });     
		        /*下拉菜单弹出的内容选项焦点改变事件处理*/    
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
