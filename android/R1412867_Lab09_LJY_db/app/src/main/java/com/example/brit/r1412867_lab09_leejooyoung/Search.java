package com.example.brit.r1412867_lab09_leejooyoung;

import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

/**
 * Created by Brit on 2016-11-27.
 */

public class Search extends Activity  {

    DBHelper helper;
    SQLiteDatabase db;
    Cursor cursor;
    Button button1, button2;
    EditText editTextName, editTextPhone, editTextMail;


    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.detail2);


        editTextName = (EditText) findViewById(R.id.editTextName);
        editTextPhone = (EditText) findViewById(R.id.editTextPhone);
        editTextMail = (EditText) findViewById(R.id.editTextMail);
        helper = new DBHelper(this);
        try {
            db = helper.getWritableDatabase();
        } catch (SQLiteException ex) {
            db = helper.getReadableDatabase();
        }

        button1 = (Button) findViewById(R.id.btnSearch);
        button2 = (Button) findViewById(R.id.btnClose);

    }

    public void search(View target) {
        String name = editTextName.getText().toString();
        String phone = editTextPhone.getText().toString();
        String mail = editTextMail.getText().toString();
        Cursor cursor;
        if (name.length()>0) {
            cursor = db.rawQuery("SELECT name, phone, mail FROM " + Info.TABLE + " WHERE " + Info.KEY_name + "='"
                    + name + "';", null);

            while (cursor.moveToNext()) {
                phone = cursor.getString(1);
                mail = cursor.getString(2);
                editTextPhone.setText(phone);
                editTextMail.setText(mail);
            }
        }
        else if (mail.length()>0) {
            cursor = db.rawQuery("SELECT name, phone, mail FROM " + Info.TABLE + " WHERE " + Info.KEY_mail + "='"
                    + mail + "';", null);

            while (cursor.moveToNext()) {
                name = cursor.getString(0);
                phone = cursor.getString(1);
                editTextPhone.setText(phone);
                editTextName.setText(name);
            }
        }
        else {
            cursor = db.rawQuery("SELECT name, phone, mail FROM " + Info.TABLE + " WHERE " + Info.KEY_phone + "='"
                    + phone + "';", null);

            while (cursor.moveToNext()) {
                name = cursor.getString(0);
                mail = cursor.getString(2);
                editTextMail.setText(mail);
                editTextName.setText(name);
            }
        }

    }

    public void close(View target) {
       finish();;
    }


}



