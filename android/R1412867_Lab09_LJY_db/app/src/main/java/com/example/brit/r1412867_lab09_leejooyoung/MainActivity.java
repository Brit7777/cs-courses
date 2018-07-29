package com.example.brit.r1412867_lab09_leejooyoung;

import android.app.ListActivity;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;

import static android.R.attr.name;
import static com.example.brit.r1412867_lab09_leejooyoung.R.id.editTextName;

public class MainActivity extends ListActivity implements View.OnClickListener {

    Button button1,button2,button3;
    ArrayList<String> items;
    ArrayAdapter adapter;
    TextView info_Id;
    Intent intent;
    DBHelper helper;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);




        button1 = (Button)findViewById(R.id.button1);
        button2 = (Button)findViewById(R.id.button2);
        button3 = (Button)findViewById(R.id.button3);

        // 빈 데이터 리스트 생성.
        ArrayList<String> items = new ArrayList<String>() ;
        // ArrayAdapter 생성. 아이템 View를 선택(single choice)가능하도록 만듦.
        ArrayAdapter adapter = new ArrayAdapter(this, android.R.layout.simple_list_item_single_choice, items);

        button1.setOnClickListener(this);
        button2.setOnClickListener(this);
        button3.setOnClickListener(this);
    }

    public void onClick(View v) {

        switch (v.getId()){
            case R.id.button1 :
                intent = new Intent(this,InfoDetail.class);
                startActivity(intent);

                break;
            case R.id.button2 :
                intent = new Intent(this,Search.class);
                startActivity(intent);


                break;

            case R.id.button3:
                InfoRepo repo = new InfoRepo(this);
                ArrayList<HashMap<String, String>> infoList =  repo.getInfoList();
                if(infoList.size()!=0) {
                    ListView lv = getListView();
                    lv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                        @Override
                        public void onItemClick(AdapterView<?> parent, View view,int position, long id) {
                            info_Id = (TextView) view.findViewById(R.id.info_Id);
                            String movieId = info_Id.getText().toString();
                            Intent intent = new Intent(getApplicationContext(),InfoDetail.class);
                            intent.putExtra("info_Id", Integer.parseInt( movieId));
                            startActivity(intent);
                        }
                    });
                    ListAdapter adapter = new SimpleAdapter( MainActivity.this, infoList, R.layout.entry, new String[] { "id","name"}, new int[] {R.id.info_Id, R.id.info_name});
                    setListAdapter(adapter);
                }else{
                    Toast.makeText(this,"ID가 입력되지 않았음!",Toast.LENGTH_SHORT).show();
                }



                break;
        }
    }

}
