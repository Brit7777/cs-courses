package com.example.brit.r1412867_lab09_leejooyoung;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class DBHelper extends SQLiteOpenHelper {

    private static final int DATABASE_VERSION = 1;

    private static final String DATABASE_NAME = "infos.db";

    public DBHelper(Context context ) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {

        String CREATE_TABLE_STUDENT = "CREATE TABLE " + Info.TABLE  + "("
                + Info.KEY_ID  + " INTEGER PRIMARY KEY AUTOINCREMENT ,"
                + Info.KEY_name + " TEXT, "
                + Info.KEY_phone + " INTEGER, "
                + Info.KEY_mail + " TEXT )";

        db.execSQL(CREATE_TABLE_STUDENT);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS " + Info.TABLE);

        onCreate(db);
    }
}