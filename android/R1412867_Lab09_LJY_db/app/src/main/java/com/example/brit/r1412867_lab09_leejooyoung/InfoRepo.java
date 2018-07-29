package com.example.brit.r1412867_lab09_leejooyoung;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

import java.util.ArrayList;
import java.util.HashMap;

public class InfoRepo {
    private DBHelper dbHelper;

    public InfoRepo(Context context) {
        dbHelper = new DBHelper(context);
    }

    public int insert(Info info) {
        SQLiteDatabase db = dbHelper.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(Info.KEY_mail, info.mail);
        values.put(Info.KEY_phone, info.phone);
        values.put(Info.KEY_name, info.name);

        long movie_Id = db.insert(Info.TABLE, null, values);
        db.close();
        return (int) movie_Id;
    }

    public void delete(int movie_Id) {

        SQLiteDatabase db = dbHelper.getWritableDatabase();
        db.delete(Info.TABLE, Info.KEY_ID + "= ?", new String[] { String.valueOf(movie_Id) });
        db.close();
    }

    public void update(Info info) {

        SQLiteDatabase db = dbHelper.getWritableDatabase();
        ContentValues values = new ContentValues();

        values.put(Info.KEY_mail, info.mail);
        values.put(Info.KEY_phone, info.phone);
        values.put(Info.KEY_name, info.name);

        db.update(Info.TABLE, values, Info.KEY_ID + "= ?", new String[] { String.valueOf(info.info_ID) });
        db.close();
    }

    public ArrayList<HashMap<String, String>> getInfoList() {
        SQLiteDatabase db = dbHelper.getReadableDatabase();
        String selectQuery =  "SELECT  " +
                Info.KEY_ID + "," +
                Info.KEY_name + "," +
                Info.KEY_phone + "," +
                Info.KEY_mail +
                " FROM " + Info.TABLE;

        ArrayList<HashMap<String, String>> movieList = new ArrayList<HashMap<String, String>>();

        Cursor cursor = db.rawQuery(selectQuery, null);

        if (cursor.moveToFirst()) {
            do {
                HashMap<String, String> movie = new HashMap<String, String>();
                movie.put("id", cursor.getString(cursor.getColumnIndex(Info.KEY_ID)));
                movie.put("name", cursor.getString(cursor.getColumnIndex(Info.KEY_name)));
                movieList.add(movie);

            } while (cursor.moveToNext());
        }

        cursor.close();
        db.close();
        return movieList;

    }

    public Info getInfoById(int Id){
        SQLiteDatabase db = dbHelper.getReadableDatabase();
        String selectQuery =  "SELECT  " +
                Info.KEY_ID + "," +
                Info.KEY_name + "," +
                Info.KEY_phone + "," +
                Info.KEY_mail +
                " FROM " + Info.TABLE
                + " WHERE " +
                Info.KEY_ID + "=?";

        Info info = new Info();
        Cursor cursor = db.rawQuery(selectQuery, new String[] { String.valueOf(Id) } );

        if (cursor.moveToFirst()) {
            do {
                info.info_ID =cursor.getInt(cursor.getColumnIndex(Info.KEY_ID));
                info.name =cursor.getString(cursor.getColumnIndex(Info.KEY_name));
                info.phone  =cursor.getInt(cursor.getColumnIndex(Info.KEY_phone));
                info.mail =cursor.getString(cursor.getColumnIndex(Info.KEY_mail));

            } while (cursor.moveToNext());
        }

        cursor.close();
        db.close();
        return info;
    }

}