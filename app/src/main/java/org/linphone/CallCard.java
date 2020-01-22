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
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.pccw.mobile.sip.service.MobileSipService;

import org.apache.commons.lang3.StringUtils;
import org.linphone.core.LinphoneCall;

public class CallCard extends FrameLayout implements CallerInfoAsyncQuery.OnQueryCompleteListener, ContactsAsyncHelper.OnImageLoadCompleteListener {
    static final int CALLCARD_SIDE_MARGIN_LANDSCAPE = 50;
    private static final boolean DBG = false;
    private static final String LOG_TAG = "PCCW_MOBILE_SIP";
    static final int MAIN_CALLCARD_MIN_HEIGHT_LANDSCAPE = 200;
    static final float TITLE_TEXT_SIZE_LANDSCAPE = 22.0f;
    private ViewGroup callWaitingCallCard;
    public Chronometer mElapsedTime;
    public Chronometer mElapsedTimeCallWaitingMain;
    private TextView mLabel;
    private TextView mLabelCallWaitingMain;
    private TextView mLowerTitle;
    private ViewGroup mMainCallCard;
    public TextView mName;
    public TextView mNameCallWaitingMain;
    public TextView mPhoneNumber;
    public TextView mPhoneNumberCallWaitingMain;
    public ImageView mPhoto;
    public ImageView mPhotoCallWaitingMain;
    private ContactsAsyncHelper.ImageTracker mPhotoTracker = new ContactsAsyncHelper.ImageTracker();
    private ImageView mQualityIndiImage;
    private TextView mQualityIndiLabel;
    private RelativeLayout mQualityIndiLayout;
    private TextView mQualityIndiStatus;
    private SlidingCardManager mSlidingCardManager;
    private int mTextColorConnected;
    private int mTextColorDialing;
    private int mTextColorEnded;
    private int mTextColorOnHold;
    private TextView mUpperTitle;
    public ImageView mVideoIcon;
    private ViewGroup singleCallCard;

    public CallCard(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        LayoutInflater.from(context).inflate(R.layout.call_card, this, true);
    }

    private String getTitleForCallCard(LinphoneCall.State state) {
        Context context = getContext();
        if (state == LinphoneCall.State.OutgoingInit || state == LinphoneCall.State.OutgoingInit || state == LinphoneCall.State.OutgoingRinging || state == LinphoneCall.State.OutgoingEarlyMedia) {
            return context.getString(R.string.card_title_dialing);
        }
        if (state == LinphoneCall.State.IncomingReceived) {
            return context.getString(R.string.card_title_incoming_call);
        }
        if (state == LinphoneCall.State.Connected) {
            return context.getString(R.string.card_title_in_progress);
        }
        if (state == LinphoneCall.State.Error) {
            return context.getString(R.string.card_title_call_ended);
        }
        if (state == LinphoneCall.State.CallEnd) {
            return context.getString(R.string.card_title_call_ended);
        }
        if (state == LinphoneCall.State.StreamsRunning) {
            return context.getString(R.string.card_title_in_progress);
        }
        if (state == LinphoneCall.State.Paused || state == LinphoneCall.State.PausedByRemote || state == LinphoneCall.State.Pausing) {
            return context.getString(R.string.card_title_on_hold);
        }
        if (state == LinphoneCall.State.Resuming) {
            return context.getString(R.string.card_title_resuming);
        }
        return null;
    }

    private void log(String str) {
    }

    private void setMainCallCardBackgroundResource(int i) {
        this.mMainCallCard.setBackgroundResource(i);
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

    private void showCallConnected() {
    }

    private void showCallConnecting() {
    }

    private void showCallEnded() {
    }

    private void showCallIncoming() {
    }

    private void showCallOnhold() {
    }

    private static final void showImage(ImageView imageView, int i) {
        imageView.setImageResource(i);
        imageView.setVisibility(View.VISIBLE);
    }

    private static final void showImage(ImageView imageView, Drawable drawable) {
        imageView.setImageDrawable(drawable);
        imageView.setVisibility(View.VISIBLE);
    }

    private void updateCallWaitingMainCardTitleWidgets(LinphoneCall.State state, int i) {
        if (state == LinphoneCall.State.IncomingReceived) {
            this.mElapsedTimeCallWaitingMain.setVisibility(View.GONE);
        } else if (state == LinphoneCall.State.StreamsRunning || state == LinphoneCall.State.Connected || state == LinphoneCall.State.Resuming || state == LinphoneCall.State.Paused || state == LinphoneCall.State.PausedByRemote || state == LinphoneCall.State.Pausing) {
            this.mElapsedTimeCallWaitingMain.setTextColor(this.mTextColorOnHold);
            this.mElapsedTimeCallWaitingMain.setBase(SystemClock.elapsedRealtime() - ((long) (i * 1000)));
            this.mElapsedTimeCallWaitingMain.start();
            this.mElapsedTimeCallWaitingMain.setVisibility(View.VISIBLE);
        } else if (state == LinphoneCall.State.OutgoingEarlyMedia || state == LinphoneCall.State.OutgoingInit || state == LinphoneCall.State.OutgoingProgress || state == LinphoneCall.State.OutgoingRinging) {
            this.mElapsedTimeCallWaitingMain.setVisibility(View.GONE);
        } else if (state == LinphoneCall.State.CallEnd || state == LinphoneCall.State.Error) {
            this.mElapsedTimeCallWaitingMain.setTextColor(this.mTextColorEnded);
            this.mElapsedTimeCallWaitingMain.stop();
        }
    }

    private void updateMainCardTitleWidgets(LinphoneCall.State state, int i) {
        if (state == LinphoneCall.State.IncomingReceived) {
            this.mElapsedTime.setVisibility(View.GONE);
        } else if (state == LinphoneCall.State.StreamsRunning || state == LinphoneCall.State.Connected) {
            this.mElapsedTime.setTextColor(this.mTextColorConnected);
            this.mElapsedTime.setBase(SystemClock.elapsedRealtime() - ((long) (i * 1000)));
            this.mElapsedTime.start();
            this.mElapsedTime.setVisibility(View.VISIBLE);
        } else if (state == LinphoneCall.State.OutgoingEarlyMedia || state == LinphoneCall.State.OutgoingInit || state == LinphoneCall.State.OutgoingProgress || state == LinphoneCall.State.OutgoingRinging) {
            this.mElapsedTime.setVisibility(View.GONE);
        } else if (state == LinphoneCall.State.CallEnd || state == LinphoneCall.State.Error) {
            this.mElapsedTime.setTextColor(this.mTextColorEnded);
            this.mElapsedTime.stop();
        }
    }

    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        if (this.mSlidingCardManager == null) {
            return true;
        }
        this.mSlidingCardManager.handleCallCardTouchEvent(motionEvent);
        return true;
    }

    public void displayCallWaitingLayout() {
        this.singleCallCard.setVisibility(View.GONE);
        this.callWaitingCallCard.setVisibility(View.VISIBLE);
    }

    public void displayMainCallLayout() {
        this.singleCallCard.setVisibility(View.VISIBLE);
        this.callWaitingCallCard.setVisibility(View.GONE);
    }

    public void displayMainCallStatus(LinphoneCall.State state, int i, boolean z) {
        String titleForCallCard = getTitleForCallCard(state);
        if (state == LinphoneCall.State.OutgoingInit || state == LinphoneCall.State.OutgoingRinging || state == LinphoneCall.State.OutgoingEarlyMedia) {
            this.mQualityIndiLayout.setVisibility(4);
            this.mUpperTitle.setVisibility(View.GONE);
            this.mUpperTitle.setText("");
            this.mLowerTitle.setText(titleForCallCard);
            this.mLowerTitle.setTextColor(this.mTextColorDialing);
        } else if (state == LinphoneCall.State.OutgoingProgress) {
            this.mQualityIndiLayout.setVisibility(4);
            this.mUpperTitle.setVisibility(View.VISIBLE);
            this.mUpperTitle.setText(titleForCallCard);
            this.mLowerTitle.setText("");
        } else if (state == LinphoneCall.State.IncomingReceived) {
            this.mQualityIndiLayout.setVisibility(4);
            this.mUpperTitle.setVisibility(View.VISIBLE);
            this.mUpperTitle.setText(titleForCallCard);
        } else if (state == LinphoneCall.State.StreamsRunning || state == LinphoneCall.State.Connected) {
            this.mQualityIndiLayout.setVisibility(View.VISIBLE);
            this.mLowerTitle.setText(titleForCallCard);
            this.mLowerTitle.setTextColor(this.mTextColorConnected);
            this.mUpperTitle.setVisibility(View.GONE);
            this.mUpperTitle.setText("");
        } else if (state == LinphoneCall.State.CallEnd || state == LinphoneCall.State.Error) {
            this.mQualityIndiLayout.setVisibility(4);
            this.mLowerTitle.setText(titleForCallCard);
            this.mLowerTitle.setTextColor(this.mTextColorEnded);
            this.mUpperTitle.setVisibility(View.GONE);
            this.mUpperTitle.setText("");
        } else {
            this.mQualityIndiLayout.setVisibility(4);
            this.mUpperTitle.setVisibility(View.VISIBLE);
            this.mUpperTitle.setText(titleForCallCard);
            this.mLowerTitle.setText("");
        }
        if (z) {
            updateMainCardTitleWidgets(state, i);
        } else {
            updateCallWaitingMainCardTitleWidgets(state, i);
        }
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mMainCallCard = (ViewGroup) findViewById(R.id.mainCallCard);
        this.singleCallCard = (ViewGroup) findViewById(R.id.call_card_person);
        this.callWaitingCallCard = (ViewGroup) findViewById(R.id.call_card_person_call_waiting);
        this.mUpperTitle = (TextView) findViewById(R.id.upperTitle);
        this.mLowerTitle = (TextView) findViewById(R.id.lowerTitle);
        this.mElapsedTime = (Chronometer) findViewById(R.id.elapsedTime);
        this.mTextColorDialing = getResources().getColor(R.color.incall_textDailing);
        this.mTextColorConnected = getResources().getColor(R.color.incall_textConnected);
        this.mTextColorEnded = getResources().getColor(R.color.incall_textEnded);
        this.mTextColorOnHold = getResources().getColor(R.color.incall_textOnHold);
        this.mPhoto = (ImageView) findViewById(R.id.photo);
        this.mName = (TextView) findViewById(R.id.name);
        this.mPhoneNumber = (TextView) findViewById(R.id.phoneNumber);
        this.mLabel = (TextView) findViewById(R.id.label);
        this.mVideoIcon = (ImageView) findViewById(R.id.iconVideo);
        this.mVideoIcon.setVisibility(View.GONE);
        this.mQualityIndiLayout = (RelativeLayout) findViewById(R.id.quality_indi_layout);
        this.mQualityIndiImage = (ImageView) findViewById(R.id.quality_indi_status_img);
        this.mQualityIndiLabel = (TextView) findViewById(R.id.quality_indi_label);
        this.mQualityIndiStatus = (TextView) findViewById(R.id.quality_indi_status);
        this.mPhotoCallWaitingMain = (ImageView) findViewById(R.id.photo_call_waiting);
        this.mNameCallWaitingMain = (TextView) findViewById(R.id.name_call_waiting);
        this.mPhoneNumberCallWaitingMain = (TextView) findViewById(R.id.phoneNumber_call_waiting);
        this.mLabelCallWaitingMain = (TextView) findViewById(R.id.label_call_waiting);
        this.mElapsedTimeCallWaitingMain = (Chronometer) findViewById(R.id.elapsedTime_call_waiting);
    }

    public void onImageLoadComplete(int i, Object obj, ImageView imageView, boolean z) {
    }

    public void onQueryComplete(int i, Object obj, CallerInfo callerInfo) {
    }

    public void reset() {
        showCallConnected();
        this.mUpperTitle.setText("");
    }

    public void setSlidingCardManager(SlidingCardManager slidingCardManager) {
        this.mSlidingCardManager = slidingCardManager;
    }

    public void update(int i, int i2, int i3, int i4) {
        setPadding(0, i2, 0, 0);
    }

    public void updateCallCardInfo(String str, String str2, String str3, Drawable drawable) {
        if (StringUtils.isNotBlank(str2)) {
            this.mName.setText(str2);
        } else if (str.equals(CallerInfo.CONFERENCE_NUMBER)) {
            this.mName.setText(R.string.conference);
        } else {
            this.mName.setText(R.string.unknown);
        }
        if (!StringUtils.isNotBlank(str)) {
            this.mPhoneNumber.setText(R.string.unknown);
        } else if (str.equals(CallerInfo.CONFERENCE_NUMBER)) {
            this.mPhoneNumber.setText("");
        } else {
            String shouldRestoreMapPhoneNumber = MobileSipService.getInstance().shouldRestoreMapPhoneNumber(str);
            TextView textView = this.mPhoneNumber;
            if (shouldRestoreMapPhoneNumber == null) {
                shouldRestoreMapPhoneNumber = str;
            }
            textView.setText(shouldRestoreMapPhoneNumber);
        }
        if (StringUtils.isNotBlank(str3)) {
            this.mLabel.setText(str3);
            this.mLabel.setVisibility(View.VISIBLE);
        } else {
            this.mLabel.setText("");
        }
        if (drawable != null) {
            this.mPhoto.setImageDrawable(drawable);
            this.mPhoto.setVisibility(View.VISIBLE);
        } else if (str.equals(CallerInfo.CONFERENCE_NUMBER)) {
            this.mPhoto.setImageResource(R.drawable.default_conference_pic);
            this.mPhoto.setVisibility(View.VISIBLE);
        } else {
            this.mPhoto.setImageResource(R.drawable.default_profile_pic);
            this.mPhoto.setVisibility(View.VISIBLE);
        }
    }

    public void updateCallWaitingMainCallCardInfo(String str, String str2, String str3, Drawable drawable) {
        if (StringUtils.isNotBlank(str2)) {
            this.mNameCallWaitingMain.setText(str2);
        } else if (str.equals(CallerInfo.CONFERENCE_NUMBER)) {
            this.mNameCallWaitingMain.setText(R.string.conference);
        } else {
            this.mNameCallWaitingMain.setText(R.string.unknown);
        }
        if (!StringUtils.isNotBlank(str)) {
            this.mPhoneNumberCallWaitingMain.setText(R.string.unknown);
        } else if (str.equals(CallerInfo.CONFERENCE_NUMBER)) {
            this.mPhoneNumberCallWaitingMain.setText("");
        } else {
            String shouldRestoreMapPhoneNumber = MobileSipService.getInstance().shouldRestoreMapPhoneNumber(str);
            TextView textView = this.mPhoneNumberCallWaitingMain;
            if (shouldRestoreMapPhoneNumber == null) {
                shouldRestoreMapPhoneNumber = str;
            }
            textView.setText(shouldRestoreMapPhoneNumber);
        }
        if (StringUtils.isNotBlank(str3)) {
            this.mLabelCallWaitingMain.setText(str3);
            this.mLabelCallWaitingMain.setVisibility(View.VISIBLE);
        } else {
            this.mLabelCallWaitingMain.setText("");
        }
        if (drawable != null) {
            this.mPhotoCallWaitingMain.setImageDrawable(drawable);
            this.mPhotoCallWaitingMain.setVisibility(View.VISIBLE);
        } else if (str.equals(CallerInfo.CONFERENCE_NUMBER)) {
            this.mPhotoCallWaitingMain.setImageResource(R.drawable.default_conference_pic);
            this.mPhotoCallWaitingMain.setVisibility(View.VISIBLE);
        } else {
            this.mPhotoCallWaitingMain.setImageResource(R.drawable.default_profile_pic);
            this.mPhotoCallWaitingMain.setVisibility(View.VISIBLE);
        }
    }

    public void updateForLandscapeMode() {
        this.mMainCallCard.setMinimumHeight(200);
        setSideMargins(this.mMainCallCard, 50);
        this.mUpperTitle.setTextSize(TITLE_TEXT_SIZE_LANDSCAPE);
    }

    public void updateQualityIndiImage(float f) {
        String string;
        String string2 = getResources().getString(R.string.quality_indi_label);
        String str = "";
        Drawable drawable = null;
        if (f >= 0.0f) {
            if (((double) f) >= 4.5d) {
                drawable = getResources().getDrawable(R.drawable.ic_call_quality_good);
                string = getResources().getString(R.string.quality_status_good);
                str = getResources().getString(R.string.quality_status_description_good);
            } else if (((double) f) >= 1.0d) {
                drawable = getResources().getDrawable(R.drawable.ic_call_quality_fair);
                string = getResources().getString(R.string.quality_status_fair);
                str = getResources().getString(R.string.quality_status_description_fair);
            } else {
                drawable = getResources().getDrawable(R.drawable.ic_call_quality_poor);
                string = getResources().getString(R.string.quality_status_bad);
                str = getResources().getString(R.string.quality_status_description_bad);
            }
            this.mQualityIndiLabel.setVisibility(View.VISIBLE);
            this.mQualityIndiImage.setVisibility(View.VISIBLE);
            this.mQualityIndiStatus.setVisibility(View.VISIBLE);
        } else {
            this.mQualityIndiLabel.setVisibility(4);
            this.mQualityIndiImage.setVisibility(4);
            this.mQualityIndiStatus.setVisibility(4);
            string = getResources().getString(R.string.quality_status_unknown);
        }
        this.mQualityIndiLabel.setText(string2 + org.apache.commons.lang3.StringUtils.SPACE + string);
        this.mQualityIndiStatus.setText(str);
        if (drawable != null) {
            this.mQualityIndiImage.setImageDrawable(drawable);
        }
    }
}
