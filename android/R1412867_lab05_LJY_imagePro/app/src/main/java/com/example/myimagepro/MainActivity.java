package com.example.myimagepro;

import android.app.Activity;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.widget.ImageView;

public class MainActivity extends Activity {

	private int currentAngle = 0;
	private ImageView img;
	private Bitmap bmp;
	private Bitmap output;
	private static float mAngle = 0.0F;
	private static float mScaleX = 0.3F;
	private static float mScaleY = 0.3F;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		img = (ImageView) findViewById(R.id.imageView1);
		BitmapDrawable abmp = (BitmapDrawable) img.getDrawable();
		bmp = abmp.getBitmap();

	}

	public void gray(View view) {
		output = Bitmap.createBitmap(bmp.getWidth(), bmp.getHeight(),
				bmp.getConfig());

		for (int i = 0; i < bmp.getWidth(); i++) {
			for (int j = 0; j < bmp.getHeight(); j++) {
				int p = bmp.getPixel(i, j);
				int r = Color.red(p);
				int g = Color.green(p);
				int b = Color.blue(p);

				r = g = b = (int) ((r + g + b) / 3.0);
				output.setPixel(i, j, Color.argb(Color.alpha(p), r, g, b));
			}
		}
		img.setImageBitmap(output);
	}

	public void brightup(View view) {
		output = Bitmap.createBitmap(bmp.getWidth(), bmp.getHeight(),
				bmp.getConfig());

		for (int i = 0; i < bmp.getWidth(); i++) {
			for (int j = 0; j < bmp.getHeight(); j++) {
				int p = bmp.getPixel(i, j);
				int r = Color.red(p);
				int g = Color.green(p);
				int b = Color.blue(p);

				r += 50;
				g += 50;
				b += 50;
				if (r > 255)
					r = 255;
				if (g > 255)
					g = 255;
				if (b > 255)
					b = 255;
				output.setPixel(i, j, Color.argb(Color.alpha(p), r, g, b));
			}
		}
		img.setImageBitmap(output);
	}

	public void brightdown(View view) {
		output = Bitmap.createBitmap(bmp.getWidth(), bmp.getHeight(),
				bmp.getConfig());

		for (int i = 0; i < bmp.getWidth(); i++) {
			for (int j = 0; j < bmp.getHeight(); j++) {
				int p = bmp.getPixel(i, j);
				int r = Color.red(p);
				int g = Color.green(p);
				int b = Color.blue(p);

				r -= 50;
				g -= 50;
				b -= 50;
				if (r < 0)
					r = 0;
				if (g < 0)
					g = 0;
				if (b < 0)
					b = 0;
				output.setPixel(i, j, Color.argb(Color.alpha(p), r, g, b));
			}
		}

		img.setImageBitmap(output);
	}

	public void reverse(View view) {
		output = Bitmap.createBitmap(bmp.getWidth(), bmp.getHeight(),
				bmp.getConfig());

		for (int i = 0; i < bmp.getWidth(); i++) {
			for (int j = 0; j < bmp.getHeight(); j++) {
				int p = bmp.getPixel(i, j);
				int r = Color.red(p);
				int g = Color.green(p);
				int b = Color.blue(p);

				r = 255 - r;
				g = 255 - g;
				b = 255 - b;
				output.setPixel(i, j, Color.argb(Color.alpha(p), r, g, b));
			}
		}

		img.setImageBitmap(output);
	}


	public void scaleup(View v) {
		mScaleX += 0.1f;
		mScaleY += 0.1f;

		Matrix mat = new Matrix();
		mat.setRotate(mAngle);
		mat.preScale(mScaleX, mScaleY);

		Bitmap scaleUp = Bitmap.createBitmap(bmp, 0, 0, bmp.getWidth(), bmp.getHeight(), mat , true);
		img.setImageBitmap(scaleUp);

	}

	public void scaledown(View v) {
		mScaleX -= 0.1f;
		mScaleY -= 0.1f;

		Matrix mat = new Matrix();
		mat.setRotate(mAngle);
		mat.preScale(mScaleX, mScaleY);

		Bitmap scaleUp = Bitmap.createBitmap(bmp, 0, 0, bmp.getWidth(), bmp.getHeight(), mat , true);
		img.setImageBitmap(scaleUp);

	}

	public void rotate(View v) {

		Matrix rotateMatrix = new Matrix();
		currentAngle += 90;
		rotateMatrix.postRotate(currentAngle); //-360~360

		output = Bitmap.createBitmap(bmp, 0, 0,
				bmp.getWidth(), bmp.getHeight(), rotateMatrix, false);

		img.setImageBitmap(output);

	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}