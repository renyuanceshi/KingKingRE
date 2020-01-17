package com.pccw.mobile.sip;

import android.content.Context;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.InputSource;
import org.xml.sax.XMLReader;

public class FacebookShareActivity {
    private static final String CALL_COUNT_TAG = "CallCount";
    private static final String LAST_SHOWING_DATE_TAG = "LastShowingDate";
    private static final String SHARE_PREF_TAG = "FacebookShare";
    private static final String TAG = "FacebookShare";
    private static final String TIME_FORMAT = "ddMMyyyy";
    SimpleDateFormat format = new SimpleDateFormat(TIME_FORMAT, Locale.getDefault());
    private int targetDayInterval = 14;
    private int targetNumOfCall = 5;

    private void addCallCount(Context context) {
        setCallCount(context, context.getSharedPreferences("FacebookShare", 0).getInt(CALL_COUNT_TAG, 0) + 1);
    }

    private int countDayInterval(Context context) {
        return (int) ((getCurrentDay().getTime() - getLastShowingDay(context).getTime()) / 86400000);
    }

    private int getCallCount(Context context) {
        return context.getSharedPreferences("FacebookShare", 0).getInt(CALL_COUNT_TAG, 0);
    }

    private Date getCurrentDay() {
        Date date = new Date();
        try {
            return this.format.parse(this.format.format(date));
        } catch (ParseException e) {
            e.printStackTrace();
            return date;
        }
    }

    private Date getLastShowingDay(Context context) {
        String string = context.getSharedPreferences("FacebookShare", 0).getString(LAST_SHOWING_DATE_TAG, "NULL");
        if (string.equalsIgnoreCase("NULL")) {
            return null;
        }
        try {
            return this.format.parse(string);
        } catch (ParseException e) {
            return new Date();
        }
    }

    private boolean isCallCountMet(Context context) {
        return getCallCount(context) >= this.targetNumOfCall;
    }

    private boolean isDateIntervalMet(Context context) {
        if (getXmlFromServer(context)) {
            readXml(context);
        }
        return isNotPromptBefore(context) || countDayInterval(context) >= this.targetDayInterval || countDayInterval(context) < 0;
    }

    private boolean isNotPromptBefore(Context context) {
        return context.getSharedPreferences("FacebookShare", 0).getString(LAST_SHOWING_DATE_TAG, "NULL").equalsIgnoreCase("NULL");
    }

    private void readXml(Context context) {
        try {
            FileInputStream fileInputStream = new FileInputStream(context.getFilesDir() + "/facebookshare.xml");
            XMLReader xMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
            FacebookShareXmlHandler facebookShareXmlHandler = new FacebookShareXmlHandler();
            xMLReader.setContentHandler(facebookShareXmlHandler);
            xMLReader.parse(new InputSource(fileInputStream));
            this.targetDayInterval = Integer.valueOf(facebookShareXmlHandler.response().dayDiff).intValue();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void setCallCount(Context context, int i) {
        context.getSharedPreferences("FacebookShare", 0).edit().putInt(CALL_COUNT_TAG, i).commit();
    }

    private void setLastShowingDay(Context context) {
        context.getSharedPreferences("FacebookShare", 0).edit().putString(LAST_SHOWING_DATE_TAG, this.format.format(new Date())).commit();
    }

    private boolean shouldShowFacebookDialog(Context context) {
        return isCallCountMet(context) && isDateIntervalMet(context);
    }

    public boolean getXmlFromServer(Context context) {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) ((Locale.getDefault().getDisplayLanguage().equals(Locale.getDefault().getDisplayLanguage(Locale.CHINESE)) || Locale.getDefault().getDisplayLanguage().equals(Locale.getDefault().getDisplayLanguage(Locale.CHINA)) || Locale.getDefault().getDisplayLanguage().equals(Locale.getDefault().getDisplayLanguage(Locale.PRC)) || Locale.getDefault().getDisplayLanguage().equals(Locale.getDefault().getDisplayLanguage(Locale.SIMPLIFIED_CHINESE)) || Locale.getDefault().getDisplayLanguage().equals(Locale.getDefault().getDisplayLanguage(Locale.TAIWAN)) || Locale.getDefault().getDisplayLanguage().equals(Locale.getDefault().getDisplayLanguage(Locale.TRADITIONAL_CHINESE))) ? new URL(Constants.FACEBOOK_SHARE_ZH_URL) : new URL(Constants.FACEBOOK_SHARE_EN_URL)).openConnection();
            httpURLConnection.setRequestMethod("GET");
            httpURLConnection.setDoOutput(true);
            httpURLConnection.connect();
            FileOutputStream fileOutputStream = new FileOutputStream(new File(context.getFilesDir(), "facebookshare.xml"));
            InputStream inputStream = httpURLConnection.getInputStream();
            byte[] bArr = new byte[1024];
            while (true) {
                int read = inputStream.read(bArr);
                if (read > 0) {
                    fileOutputStream.write(bArr, 0, read);
                } else {
                    fileOutputStream.close();
                    return true;
                }
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
        return false;
    }

    public void promptShareToFacebookDialog(FragmentManager fragmentManager) {
        FacebookMainFragment facebookMainFragment = new FacebookMainFragment();
        if (fragmentManager.findFragmentByTag("facebookfrag") != null) {
            FragmentTransaction beginTransaction = fragmentManager.beginTransaction();
            beginTransaction.remove(fragmentManager.findFragmentByTag("facebookfrag"));
            beginTransaction.commit();
        }
        FragmentTransaction beginTransaction2 = fragmentManager.beginTransaction();
        beginTransaction2.add((Fragment) facebookMainFragment, "facebookfrag");
        beginTransaction2.commit();
    }

    public boolean runFacebookShareChecking(Context context, FragmentManager fragmentManager, boolean z) {
        if (z) {
            setCallCount(context, 0);
        } else {
            addCallCount(context);
        }
        if (!shouldShowFacebookDialog(context)) {
            return false;
        }
        setLastShowingDay(context);
        return true;
    }
}
