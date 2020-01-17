package com.pccw.android.common.widget;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import com.pccw.sms.bean.SMSConstants;

public class ColorIcon extends ImageView {
    private Bitmap bmp_foreground = null;
    ColorFilter colorFilter;
    private Context context;
    private Paint paint = new Paint();
    private int viewHeight;
    private int viewWidth;

    public ColorIcon(Context context2, AttributeSet attributeSet) {
        super(context2, attributeSet);
        this.context = context2;
        setBackgroundColor(0);
    }

    public static Bitmap drawableToBitmap(Drawable drawable) {
        int intrinsicWidth = drawable.getIntrinsicWidth();
        int intrinsicHeight = drawable.getIntrinsicHeight();
        Bitmap createBitmap = Bitmap.createBitmap(intrinsicWidth, intrinsicHeight, drawable.getOpacity() != -1 ? Bitmap.Config.ARGB_8888 : Bitmap.Config.RGB_565);
        Canvas canvas = new Canvas(createBitmap);
        drawable.setBounds(0, 0, intrinsicWidth, intrinsicHeight);
        drawable.draw(canvas);
        return createBitmap;
    }

    private void init() {
        this.paint = new Paint();
    }

    private void loadBitmap() {
        if (getDrawable() instanceof StateListDrawable) {
            StateListDrawable stateListDrawable = (StateListDrawable) getDrawable();
            if (stateListDrawable != null) {
                this.bmp_foreground = drawableToBitmap(stateListDrawable.getCurrent());
                return;
            }
            return;
        }
        BitmapDrawable bitmapDrawable = (BitmapDrawable) getDrawable();
        if (bitmapDrawable != null) {
            this.bmp_foreground = bitmapDrawable.getBitmap();
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
        return View.MeasureSpec.getMode(i) == 1073741824 ? View.MeasureSpec.getSize(i) : this.viewWidth;
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        loadBitmap();
        if (this.bmp_foreground == null || this.colorFilter == SMSConstants.cf_white) {
            super.onDraw(canvas);
            return;
        }
        this.paint.setColorFilter(this.colorFilter);
        canvas.drawBitmap(this.bmp_foreground, 0.0f, 0.0f, this.paint);
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        int measureWidth = measureWidth(i);
        int measureHeight = measureHeight(i2, i);
        loadBitmap();
        if (this.bmp_foreground != null) {
            this.viewWidth = this.bmp_foreground.getWidth();
            this.viewHeight = this.bmp_foreground.getHeight();
        } else {
            this.viewWidth = measureWidth;
            this.viewHeight = measureHeight;
        }
        setMeasuredDimension(this.viewWidth, this.viewHeight);
        init();
    }

    public void setIconAttr(ColorFilter colorFilter2) {
        loadBitmap();
        this.colorFilter = colorFilter2;
    }
}
