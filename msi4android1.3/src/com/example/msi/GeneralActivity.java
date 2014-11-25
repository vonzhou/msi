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
import android.webkit.WebView;
import android.widget.Button;
import android.widget.ImageButton;

public class GeneralActivity extends Activity {
	private WebView wv2=null;
	private ImageButton upButtonGeneral=null;
	private ImageButton downButtonGeneral=null;
	private ImageButton okButtonGeneral=null;
	private ImageButton leftButtonGeneral=null;
	private ImageButton rightButtonGeneral=null;
	private ImageButton backButtonGeneral=null;
	private ImageButton homeButtonGeneral=null;
	private ImageButton exitButtonGeneral=null;
	private Button mediaPush=null;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		requestWindowFeature(Window.FEATURE_NO_TITLE);          
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);  //全屏
		setContentView(R.layout.activity_general);
		
		wv2=(WebView)this.findViewById(R.id.webView2);
		upButtonGeneral=(ImageButton)this.findViewById(R.id.upButtonGeneral);
		downButtonGeneral=(ImageButton)this.findViewById(R.id.downButtonGeneral);
		leftButtonGeneral=(ImageButton)this.findViewById(R.id.leftButtonGeneral);
		okButtonGeneral=(ImageButton)this.findViewById(R.id.okButtonGeneral);
		rightButtonGeneral=(ImageButton)this.findViewById(R.id.rightButtonGeneral);
		backButtonGeneral=(ImageButton)this.findViewById(R.id.backButtonGeneral);
		homeButtonGeneral=(ImageButton)this.findViewById(R.id.homeButtonGeneral);
		exitButtonGeneral=(ImageButton)this.findViewById(R.id.exitButtonGeneral);
		mediaPush=(Button)this.findViewById(R.id.pushButton);
		
		Bundle bundle=getIntent().getExtras();
		String url=bundle.getString("url");
		//wv2.loadUrl(url);//为何显示不完全？？？？？？
		
		
		
		
		
		upButtonGeneral.setOnClickListener(new OnClickListener() {
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
		downButtonGeneral.setOnClickListener(new OnClickListener() {
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
		
		homeButtonGeneral.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				final Handler myHandler =new Handler(){
					public void handleMessage(Message msg) {
						String response =(String)msg.obj;
						System.out.println(response);
						if(!response.equals("erro")){
							Intent intent =  new Intent(GeneralActivity.this,MainActivity.class);
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
		
		exitButtonGeneral.setOnClickListener(new OnClickListener() {
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
		
		backButtonGeneral.setOnClickListener(new OnClickListener() {
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
		
		
		okButtonGeneral.setOnClickListener(new OnClickListener() {
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
		
		mediaPush.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				final Handler myHandler =new Handler(){
					public void handleMessage(Message msg) {
						String response =(String)msg.obj;
						if(response.equals("ok")){
							Intent intent =  new Intent(GeneralActivity.this,MediaRetrieveActivity.class);
							startActivity(intent);
						}
						//tv.setText("Navigation: "+response);
					}
				};
				new Thread(new Runnable(){
					@Override
					public void run() {
						ConnToServer connToServer=new ConnToServer();
						String result=connToServer.doGet(Constant.BUTTON_MEDIAPUSH);
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
		getMenuInflater().inflate(R.menu.general, menu);
		return true;
	}

}
