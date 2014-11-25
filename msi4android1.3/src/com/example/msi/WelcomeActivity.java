package com.example.msi;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;

public class WelcomeActivity extends Activity {
	private Button enterButton=null;
	

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		requestWindowFeature(Window.FEATURE_NO_TITLE);           //设置标题栏样式
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);  //全屏
		setContentView(R.layout.activity_welcome);
		enterButton=(Button)this.findViewById(R.id.enterButton);
		/*
		enterButton.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				final Handler myHandler =new Handler(){
					public void handleMessage(Message msg) {
						String response =(String)msg.obj;
						//tv.setText("Navigation: "+response);
					}
				};
				new Thread(new Runnable(){
					@Override
					public void run() {
						ConnToServer connToServer=new ConnToServer();
						String result=connToServer.doGet(Constant.BUTTON_LEFT);
						Message msg=new Message();
						msg.obj=result;
						//System.out.println(result);
						myHandler.sendMessage(msg);
					}
				}).start();
			}
		});
		*/
        enterButton.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				final Handler myHandler =new Handler(){
					public void handleMessage(Message msg) {
						String response =(String)msg.obj;
						if(response.equals("ok")){
							Intent intent =  new Intent(WelcomeActivity.this,MainActivity.class);
							startActivity(intent);
						}
						//tv.setText("Navigation: "+response);
					}
				};
				new Thread(new Runnable(){
					@Override
					public void run() {
						ConnToServer connToServer=new ConnToServer();
						String result=connToServer.doGet(Constant.BUTTON_ENTER2INDEX);
						Message msg=new Message();
						msg.obj=result;
						System.out.println(result);
						myHandler.sendMessage(msg);
					}
				}).start();
			}
			
		});
		
		
		
		
		
		
		
		
		
		
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.welcome, menu);
		return true;
	}

}
