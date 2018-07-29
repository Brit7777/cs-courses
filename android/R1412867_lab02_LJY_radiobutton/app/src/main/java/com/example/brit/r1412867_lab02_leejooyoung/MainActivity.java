package com.example.brit.r1412867_lab02_leejooyoung;

import android.support.v7.app.ActionBarActivity;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;

import java.util.Random;

import static java.lang.String.valueOf;

public class MainActivity extends ActionBarActivity {

    RadioGroup group;
    RadioButton button1,button2,button3,button4;
    Button button;
    ImageView image;
    int n;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle("Random Person");

        group = (RadioGroup) findViewById(R.id.radioGroup1);
        button1 = (RadioButton) findViewById(R.id.radio0);
        button2 = (RadioButton) findViewById(R.id.radio1);
        button3 = (RadioButton) findViewById(R.id.radio2);
        button4 = (RadioButton) findViewById(R.id.radio3);

        button1.setOnClickListener(radio_listener);
        button2.setOnClickListener(radio_listener);
        button3.setOnClickListener(radio_listener);
        button4.setOnClickListener(radio_listener);

        image = (ImageView) findViewById(R.id.imageView1);

        Random rand = new Random();
        rand.setSeed(System.currentTimeMillis());
        n = rand.nextInt(3);
        switch (n) {
            case 0:
                image.setImageResource(R.drawable.image0);
                break;
            case 1:
                image.setImageResource(R.drawable.image1);
                break;
            case 2:
                image.setImageResource(R.drawable.image2);
                break;
            case 3:
                image.setImageResource(R.drawable.image3);
                break;
        }
    }

    View.OnClickListener radio_listener = new View.OnClickListener(){
        public void onClick(View arg0){
            switch (n){
                case 0:
                    if (button1.isChecked())
                        Toast.makeText(MainActivity.this, "맞습니다", Toast.LENGTH_SHORT).show();
                    else
                        Toast.makeText(MainActivity.this, "틀립니다", Toast.LENGTH_SHORT).show();
                    break;
                case 1:
                    if (button2.isChecked())
                        Toast.makeText(MainActivity.this, "맞습니다", Toast.LENGTH_SHORT).show();
                    else
                        Toast.makeText(MainActivity.this, "틀립니다", Toast.LENGTH_SHORT).show();
                    break;
                case 2:
                    if (button3.isChecked())
                        Toast.makeText(MainActivity.this, "맞습니다", Toast.LENGTH_SHORT).show();
                    else
                        Toast.makeText(MainActivity.this, "틀립니다", Toast.LENGTH_SHORT).show();
                    break;
                case 3:
                    if (button4.isChecked())
                        Toast.makeText(MainActivity.this, "맞습니다", Toast.LENGTH_SHORT).show();
                    else
                        Toast.makeText(MainActivity.this, "틀립니다", Toast.LENGTH_SHORT).show();
                    break;
            }
        }
    };
}
