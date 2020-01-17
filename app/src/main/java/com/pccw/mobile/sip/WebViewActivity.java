package com.pccw.mobile.sip;

import android.content.Intent;
import android.os.Bundle;
import android.webkit.WebView;
import com.pccw.mobile.sip02.R;

public class WebViewActivity extends BaseActivity {
    private static final String EMPTY_URL = "about:blank";
    public static final String TYPE = "Type";
    public static final int TYPE_FAQ = 1;
    public static final int TYPE_NONE = -1;
    public static final int TYPE_USER_GUIDE = 0;
    private WebView mWebView;

    public void onCreate(Bundle bundle) {
        String string;
        super.onCreate(bundle);
        requestWindowFeature(1);
        Intent intent = getIntent();
        setContentView(R.layout.webview_ui);
        switch (intent.getIntExtra(TYPE, -1)) {
            case 0:
                string = getString(R.string.user_guide_url);
                break;
            case 1:
                string = getString(R.string.faq_url);
                break;
            default:
                string = EMPTY_URL;
                break;
        }
        this.mWebView = (WebView) findViewById(R.id.webView1);
        this.mWebView.loadUrl(string);
    }
}
