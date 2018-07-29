package com.example.brit.r1412867_lab07_leejooyoung;

import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.GridLayout;
import android.widget.GridView;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.Switch;

public class MainActivity extends AppCompatActivity implements View.OnClickListener,AdapterView.OnItemClickListener{

    RadioButton radio1, radio2, radio3;
    private String[] studyArray = { "여의예능유치원","여의도초등학교","여의도중학교","여의도여자고등학교","숙명여자대학교"};
    private String[] careerArray = {"경필쓰기대회 금상","노래대회 동상","영어말하기대회 금상","토익 975","토플 105","체육대회 은상","많이 먹기 대회 1등"};

    private ListView studyListView,careerListView;
    private ArrayAdapter arrayAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        radio1 = (RadioButton) findViewById(R.id.radio1);
        radio2 = (RadioButton) findViewById(R.id.radio2);
        radio3 = (RadioButton) findViewById(R.id.radio3);
        radio1.setOnClickListener(this);
        radio2.setOnClickListener(this);
        radio3.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.radio1:
                setContentView(R.layout.radio1);
                GridView gridview = (GridView)findViewById(R.id.GridView01);
                gridview.setAdapter(new ImageAdapter(this));
                break;
            case R.id.radio2:
                setContentView(R.layout.radio2);
                studyListView = (ListView) findViewById(R.id.study_list);
                arrayAdapter = new ArrayAdapter(this, android.R.layout.simple_list_item_1, studyArray);
                studyListView.setAdapter(arrayAdapter);
                studyListView.setOnItemClickListener(this);
                break;
            case R.id.radio3:
                setContentView(R.layout.radio3);
                careerListView = (ListView) findViewById(R.id.career_list);
                arrayAdapter = new ArrayAdapter(this, android.R.layout.simple_list_item_1, careerArray);
                careerListView.setAdapter(arrayAdapter);
                break;
        }
    }

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        switch (position){
            case 0:
                Intent intent1 = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.02-782-1492.kti114.net/"));
                startActivity(intent1);
                break;
            case 1:
                Intent intent2 = new Intent(Intent.ACTION_VIEW, Uri.parse("http://yeouido.es.kr/index.do"));
                startActivity(intent2);
                break;
            case 2:
                Intent intent3 = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.yeouido.ms.kr/index.do"));
                startActivity(intent3);
                break;
            case 3:
                Intent intent4 = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.youido-gh.hs.kr/index/index.do"));
                startActivity(intent4);
                break;
            case 4:
                Intent intent5 = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.sookmyung.ac.kr/index.jsp"));
                startActivity(intent5);
                break;

        }

    }
}
