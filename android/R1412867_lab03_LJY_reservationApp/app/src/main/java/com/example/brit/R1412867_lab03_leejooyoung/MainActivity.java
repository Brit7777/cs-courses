package com.example.brit.R1412867_lab03_leejooyoung;

import android.content.Context;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.CalendarView;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TimePicker;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    private TimePicker tPicker;
    private CalendarView calView;
    private EditText text1,text2;
    private Button btnCall;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        tPicker = (TimePicker) findViewById(R.id.timePicker1);
        calView=(CalendarView)findViewById(R.id.calendarView1);
        text1 = (EditText)findViewById(R.id.editText1);
        text2 = (EditText)findViewById(R.id.editText2);
        btnCall = (Button) findViewById(R.id.Button1);
        setTitle("Reservation");

        calView.setOnDateChangeListener(new CalendarView.OnDateChangeListener() {
            @Override
            public void onSelectedDayChange(CalendarView view, int year, int month, int dayOfMonth) {
                text1.setText(" "+year+" : "+(month+1)+" : "+dayOfMonth);
            }
        });

    tPicker.setOnTimeChangedListener(new TimePicker.OnTimeChangedListener() {
        @Override
        public void onTimeChanged(TimePicker view, int hourOfDay, int minute) {
            text2.setText(" " + hourOfDay+" : "+minute);
        }
    });


        btnCall.setOnClickListener(new View.OnClickListener() {

            public void onClick(View v) {

                try {

                    LinearLayout linearLayout = (LinearLayout) findViewById(R.id.inflatedLayout);
                    LayoutInflater inflater = (LayoutInflater) getSystemService( Context.LAYOUT_INFLATER_SERVICE );


                    LinearLayout linearLayout1 = (LinearLayout) inflater.inflate(R.layout.layout_edit2, null);
                    linearLayout.addView(linearLayout1);
                    setContentView(linearLayout);

                    text1 = (EditText)findViewById(R.id.editText4);
                    text2 = (EditText)findViewById(R.id.editText5);
                    btnCall = (Button) findViewById(R.id.Button2);


                } catch (Exception ex) {

                    Toast.makeText(getBaseContext(), ex.getMessage(), Toast.LENGTH_LONG).show();

                }

            }

        });

    }

}
