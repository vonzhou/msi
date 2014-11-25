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
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TextView;

public class MainActivity extends Activity {
	private WebView wv=null;
	private ImageButton leftButton=null;
	private ImageButton rightButton=null;
	private ImageButton okButton=null;
	private TextView tv=null;
	private Button[] digitButtons=new Button[10];
	private Button mediaPush=null;
	private Button altButton=null;
	
	private int digit=1;  //当前点击的数字键
	String url="http://10.0.2.2:8080/msi2/index.jsp";
	String urlBase="http://10.0.2.2:8080/msi2/";
	
	
	
	
	
	
	//http://127.0.0.1:8080/msi1/index.jsp
	String which=null;//从数据库获得滚屏指令。进而android端左右键驱动

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);           //设置标题栏样式
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);  //全屏
        
        setContentView(R.layout.activity_main);
        
        wv=(WebView)findViewById(R.id.webView1);
        leftButton=(ImageButton) findViewById(R.id.leftButton);
        rightButton=(ImageButton)findViewById(R.id.rightButton);
        tv=(TextView)findViewById(R.id.textView); //Navigation text view
        okButton=(ImageButton)findViewById(R.id.okButton);//OK Button
        //digitButtons[0]=(Button)findViewById(R.id.oneButton);
        digitButtons[1]=(Button)findViewById(R.id.oneButton);
        digitButtons[2]=(Button)findViewById(R.id.twoButton);
        digitButtons[3]=(Button)findViewById(R.id.threeButton);
        digitButtons[4]=(Button)findViewById(R.id.fourButton);
        digitButtons[5]=(Button)findViewById(R.id.fiveButton);
        digitButtons[6]=(Button)findViewById(R.id.sixButton);
        digitButtons[7]=(Button)findViewById(R.id.sevenButton);
        digitButtons[8]=(Button)findViewById(R.id.eightButton);
        digitButtons[9]=(Button)findViewById(R.id.nineButton);
        mediaPush=(Button)this.findViewById(R.id.pushButton2);
        altButton=(Button)this.findViewById(R.id.alt);
        
        tv.setText("Navigation: ");//android端显示导航
        
        WebSettings settings = wv.getSettings();  
        settings.setSupportZoom(true);          //支持缩放  
        settings.setBuiltInZoomControls(true);  //启用内置缩放装置  
        settings.setJavaScriptEnabled(true);      //启用JS脚本
        wv.requestFocus();
        wv.loadUrl(url);
        wv.setScrollBarStyle(TRIM_MEMORY_COMPLETE);
        wv.setWebViewClient(new WebViewClient(){
        	@Override
        	public boolean shouldOverrideUrlLoading(WebView view, String url) {
        		wv.loadUrl(url);
        		return true;
        	}
        });
        //3.通过消息机制与服务器通信，服务器操纵数据库，进而加载相应页面
        leftButton.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				final Handler myHandler =new Handler(){
					public void handleMessage(Message msg) {
						String response =(String)msg.obj;
						tv.setText("Navigation: "+response);
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
        rightButton.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				final Handler myHandler =new Handler(){
					public void handleMessage(Message msg) {
						String response =(String)msg.obj;
						tv.setText("Navigation: "+response);
					}
				};
				new Thread(new Runnable(){
					@Override
					public void run() {
						ConnToServer connToServer=new ConnToServer();
						String result=connToServer.doGet(Constant.BUTTON_RIGHT);
						Message msg=new Message();
						msg.obj=result;
						//System.out.println(result);
						myHandler.sendMessage(msg);
					}
				}).start();
			}
		});
        
        //
        okButton.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				final Handler myHandler =new Handler(){
					public void handleMessage(Message msg) {
						String response =(String)msg.obj;
						if(!(response.equals("erro"))){
							String urlUpdate=urlBase+response;
							Intent it = new Intent(MainActivity.this, GeneralActivity.class);
							Bundle bundle=new Bundle();
							bundle.putString("url", urlUpdate);
							it.putExtras(bundle);    
							startActivity(it); 
						}
					}
				};
				new Thread(new Runnable(){
					@Override
					public void run() {
						ConnToServer connToServer=new ConnToServer();
						String result=connToServer.doGet(Constant.BUTTON_OK);
						Message msg=new Message();
						msg.obj=result;
						myHandler.sendMessage(msg);
					}
				}).start();
			}
		});
        
        altButton.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				final Handler myHandler =new Handler(){
					public void handleMessage(Message msg) {
						String response =(String)msg.obj;
						if(!(response.equals("erro"))){
							String urlUpdate=urlBase+response;
							Intent it = new Intent(MainActivity.this, GeneralActivity2.class);
							//Bundle bundle=new Bundle();
							//bundle.putString("url", urlUpdate);
							//it.putExtras(bundle);    
							startActivity(it); 
						}
					}
				};
				new Thread(new Runnable(){
					@Override
					public void run() {
						ConnToServer connToServer=new ConnToServer();
						String result=connToServer.doGet(Constant.BUTTON_ALT);
						Message msg=new Message();
						msg.obj=result;
						myHandler.sendMessage(msg);
					}
				}).start();
			}
		});
        
        //内部类：数字按键监听
        class MyClickListener implements OnClickListener{

			@Override
			public void onClick(View v) {
				Button digitButton=(Button)v;
				digit = Integer.parseInt(digitButton.getText().toString().trim());
				final Handler myHandler =new Handler(){
					public void handleMessage(Message msg) {
						String response =(String)msg.obj;
						tv.setText("Navigation: "+response);
					}
				};
				new Thread(new Runnable(){
					@Override
					public void run() {
						ConnToServer connToServer=new ConnToServer();
						String result=connToServer.doGet(digit);
						Message msg=new Message();
						msg.obj=result;
						//System.out.println(result);
						myHandler.sendMessage(msg);
					}
				}).start();
			}
        }//end class 
        
        for(int i=1;i<=9;i++){
        	digitButtons[i].setOnClickListener(new MyClickListener());
        }
        
        mediaPush.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				final Handler myHandler =new Handler(){
					public void handleMessage(Message msg) {
						String response =(String)msg.obj;
						if(!(response.equals("erro"))){
							//String urlUpdate=urlBase+response;
							Intent it = new Intent(MainActivity.this, MediaRetrieveActivity.class);
							//Bundle bundle=new Bundle();
							//bundle.putString("url", urlUpdate);
							//it.putExtras(bundle);    
							startActivity(it); 
						}
					}
				};
				new Thread(new Runnable(){
					@Override
					public void run() {
						//ConnToServer connToServer=new ConnToServer();
						//String result=connToServer.doGet(Constant.BUTTON_MEDIAPUSH);
						Message msg=new Message();
						msg.obj="ok";
						myHandler.sendMessage(msg);
					}
				}).start();
			}
			
		});
		
        
        
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
