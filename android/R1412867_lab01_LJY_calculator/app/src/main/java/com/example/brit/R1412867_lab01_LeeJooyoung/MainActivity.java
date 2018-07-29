package com.example.brit.R1412867_lab01_LeeJooyoung;

        import android.app.Activity;
        import android.os.Bundle;
        import android.view.View;
        import android.view.View.OnClickListener;
        import android.widget.Button;
        import android.widget.TextView;
        import android.widget.Toast;

public class MainActivity extends Activity {
    /* 뒤로가기 부분 */
    private final long FINISH_INTERVAL_TIME = 2000;
    private long backPressedTime = 0;

    /* 계산기 부분 */
    private CalcEngine calen;
    private Button one;
    private Button two;
    private Button three;
    private Button four;
    private Button five;
    private Button six;
    private Button seven;
    private Button eight;
    private Button nine;
    private Button zero;
    private Button div;
    private Button add;
    private Button min;
    private Button mul;
    private Button equal;
    private Button reset;


    private TextView et;
    private TextView etTmp;

    private String Exp = "";
    private StringBuilder et_str;
    private StringBuilder etTmp_str;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

		/* 각 버튼과 연산구간을 연결시켜줌 */
        zero = (Button)findViewById(R.id.btn0);
        one = (Button)findViewById(R.id.btn1);
        two = (Button)findViewById(R.id.btn2);
        three = (Button)findViewById(R.id.btn3);
        four = (Button)findViewById(R.id.btn4);
        five = (Button)findViewById(R.id.btn5);
        six = (Button)findViewById(R.id.btn6);
        seven = (Button)findViewById(R.id.btn7);
        eight = (Button)findViewById(R.id.btn8);
        nine = (Button)findViewById(R.id.btn9);
        div = (Button)findViewById(R.id.btn_div);
        add = (Button)findViewById(R.id.btn_add);
        min = (Button)findViewById(R.id.btn_sub);
        mul = (Button)findViewById(R.id.btn_mul);
        equal = (Button)findViewById(R.id.btn_equal);
        reset = (Button)findViewById(R.id.btn_clear);


        etTmp = (TextView)findViewById(R.id.main_txtTmp);
        et = (TextView) findViewById(R.id.main_editText1);
        etTmp.setText("");
        et.setText("");
		/* 클릭리스너 생성 */
        OnClickListener numClick = new OnClickListener() {
            // 숫자 0 부터 9까지는 무조건 화면에 나오게 됩니다.
            // 연산식은 숫자가 입력이 한번이상 되어야 연산 입력이 가능케됩니다.
            // (detect_input 변수가 판단)

            @Override
            public void onClick(View v) {
                if(v.equals(one)){
                    et.setText(et.getText() + "1");
                }else if(v.equals(two)){
                    et.setText(et.getText() + "2");
                }else if(v.equals(three)){
                    et.setText(et.getText() + "3");
                }else if(v.equals(four)){
                    et.setText(et.getText() + "4");
                }else if(v.equals(five)){
                    et.setText(et.getText() + "5");
                }else if(v.equals(six)){
                    et.setText(et.getText() + "6");
                }else if(v.equals(seven)){
                    et.setText(et.getText() + "7");
                }else if(v.equals(eight)){
                    et.setText(et.getText() + "8");
                }else if(v.equals(nine)){
                    et.setText(et.getText() + "9");
                }else if(v.equals(zero)){
                    et.setText(et.getText() + "0");
                }
            }
        };
        OnClickListener function = new OnClickListener(){
            @Override
            public void onClick(View v) {
                if(v.equals(div)){
                    etTmp.setText(etTmp.getText().toString() + et.getText().toString() + "/");
                    et.setText("");
                }else if(v.equals(add)){
                    etTmp.setText(etTmp.getText().toString() + et.getText().toString() + "+");
                    et.setText("");
                }else if(v.equals(min)){
                    etTmp.setText(etTmp.getText().toString() + et.getText().toString() + "-");
                    et.setText("");
                }else if(v.equals(mul)){
                    etTmp.setText(etTmp.getText().toString() + et.getText().toString() + "*");
                    et.setText("");
                }else if(v.equals(reset)){
                    et.setText("");
                    etTmp.setText("");
                    Toast.makeText(getApplicationContext(), "값이 초기화 되었습니다.", Toast.LENGTH_SHORT).show();
                }else if(v.equals(equal)){
                    etTmp.setText(etTmp.getText().toString() + et.getText().toString());
                    Exp = etTmp.getText().toString();
                    calen = new CalcEngine(Exp);
                    et.setText(calen.result());
                }
            }
        };
        zero.setOnClickListener(numClick);
        one.setOnClickListener(numClick);
        two.setOnClickListener(numClick);
        three.setOnClickListener(numClick);
        four.setOnClickListener(numClick);
        five.setOnClickListener(numClick);
        six.setOnClickListener(numClick);
        seven.setOnClickListener(numClick);
        eight.setOnClickListener(numClick);
        nine.setOnClickListener(numClick);
        div.setOnClickListener(function);
        add.setOnClickListener(function);
        min.setOnClickListener(function);
        mul.setOnClickListener(function);
        equal.setOnClickListener(function);
        reset.setOnClickListener(function);
    }



    @Override
    public void onBackPressed(){
        long tempTime = System.currentTimeMillis();
        long intervalTime = tempTime - backPressedTime;

        if(intervalTime >= 0 && FINISH_INTERVAL_TIME >= intervalTime){
            super.onBackPressed();
        }
        else{
            backPressedTime = tempTime;
            Toast.makeText(getApplicationContext(), "뒤로 버튼을 한번 더 누르시면 종료됩니다.", Toast.LENGTH_SHORT).show();
        }
    }

}


