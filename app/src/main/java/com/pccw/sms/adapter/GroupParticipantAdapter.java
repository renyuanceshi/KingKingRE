package com.pccw.sms.adapter;

import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Build;
import android.provider.ContactsContract;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.pccw.mobile.sip02.R;
import com.pccw.mobile.util.UserPhotoUtil;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;
import org.linphone.mediastream.Version;

public class GroupParticipantAdapter extends BaseAdapter {
    private int layoutID;
    private List<String> list;
    private Context mContext;
    private LayoutInflater mInflater;
    public String mThumbnailUri;

    public GroupParticipantAdapter(Context context, List<String> list2, int i, String[] strArr, int[] iArr) {
        this.mInflater = LayoutInflater.from(context);
        this.list = list2;
        this.layoutID = i;
        this.mContext = context;
    }

    private Bitmap getContactImageByPhoneNumber(Context context, String str) {
        InputStream inputStream;
        Cursor query = context.getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, new String[]{"photo_thumb_uri", "data1"}, "data1 = '" + str + "'", (String[]) null, (String) null);
        if (query == null) {
            return null;
        }
        Bitmap bitmap = null;
        String str2 = null;
        for (int i = 0; i < query.getCount(); i++) {
            query.moveToPosition(i);
            int columnIndex = query.getColumnIndex("_id");
            if (Build.VERSION.SDK_INT >= 11) {
                try {
                    str2 = query.getString(query.getColumnIndexOrThrow("photo_thumb_uri"));
                } catch (IllegalArgumentException e) {
                }
            } else {
                str2 = columnIndex + "";
            }
            if (str2 != null) {
                try {
                    inputStream = this.mContext.getContentResolver().openInputStream(Version.sdkAboveOrEqual(11) ? Uri.parse(str2) : Uri.withAppendedPath(Uri.withAppendedPath(ContactsContract.Contacts.CONTENT_URI, str2), "photo"));
                } catch (FileNotFoundException e2) {
                    e2.printStackTrace();
                    inputStream = null;
                }
                if (inputStream != null) {
                    bitmap = BitmapFactory.decodeStream(inputStream);
                }
            }
        }
        if (bitmap != null) {
            return UserPhotoUtil.getCircularBitmap(bitmap, 70, 70);
        }
        return null;
    }

    public String getContactNameByPhoneNumber(Context context, String str) {
        String[] strArr = {"display_name", "data1"};
        Cursor query = context.getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, strArr, "data1 = '" + str + "'", (String[]) null, (String) null);
        if (query == null || query.getCount() >= 0) {
            return null;
        }
        query.moveToPosition(0);
        String string = query.getString(query.getColumnIndex("display_name"));
        query.getColumnIndex("_id");
        return string;
    }

    public int getCount() {
        return this.list.size();
    }

    public Object getItem(int i) {
        return 0;
    }

    public long getItemId(int i) {
        return 0;
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        View inflate = this.mInflater.inflate(this.layoutID, (ViewGroup) null);
        String str = this.list.get(i);
        ImageView imageView = (ImageView) inflate.findViewById(R.id.participant_thumbnail);
        TextView textView = (TextView) inflate.findViewById(R.id.participant_contact_name);
        TextView textView2 = (TextView) inflate.findViewById(R.id.participant_number);
        String contactNameByPhoneNumber = getContactNameByPhoneNumber(this.mContext, str);
        if (contactNameByPhoneNumber != null) {
            textView.setText(contactNameByPhoneNumber);
        }
        textView2.setText(str);
        Bitmap contactImageByPhoneNumber = getContactImageByPhoneNumber(this.mContext, str);
        if (contactImageByPhoneNumber != null) {
            imageView.setImageBitmap(contactImageByPhoneNumber);
        } else {
            imageView.setImageResource(R.drawable.default_profile_pic);
        }
        return inflate;
    }
}
