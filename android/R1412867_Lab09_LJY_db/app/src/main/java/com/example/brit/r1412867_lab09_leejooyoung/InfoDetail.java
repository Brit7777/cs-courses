package com.example.brit.r1412867_lab09_leejooyoung;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class InfoDetail extends ActionBarActivity {

    Button btnSave ,  btnDelete;
    Button btnClose;
    EditText editTextName;
    EditText editTextPhone;
    EditText editTextMail;
    private int _Info_Id=0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.detail);

        editTextName = (EditText) findViewById(R.id.editTextName);
        editTextPhone = (EditText) findViewById(R.id.editTextPhone);
        editTextMail = (EditText) findViewById(R.id.editTextMail);

        _Info_Id =0;
        Intent intent = getIntent();
        _Info_Id =intent.getIntExtra("info_Id", 0);
        InfoRepo repo = new InfoRepo(this);
        Info info;
        info = repo.getInfoById(_Info_Id);

        editTextMail.setText(info.mail);
        editTextName.setText(info.name);
        editTextPhone.setText(String.valueOf(info.phone));
    }

    public void onClick(View view) {
        if (view == findViewById(R.id.btnSave)){
            InfoRepo repo = new InfoRepo(this);
            Info info = new Info();
            info.mail = editTextMail.getText().toString();
            info.phone = Integer.parseInt(editTextPhone.getText().toString());
            info.name = editTextName.getText().toString();
            info.info_ID=_Info_Id;

            if (_Info_Id==0){
                _Info_Id = repo.insert(info);

                Toast.makeText(this,"새로운 ID가 추가되었음!", Toast.LENGTH_SHORT).show();
            }else{

                repo.update(info);
                Toast.makeText(this,"ID 기록이 변경되었음!", Toast.LENGTH_SHORT).show();
            }
        }else if (view== findViewById(R.id.btnDelete)){
            InfoRepo repo = new InfoRepo(this);
            repo.delete(_Info_Id);
            Toast.makeText(this, "ID가 삭제되었음!", Toast.LENGTH_SHORT);
            finish();
        }else if (view== findViewById(R.id.btnClose)){
            finish();
        }
    }

}