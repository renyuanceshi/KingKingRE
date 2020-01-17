package org.linphone;

import android.content.pm.PackageManager;
import android.os.Bundle;
import android.widget.TextView;
import com.pccw.mobile.sip.BaseActivity;
import com.pccw.mobile.sip02.R;
import org.linphone.core.Log;

public class AboutActivity extends BaseActivity {
    TextView aboutText;

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.about);
        this.aboutText = (TextView) findViewById(R.id.AboutText);
        try {
            this.aboutText.setText(String.format(getString(R.string.about_text), new Object[]{getPackageManager().getPackageInfo(getPackageName(), 0).versionName}));
        } catch (PackageManager.NameNotFoundException e) {
            Log.e(e, "cannot get version name");
        }
    }
}
