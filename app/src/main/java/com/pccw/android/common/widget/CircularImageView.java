package com.pccw.android.common.widget;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;

import com.pccw.mobile.sip02.R;

public class CircularImageView extends android.support.v7.widget.AppCompatImageView implements CrossFadeAnimation.CrossFadeAnimationListener {
    private int borderWidth = 2;
    private CrossFadeAnimation crossFadeAnimation;
    private Bitmap image;
    private boolean mBlockLayout;
    private Paint paint;
    private Paint paintBorder;
    private BitmapShader shader;
    private Bitmap updateBitmap = null;
    private int viewHeight;
    private int viewWidth;

    public CircularImageView(Context context) {
        super(context);
        setup();
    }

    public CircularImageView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setup();
    }

    public CircularImageView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        if (!isInEditMode()) {
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.CircularImageView);
            int i2 = obtainStyledAttributes.getInt(R.styleable.CircularImageView_borderWidth, this.borderWidth);
            obtainStyledAttributes.recycle();
            this.borderWidth = i2;
            setup();
        }
    }

    private void loadBitmap() {
        BitmapDrawable bitmapDrawable = (BitmapDrawable) getDrawable();
        if (bitmapDrawable != null) {
            this.image = bitmapDrawable.getBitmap();
        }
    }

    private int measureHeight(int i, int i2) {
        int mode = View.MeasureSpec.getMode(i);
        int size = View.MeasureSpec.getSize(i);
        if (mode != 1073741824) {
            size = this.viewHeight;
        }
        return size + 2;
    }

    private int measureWidth(int i) {
        return View.MeasureSpec.getMode(i) == MeasureSpec.EXACTLY ? View.MeasureSpec.getSize(i) : this.viewWidth;
    }

    @SuppressLint({"NewApi"})
    private void setup() {
        this.paint = new Paint();
        this.paint.setAntiAlias(true);
        this.paintBorder = new Paint();
        setBorderColor(getResources().getColor(R.color.corp_blue));
        setBorderWidth(this.borderWidth);
        this.paintBorder.setAntiAlias(true);
        if (Build.VERSION.SDK_INT >= 11) {
            setLayerType(1, this.paintBorder);
        }
        this.paintBorder.setShadowLayer(1.5f, 0.0f, 0.0f, -12303292);
    }

    public void animationEnds() {
        setImageBitmap(this.updateBitmap);
    }

    @SuppressLint({"DrawAllocation"})
    public void onDraw(Canvas canvas) {
        loadBitmap();
        if (this.image != null) {
            this.shader = new BitmapShader(Bitmap.createScaledBitmap(this.image, getWidth(), getHeight(), true), Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
            this.paint.setShader(this.shader);
            int i = this.viewWidth / 2;
            canvas.drawCircle((float) (this.borderWidth + i), (float) (this.borderWidth + i), ((float) (this.borderWidth + i)) - 4.0f, this.paintBorder);
            canvas.drawCircle((float) (this.borderWidth + i), (float) (this.borderWidth + i), ((float) i) - 4.0f, this.paint);
        }
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        int measureWidth = measureWidth(i);
        int measureHeight = measureHeight(i2, i);
        this.viewWidth = measureWidth - (this.borderWidth * 2);
        this.viewHeight = measureHeight - (this.borderWidth * 2);
        setMeasuredDimension(measureWidth, measureHeight);
    }

    public void requestLayout() {
        if (!this.mBlockLayout) {
            super.requestLayout();
        }
    }

    public void setBorderColor(int i) {
        if (this.paintBorder != null) {
            this.paintBorder.setColor(i);
        }
        invalidate();
    }

    public void setBorderWidth(int i) {
        this.borderWidth = i;
        invalidate();
    }

    public void setImageBitmap(Bitmap bitmap) {
        this.mBlockLayout = true;
        super.setImageBitmap(bitmap);
        this.mBlockLayout = false;
    }

    public void setImageDrawable(Drawable drawable) {
        this.mBlockLayout = true;
        super.setImageDrawable(drawable);
        this.mBlockLayout = false;
    }

    public void setImageResource(int i) {
        this.mBlockLayout = true;
        super.setImageResource(i);
        this.mBlockLayout = false;
    }

    public void setImageURI(Uri uri) {
        this.mBlockLayout = true;
        super.setImageURI(uri);
        this.mBlockLayout = false;
    }

    public void updateImage(Bitmap bitmap) {
        this.updateBitmap = bitmap;
        this.crossFadeAnimation.fadeOut();
    }
}
