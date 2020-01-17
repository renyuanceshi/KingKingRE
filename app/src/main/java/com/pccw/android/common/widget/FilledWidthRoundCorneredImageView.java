package com.pccw.android.common.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import com.pccw.mobile.sip02.R;

public class FilledWidthRoundCorneredImageView extends ImageView {
    private static float radius = 20.0f;
    private boolean isFilled = false;
    private int viewHeight;
    private int viewWidth;

    public FilledWidthRoundCorneredImageView(Context context) {
        super(context);
    }

    public FilledWidthRoundCorneredImageView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setRadius(context, attributeSet);
    }

    public FilledWidthRoundCorneredImageView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        setRadius(context, attributeSet);
    }

    private void setRadius(Context context, AttributeSet attributeSet) {
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.FilledWidthRoundCorneredImageView);
        float f = obtainStyledAttributes.getFloat(0, radius);
        boolean z = obtainStyledAttributes.getBoolean(1, false);
        obtainStyledAttributes.recycle();
        setScaleType(ImageView.ScaleType.CENTER_CROP);
        radius = Float.valueOf(f).floatValue();
        this.isFilled = z;
    }

    public void onDraw(Canvas canvas) {
        BitmapDrawable bitmapDrawable = (BitmapDrawable) getDrawable();
        Bitmap bitmap = bitmapDrawable != null ? bitmapDrawable.getBitmap() : null;
        if (bitmap != null) {
            Paint paint = new Paint();
            paint.setAntiAlias(true);
            paint.setShader(new BitmapShader(Bitmap.createScaledBitmap(bitmap, this.viewWidth, this.viewHeight, true), Shader.TileMode.CLAMP, Shader.TileMode.CLAMP));
            RectF rectF = new RectF(0.0f, 0.0f, (float) this.viewWidth, (float) this.viewHeight);
            if (((double) radius) != 0.0d) {
                canvas.drawRoundRect(rectF, radius, radius, paint);
            } else {
                canvas.drawRect(rectF, paint);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        this.viewWidth = View.MeasureSpec.getSize(i);
        this.viewHeight = View.MeasureSpec.getSize(i2);
        if (this.viewHeight < ((int) getResources().getDimension(R.dimen.profile_head_chat_view))) {
            this.viewHeight = (int) getResources().getDimension(R.dimen.profile_head_chat_view);
        }
        this.viewWidth = (this.viewHeight * getDrawable().getIntrinsicWidth()) / getDrawable().getIntrinsicHeight();
        setMeasuredDimension(this.viewWidth, this.viewHeight);
    }
}
