package org.linphone;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.ViewGroup;
import android.widget.Chronometer;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip02.R;
import org.apache.commons.lang.StringUtils;
import org.linphone.CallerInfoAsyncQuery;
import org.linphone.ContactsAsyncHelper;
import org.linphone.core.LinphoneCall;

public class CallCardHold extends FrameLayout implements CallerInfoAsyncQuery.OnQueryCompleteListener, ContactsAsyncHelper.OnImageLoadCompleteListener {
    static final int CALLCARD_SIDE_MARGIN_LANDSCAPE = 50;
    private static final boolean DBG = false;
    private static final String LOG_TAG = "PCCW_MOBILE_SIP";
    static final int MAIN_CALLCARD_MIN_HEIGHT_LANDSCAPE = 200;
    static final float TITLE_TEXT_SIZE_LANDSCAPE = 22.0f;
    private ViewGroup callWaitingCallCard;
    public Chronometer mElapsedTimeCallWaitingOnHold;
    private TextView mLabelCallWaitingOnHold;
    public TextView mNameCallWaitingOnHold;
    public TextView mPhoneNumberCallWaitingOnHold;
    public ImageView mPhotoCallWaitingOnHold;
    private ContactsAsyncHelper.ImageTracker mPhotoTracker = new ContactsAsyncHelper.ImageTracker();
    private SlidingCardManager mSlidingCardManager;
    private int mTextColorConnected;
    private int mTextColorDialing;
    private int mTextColorEnded;
    private int mTextColorOnHold;

    public CallCardHold(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        LayoutInflater.from(context).inflate(R.layout.call_card_hold, this, true);
    }

    private void log(String str) {
    }

    private void setSideMargins(ViewGroup viewGroup, int i) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) viewGroup.getLayoutParams();
        marginLayoutParams.leftMargin = i;
        marginLayoutParams.rightMargin = i;
        viewGroup.setLayoutParams(marginLayoutParams);
    }

    private static final boolean showCachedImage(ImageView imageView, CallerInfo callerInfo) {
        if (callerInfo == null || !callerInfo.isCachedPhotoCurrent) {
            return false;
        }
        if (callerInfo.cachedPhoto != null) {
            showImage(imageView, callerInfo.cachedPhoto);
        } else {
            showImage(imageView, (int) R.drawable.default_profile_pic);
        }
        return true;
    }

    private static final void showImage(ImageView imageView, int i) {
        imageView.setImageResource(i);
        imageView.setVisibility(0);
    }

    private static final void showImage(ImageView imageView, Drawable drawable) {
        imageView.setImageDrawable(drawable);
        imageView.setVisibility(0);
    }

    private void updateCallWaitingHoldCardTitleWidgets(LinphoneCall.State state, int i) {
        if (state == LinphoneCall.State.Paused || state == LinphoneCall.State.PausedByRemote || state == LinphoneCall.State.Pausing) {
            this.mElapsedTimeCallWaitingOnHold.setTextColor(this.mTextColorOnHold);
            this.mElapsedTimeCallWaitingOnHold.setBase(SystemClock.elapsedRealtime() - ((long) (i * 1000)));
            this.mElapsedTimeCallWaitingOnHold.start();
            this.mElapsedTimeCallWaitingOnHold.setVisibility(0);
        } else if (state == LinphoneCall.State.IncomingReceived) {
            this.mElapsedTimeCallWaitingOnHold.setVisibility(8);
        } else if (state == LinphoneCall.State.StreamsRunning || state == LinphoneCall.State.Connected) {
            this.mElapsedTimeCallWaitingOnHold.setTextColor(this.mTextColorConnected);
            this.mElapsedTimeCallWaitingOnHold.setBase(SystemClock.elapsedRealtime() - ((long) (i * 1000)));
            this.mElapsedTimeCallWaitingOnHold.start();
            this.mElapsedTimeCallWaitingOnHold.setVisibility(0);
        } else if (state == LinphoneCall.State.OutgoingEarlyMedia || state == LinphoneCall.State.OutgoingInit || state == LinphoneCall.State.OutgoingProgress || state == LinphoneCall.State.OutgoingRinging) {
            this.mElapsedTimeCallWaitingOnHold.setVisibility(8);
        } else if (state == LinphoneCall.State.CallEnd || state == LinphoneCall.State.Error) {
            this.mElapsedTimeCallWaitingOnHold.setTextColor(this.mTextColorEnded);
            this.mElapsedTimeCallWaitingOnHold.stop();
        }
    }

    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        if (this.mSlidingCardManager == null) {
            return true;
        }
        this.mSlidingCardManager.handleCallCardTouchEvent(motionEvent);
        return true;
    }

    public void displayCallWaitingHoldCallStatus(LinphoneCall.State state, int i) {
        updateCallWaitingHoldCardTitleWidgets(state, i);
    }

    public void displayCallWaitingLayout() {
        this.callWaitingCallCard.setVisibility(0);
    }

    public void displayMainCallLayout() {
        this.callWaitingCallCard.setVisibility(8);
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.callWaitingCallCard = (ViewGroup) findViewById(R.id.call_card_person_hold);
        this.mTextColorDialing = getResources().getColor(R.color.incall_textDailing);
        this.mTextColorConnected = getResources().getColor(R.color.incall_textConnected);
        this.mTextColorEnded = getResources().getColor(R.color.incall_textEnded);
        this.mTextColorOnHold = getResources().getColor(R.color.incall_textOnHold);
        this.mPhotoCallWaitingOnHold = (ImageView) findViewById(R.id.photo_call_waiting_hold);
        this.mNameCallWaitingOnHold = (TextView) findViewById(R.id.name_call_waiting_hold);
        this.mPhoneNumberCallWaitingOnHold = (TextView) findViewById(R.id.phoneNumber_call_waiting_hold);
        this.mLabelCallWaitingOnHold = (TextView) findViewById(R.id.label_call_waiting_hold);
        this.mElapsedTimeCallWaitingOnHold = (Chronometer) findViewById(R.id.elapsedTime_call_waiting_hold);
    }

    public void onImageLoadComplete(int i, Object obj, ImageView imageView, boolean z) {
    }

    public void onQueryComplete(int i, Object obj, CallerInfo callerInfo) {
    }

    public void reset() {
    }

    public void setSlidingCardManager(SlidingCardManager slidingCardManager) {
        this.mSlidingCardManager = slidingCardManager;
    }

    public void update(int i, int i2, int i3, int i4) {
        setPadding(0, i2, 0, 0);
    }

    public void updateCallWaitingOnHoldCallCardInfo(String str, String str2, String str3, Drawable drawable) {
        if (StringUtils.isNotBlank(str2)) {
            this.mNameCallWaitingOnHold.setText(str2);
        } else if (str.equals(CallerInfo.CONFERENCE_NUMBER)) {
            this.mNameCallWaitingOnHold.setText(R.string.conference);
        } else {
            this.mNameCallWaitingOnHold.setText(R.string.unknown);
        }
        if (!StringUtils.isNotBlank(str)) {
            this.mPhoneNumberCallWaitingOnHold.setText(R.string.unknown);
        } else if (str.equals(CallerInfo.CONFERENCE_NUMBER)) {
            this.mPhoneNumberCallWaitingOnHold.setText("");
        } else {
            String shouldRestoreMapPhoneNumber = MobileSipService.getInstance().shouldRestoreMapPhoneNumber(str);
            TextView textView = this.mPhoneNumberCallWaitingOnHold;
            if (shouldRestoreMapPhoneNumber == null) {
                shouldRestoreMapPhoneNumber = str;
            }
            textView.setText(shouldRestoreMapPhoneNumber);
        }
        if (StringUtils.isNotBlank(str3)) {
            this.mLabelCallWaitingOnHold.setText(str3);
            this.mLabelCallWaitingOnHold.setVisibility(0);
        } else {
            this.mLabelCallWaitingOnHold.setText("");
            this.mLabelCallWaitingOnHold.setVisibility(8);
        }
        if (drawable != null) {
            this.mPhotoCallWaitingOnHold.setImageDrawable(drawable);
            this.mPhotoCallWaitingOnHold.setVisibility(0);
        } else if (str.equals(CallerInfo.CONFERENCE_NUMBER)) {
            this.mPhotoCallWaitingOnHold.setImageResource(R.drawable.default_conference_pic);
            this.mPhotoCallWaitingOnHold.setVisibility(0);
        } else {
            this.mPhotoCallWaitingOnHold.setImageResource(R.drawable.default_profile_pic);
            this.mPhotoCallWaitingOnHold.setVisibility(0);
        }
    }
}
