package com.example.msi;

import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.View.OnClickListener;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.ImageButton;

public class GeneralActivity2 extends Activity {

	private ImageButton upButtonGeneral2=null;
	private ImageButton downButtonGeneral2=null;
	private ImageButton okButtonGeneral2=null;
	private ImageButton leftButtonGeneral2=null;
	private ImageButton rightButtonGeneral2=null;
	private ImageButton backButtonGeneral2=null;
	private ImageButton homeButtonGeneral2=null;
	private ImageButton exitButtonGeneral2=null;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		requestWindowFeature(Window.FEATURE_NO_TITLE);          
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);  //х╚фа
		setContentView(R.layout.activity_general_activity2);
		
		upButtonGeneral2=(ImageButton)this.findViewById(R.id.upButtonGeneral2);
		downButtonGeneral2=(ImageButton)this.findViewById(R.id.downButtonGeneral2);
		leftButtonGeneral2=(ImageButton)this.findViewById(R.id.leftButtonGeneral2);
		okButtonGeneral2=(ImageButton)this.findViewById(R.id.okButtonGeneral2);
		rightButtonGeneral2=(ImageButton)this.findViewById(R.id.rightButtonGeneral2);
		backButtonGeneral2=(ImageButton)this.findViewById(R.id.backButtonGeneral2);
		homeButtonGeneral2=(ImageButton)this.findViewById(R.id.homeButtonGeneral2);
		exitButtonGeneral2=(ImageButton)this.findViewById(R.id.exitButtonGeneral2);
		
		
		upButtonGeneral2.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				final Handler myHandler =new Handler(){
					public void handleMessage(Message msg) {
						String response =(String)msg.obj;
						System.out.println(response);
					}
				};
				new Thread(new Runnable(){
					@Override
					public void run() {
						ConnToServerGeneral connToServer=new ConnToServerGeneral();
						String result=connToServer.doGet(Constant.GENERAL_UP);
						Message msg=new Message();
						msg.obj=result;
						//System.out.println(result);
						myHandler.sendMessage(msg);
					}
				}).start();
			}
		});
		
		downButtonGeneral2.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				final Handler myHandler =new Handler(){
					public void handleMessage(Message msg) {
						String response =(String)msg.obj;
						System.out.println(response);
					}
				};
				new Thread(new Runnable(){
					@Override
					public void run() {
						ConnToServerGeneral connToServer=new ConnToServerGeneral();
						String result=connToServer.doGet(Constant.GENERAL_DOWN);
						Message msg=new Message();
						msg.obj=result;
						//System.out.println(result);
						myHandler.sendMessage(msg);
					}
				}).start();
			}
		});
		
		leftButtonGeneral2.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				final Handler myHandler =new Handler(){
					public void handleMessage(Message msg) {
						String response =(String)msg.obj;
						System.out.println(response);
					}
				};
				new Thread(new Runnable(){
					@Override
					public void run() {
						ConnToServerGeneral connToServer=new ConnToServerGeneral();
						String result=connToServer.doGet(Constant.GENERAL_LEFT);
						Message msg=new Message();
						msg.obj=result;
						//System.out.println(result);
						myHandler.sendMessage(msg);
					}
				}).start();
			}
		});
		
		rightButtonGeneral2.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				final Handler myHandler =new Handler(){
					public void handleMessage(Message msg) {
						String response =(String)msg.obj;
						System.out.println(response);
					}
				};
				new Thread(new Runnable(){
					@Override
					public void run() {
						ConnToServerGeneral connToServer=new ConnToServerGeneral();
						String result=connToServer.doGet(Constant.GENERAL_RIGHT);
						Message msg=new Message();
						msg.obj=result;
						//System.out.println(result);
						myHandler.sendMessage(msg);
					}
				}).start();
			}
		});
		
		homeButtonGeneral2.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				final Handler myHandler =new Handler(){
					public void handleMessage(Message msg) {
						String response =(String)msg.obj;
						System.out.println(response);
						if(!response.equals("erro")){
							Intent intent =  new Intent(GeneralActivity2.this,MainActivity.class);
							startActivity(intent);
						}
					}
				};
				new Thread(new Runnable(){
					@Override
					public void run() {
						ConnToServerGeneral connToServer=new ConnToServerGeneral();
						String result=connToServer.doGet(Constant.GENERAL_HOME);
						Message msg=new Message();
						msg.obj=result;
						//System.out.println(result);
						myHandler.sendMessage(msg);
					}
				}).start();
			}
		});
		
		exitButtonGeneral2.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				final Handler myHandler =new Handler(){
					public void handleMessage(Message msg) {
						String response =(String)msg.obj;
						System.out.println(response);
					}
				};
				new Thread(new Runnable(){
					@Override
					public void run() {
						ConnToServerGeneral connToServer=new ConnToServerGeneral();
						String result=connToServer.doGet(Constant.GENERAL_EXIT);
						Message msg=new Message();
						msg.obj=result;
						//System.out.println(result);
						myHandler.sendMessage(msg);
					}
				}).start();
			}
		});
		
		backButtonGeneral2.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				final Handler myHandler =new Handler(){
					public void handleMessage(Message msg) {
						String response =(String)msg.obj;
						System.out.println(response);
					}
				};
				new Thread(new Runnable(){
					@Override
					public void run() {
						ConnToServerGeneral connToServer=new ConnToServerGeneral();
						String result=connToServer.doGet(Constant.GENERAL_BACK);
						Message msg=new Message();
						msg.obj=result;
						//System.out.println(result);
						myHandler.sendMessage(msg);
					}
				}).start();
			}
		});
		
		
		okButtonGeneral2.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				final Handler myHandler =new Handler(){
					public void handleMessage(Message msg) {
						String response =(String)msg.obj;
						System.out.println(response);
					}
				};
				new Thread(new Runnable(){
					@Override
					public void run() {
						ConnToServerGeneral connToServer=new ConnToServerGeneral();
						String result=connToServer.doGet(Constant.BUTTON_OK);
						Message msg=new Message();
						msg.obj=result;
						//System.out.println(result);
						myHandler.sendMessage(msg);
					}
				}).start();
			}
		});
		
	
		
		
		
		
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.general_activity2, menu);
		return true;
	}

}
