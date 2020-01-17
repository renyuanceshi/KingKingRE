package com.pccw.mobile.sip;

import android.app.AlertDialog;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import com.facebook.CallbackManager;
import com.facebook.FacebookCallback;
import com.facebook.FacebookException;
import com.facebook.share.Sharer;
import com.facebook.share.model.ShareLinkContent;
import com.facebook.share.widget.ShareDialog;
import com.orhanobut.logger.Logger;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.CryptoServices;
import com.pccw.mobile.sip02.R;
import java.io.FileInputStream;
import java.net.URL;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Locale;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.InputSource;
import org.xml.sax.XMLReader;

public class FacebookMainFragment extends Fragment {
    private static final Uri M_FACEBOOK_URL = Uri.parse("http://m.facebook.com");
    private static final String PENDING_PUBLISH_KEY = "pendingPublishReauthorization";
    private static final List<String> PERMISSIONS = Arrays.asList(new String[]{"publish_actions"});
    private static final String TAG = "FacebookShare";
    private static AlertDialog noWiFiDialog;
    private static FacebookMainFragment theFacebookMainFragment;
    /* access modifiers changed from: private */
    public CallbackManager callbackManager = CallbackManager.Factory.create();
    Button cancelLocation = null;
    /* access modifiers changed from: private */
    public FacebookCallback<Sharer.Result> facebookCallback = new FacebookCallback<Sharer.Result>() {
        public void onCancel() {
            Logger.e("cancel", new Object[0]);
            FacebookMainFragment.this.dismissProgressDialog();
        }

        public void onError(FacebookException facebookException) {
            Logger.e("error", facebookException);
            FacebookMainFragment.this.dismissProgressDialog();
        }

        public void onSuccess(Sharer.Result result) {
            Logger.e(result.getPostId(), new Object[0]);
            FacebookMainFragment.this.dismissProgressDialog();
        }
    };
    String path = Environment.getDataDirectory().getPath();
    private boolean pendingAuthorization = false;
    private boolean pendingPublishReauthorization = false;
    TextView placeText = null;
    ImageView previewImage = null;
    ProgressDialog progressDialog;
    private int retryCount = 0;
    private String shareCaption = "";
    Dialog shareDialog = null;
    private String shareImage = "";
    /* access modifiers changed from: private */
    public String shareLink = "";
    private String shareName = "";

    private boolean checkWifiAndShowNoWifiDialog() {
        if (noWiFiDialog != null && noWiFiDialog.isShowing()) {
            noWiFiDialog.cancel();
        }
        if (MobileSipService.getInstance().isNetworkAvailable(getActivity())) {
            return true;
        }
        if (noWiFiDialog != null) {
            noWiFiDialog.show();
        } else {
            noWiFiDialog = (AlertDialog) onCreateNoWiFiDialog();
            noWiFiDialog.show();
        }
        return false;
    }

    /* access modifiers changed from: private */
    public void closeFragment() {
        getActivity().getSupportFragmentManager().beginTransaction().remove(theFacebookMainFragment).commit();
    }

    /* access modifiers changed from: private */
    public void dismissProgressDialog() {
        if (this.progressDialog != null && this.progressDialog.isShowing()) {
            this.progressDialog.dismiss();
        }
    }

    /* access modifiers changed from: private */
    public String getEncryptedPhoneNumber() {
        return CryptoServices.aesEncryptedByFacebookShareKey(ClientStateManager.isRegisteredPrepaid(getActivity()) ? ClientStateManager.getRegisteredNumber(getActivity()) : ClientStateManager.obtainImsi(getActivity()));
    }

    public static FacebookMainFragment getFacebookMainFragment() {
        if (theFacebookMainFragment == null) {
            return null;
        }
        return theFacebookMainFragment;
    }

    private void handleAnnounce() {
    }

    private boolean isSubsetOf(Collection<String> collection, Collection<String> collection2) {
        for (String contains : collection) {
            if (!collection2.contains(contains)) {
                return false;
            }
        }
        return true;
    }

    public static FacebookMainFragment newInstance(int i) {
        return new FacebookMainFragment();
    }

    private void readLocalXml() {
        try {
            FileInputStream fileInputStream = new FileInputStream(getActivity().getFilesDir() + "/facebookshare.xml");
            XMLReader xMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
            FacebookShareXmlHandler facebookShareXmlHandler = new FacebookShareXmlHandler();
            xMLReader.setContentHandler(facebookShareXmlHandler);
            xMLReader.parse(new InputSource(fileInputStream));
            FacebookShareXmlResponse response = facebookShareXmlHandler.response();
            this.shareName = response.title;
            this.shareLink = response.url;
            this.shareCaption = response.caption;
            this.shareImage = response.imageurl;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* access modifiers changed from: private */
    public boolean readXml() {
        try {
            URL url = (Locale.getDefault().getDisplayLanguage().equals(Locale.getDefault().getDisplayLanguage(Locale.CHINESE)) || Locale.getDefault().getDisplayLanguage().equals(Locale.getDefault().getDisplayLanguage(Locale.CHINA)) || Locale.getDefault().getDisplayLanguage().equals(Locale.getDefault().getDisplayLanguage(Locale.PRC)) || Locale.getDefault().getDisplayLanguage().equals(Locale.getDefault().getDisplayLanguage(Locale.SIMPLIFIED_CHINESE)) || Locale.getDefault().getDisplayLanguage().equals(Locale.getDefault().getDisplayLanguage(Locale.TAIWAN)) || Locale.getDefault().getDisplayLanguage().equals(Locale.getDefault().getDisplayLanguage(Locale.TRADITIONAL_CHINESE))) ? new URL(Constants.FACEBOOK_SHARE_ZH_URL) : new URL(Constants.FACEBOOK_SHARE_EN_URL);
            XMLReader xMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
            FacebookShareXmlHandler facebookShareXmlHandler = new FacebookShareXmlHandler();
            xMLReader.setContentHandler(facebookShareXmlHandler);
            xMLReader.parse(new InputSource(url.openStream()));
            FacebookShareXmlResponse response = facebookShareXmlHandler.response();
            this.shareName = response.title;
            this.shareLink = response.url;
            this.shareCaption = response.caption;
            this.shareImage = response.imageurl;
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /* access modifiers changed from: private */
    public void showXmlErrorDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setTitle(R.string.facebook_error_dialog_title);
        builder.setMessage(R.string.retrive_facebook_xml_error);
        builder.setPositiveButton(R.string.facebook_error_dialog_button_text, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
            }
        });
        builder.create().show();
    }

    private void startPickerActivity(Uri uri, int i) {
    }

    public boolean isFacebookAppAvailable() {
        try {
            getActivity().getPackageManager().getApplicationInfo("com.facebook.katana", 0);
            return true;
        } catch (PackageManager.NameNotFoundException e) {
            Logger.e("Facebook App is not available", e);
            return false;
        }
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        this.callbackManager.onActivityResult(i, i2, intent);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        theFacebookMainFragment = this;
        showShareDialog();
    }

    /* access modifiers changed from: protected */
    public Dialog onCreateNoWiFiDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setMessage(getActivity().getString(R.string.ask_wifi)).setCancelable(false).setNeutralButton(getActivity().getString(17039360), new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.cancel();
            }
        }).setPositiveButton(getString(R.string.go_to_wifi_setting), new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                FacebookMainFragment.this.startActivity(new Intent("android.settings.WIFI_SETTINGS"));
            }
        });
        return builder.create();
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return null;
    }

    public void onDestroy() {
        super.onDestroy();
    }

    public void onPause() {
        super.onPause();
    }

    public void onResume() {
        super.onResume();
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean(PENDING_PUBLISH_KEY, this.pendingPublishReauthorization);
    }

    public void showShareDialog() {
        this.progressDialog = ProgressDialog.show(getActivity(), "", getActivity().getResources().getString(R.string.progress_dialog_text), true);
        new Thread(new Runnable() {
            public void run() {
                if (!FacebookMainFragment.this.readXml()) {
                    FacebookMainFragment.this.getActivity().runOnUiThread(new Runnable() {
                        public void run() {
                            FacebookMainFragment.this.showXmlErrorDialog();
                        }
                    });
                    FacebookMainFragment.this.closeFragment();
                    return;
                }
                String unused = FacebookMainFragment.this.shareLink = FacebookMainFragment.this.shareLink + "?fsid=" + FacebookMainFragment.this.getEncryptedPhoneNumber();
                ShareDialog shareDialog = new ShareDialog((Fragment) FacebookMainFragment.this);
                shareDialog.registerCallback(FacebookMainFragment.this.callbackManager, FacebookMainFragment.this.facebookCallback);
                shareDialog.show(((ShareLinkContent.Builder) new ShareLinkContent.Builder().setContentUrl(Uri.parse(FacebookMainFragment.this.shareLink))).build());
            }
        }).start();
    }
}
