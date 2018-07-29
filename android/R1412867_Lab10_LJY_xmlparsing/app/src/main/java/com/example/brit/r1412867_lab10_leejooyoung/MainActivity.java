package com.example.brit.r1412867_lab10_leejooyoung;

import android.os.Environment;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.util.Xml;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;
import org.xmlpull.v1.XmlSerializer;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    EditText name,sex,number,email;
    Button button1,button2;
    File newxmlfile;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        name = (EditText)findViewById(R.id.name);
        sex = (EditText)findViewById(R.id.sex);
        number = (EditText)findViewById(R.id.number);
        email = (EditText)findViewById(R.id.email);
        button1 = (Button)findViewById(R.id.button1);
        button2 = (Button)findViewById(R.id.button2);
        button1.setOnClickListener(this);
        button2.setOnClickListener(this);


    }


    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.button1:
                //create a new file called "in.xml" in the SD card
                newxmlfile = new File(getExternalFilesDir(null), "in.xml");

                //we have to bind the new file with a FileOutputStream
                FileOutputStream fileos = null;
                try {
                    fileos = new FileOutputStream(newxmlfile);
                } catch (FileNotFoundException e) {
                    Log.e("FileNotFoundException", "can't create FileOutputStream");
                }
                //we create a XmlSerializer in order to write xml data
                XmlSerializer serializer = Xml.newSerializer();
                try {
                    //we set the FileOutputStream as output for the serializer, using UTF-8 encoding
                    serializer.setOutput(fileos, "UTF-8");
                    //Write <?xml declaration with encoding (if encoding not null) and standalone flag (if standalone not null)
                    serializer.startDocument(null, Boolean.valueOf(true));
                    //set indentation option
                    serializer.setFeature("http://xmlpull.org/v1/doc/features.html#indent-output", true);
                    //start a tag called "root"
                    serializer.startTag(null, "info");

                    //Name tag
                    serializer.startTag(null, "name");
                    //write some text inside
                    serializer.text(name.getText().toString());
                    serializer.endTag(null, "name");

                    //sex tag
                    serializer.startTag(null, "sex");
                    //write some text inside
                    serializer.text(sex.getText().toString());
                    serializer.endTag(null, "sex");

                    //phone tag
                    serializer.startTag(null, "phone");
                    //write some text inside
                    serializer.text(number.getText().toString());
                    serializer.endTag(null, "phone");

                    //email tag
                    serializer.startTag(null, "email");
                    //write some text inside
                    serializer.text(email.getText().toString());
                    serializer.endTag(null, "email");

                    serializer.endTag(null, "info");
                    serializer.endDocument();
                    //write xml data into the FileOutputStream
                    serializer.flush();
                    //finally we close the file stream
                    fileos.close();


                    Toast toast = Toast.makeText(this, "successfully stored!",
                            Toast.LENGTH_SHORT);
                    toast.show();
                } catch (Exception e) {
                    Log.e("Exception", "error occurred while creating xml file");
                }
                name.setText("");
                sex.setText("");
                number.setText("");
                email.setText("");
                break;

            case R.id.button2:
                setContentView(R.layout.activity_sub);
                EditText findName = (EditText) findViewById(R.id.edit1);
                TextView text = (TextView) findViewById(R.id.textView1);
                Button button1 = (Button) findViewById(R.id.btn1);
                break;
        }
    }

    public void onButtonClick(View view) {
        String result = " ";
        setContentView(R.layout.activity_sub);
        EditText findName = (EditText) findViewById(R.id.edit1);
        TextView text = (TextView) findViewById(R.id.textView1);
        Button button1 = (Button) findViewById(R.id.btn1);
                while (text.getText().toString() != null) {
                    newxmlfile = new File(getExternalFilesDir(null), "in.xml");
                    try {
                        InputStream in = new BufferedInputStream(new FileInputStream(newxmlfile));
                        XmlPullParserFactory xmlFactoryObject = XmlPullParserFactory.newInstance();
                        XmlPullParser myparser = xmlFactoryObject.newPullParser();
                        myparser.setInput(in, null);

                        int event = myparser.getEventType();
                        while (event != XmlPullParser.END_DOCUMENT) {
                            String tag = myparser.getName();
                            String name = myparser.getText();
                            if (name == findName.getText().toString()) {
                                switch (event) {
                                    case XmlPullParser.START_TAG:
                                        if (tag == "name")
                                            result = "이름: ";
                                        if (tag == "sex")
                                            result += "성별: ";
                                        if (tag == "phone")
                                            result += "전화번호: ";
                                        if (tag == "email")
                                            result += "이메일: ";
                                        break;
                                    case XmlPullParser.TEXT:
                                        result += name + "\n";
                                        break;
                                    case XmlPullParser.END_TAG:
                                        break;
                                }
                            }
                            event = myparser.next();
                        }

                        text.setText(result);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }


                }

        }
    }





