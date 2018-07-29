package com.example.brit.r1412867_lab08_leejooyoung;

import android.app.Activity;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity implements OnClickListener {

    Button btnStopService, btnStartService;

    Intent intentMyService;

    BroadcastReceiver receiver;


    Toast toast;

    TextView CountText;

    String serviceData;

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        intentMyService = new Intent(this, SimpleService.class);
        // 실행되기 원하는 서비스 등록

        receiver = new MyMainLocalRecever();

        CountText = (TextView) findViewById(R.id.textview);

        btnStartService = (Button) findViewById(R.id.button1);
        btnStopService = (Button) findViewById(R.id.button2);
        // 서비스 중지

        btnStartService.setOnClickListener(this);
        btnStopService.setOnClickListener(this);
    }

    public void onClick(View v) {

        switch(v.getId()) {
            case R.id.button1:
                try {
                    IntentFilter mainFilter = new IntentFilter(
                            "com.androday.test.step");

                    registerReceiver(receiver, mainFilter);

                    startService(intentMyService);

                    Toast.makeText(getApplicationContext(), "서비스 시작", 1).show();
                } catch (Exception e) {
                    // TODO: handle exception
                    Toast.makeText(getApplicationContext(), e.getMessage(), 1).show();
                }
                break;
            case R.id.button2:

                try {

                    unregisterReceiver(receiver);

                    stopService(intentMyService);

                    Toast.makeText(getApplicationContext(), "서비스 중지", 1).show();
                } catch (Exception e) {
                    // TODO: handle exception
                    Toast.makeText(getApplicationContext(), e.getMessage(), 1).show();
                }
            }

        }




    class MyMainLocalRecever extends BroadcastReceiver {

        @Override
        public void onReceive(Context context, Intent intent) {
            // TODO Auto-generated method stub

            serviceData = intent.getStringExtra("serviceData");

            CountText.setText(serviceData);

            Toast.makeText(getApplicationContext(), "Walking . . . ", 1).show();

        }

    }

}


