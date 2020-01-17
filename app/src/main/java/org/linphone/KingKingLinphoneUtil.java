package org.linphone;

import android.util.Log;
import com.pccw.mobile.sip.util.Contact;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Scanner;

public class KingKingLinphoneUtil {
    private static KingKingLinphoneUtil instance = null;
    private Contact contact;

    private KingKingLinphoneUtil() {
    }

    /* JADX INFO: finally extract failed */
    public static boolean cpuSupportNeon() throws IOException {
        Scanner scanner = new Scanner(new FileInputStream("/proc/cpuinfo"));
        System.getProperty("line.separator");
        boolean z = false;
        while (scanner.hasNextLine()) {
            try {
                if (!z && scanner.findInLine("neon") != null) {
                    z = true;
                }
                scanner.nextLine();
            } catch (Throwable th) {
                scanner.close();
                throw th;
            }
        }
        scanner.close();
        Log.v("linphone", "canSupportNeon return " + z);
        return z;
    }

    public static KingKingLinphoneUtil getInstance() {
        if (instance == null) {
            synchronized (KingKingLinphoneUtil.class) {
                try {
                    if (instance == null) {
                        instance = new KingKingLinphoneUtil();
                    }
                } catch (Throwable th) {
                    while (true) {
                        Class<KingKingLinphoneUtil> cls = KingKingLinphoneUtil.class;
                        throw th;
                    }
                }
            }
        }
        return instance;
    }

    public static boolean hasNeonInCpuFeatures() {
        try {
            return cpuSupportNeon();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Contact getContact() {
        return this.contact;
    }

    public void setContact(Contact contact2) {
        this.contact = contact2;
    }
}
