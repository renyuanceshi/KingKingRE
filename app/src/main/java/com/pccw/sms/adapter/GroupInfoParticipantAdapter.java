package com.pccw.sms.adapter;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.support.v4.media.session.PlaybackStateCompat;
import android.support.v4.util.LruCache;
import android.util.SparseBooleanArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.pccw.database.entity.GroupMember;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip02.R;
import com.pccw.mobile.util.BitmapUtil;
import com.pccw.mobile.util.UserPhotoUtil;
import com.pccw.sms.bean.ConversationParticipantItem;
import java.util.ArrayList;

public class GroupInfoParticipantAdapter<T> extends BaseAdapter {
    private String LOG_TAG = "GroupInfoParticipantAdapter";
    /* access modifiers changed from: private */
    public Context mContext;
    private LayoutInflater mInflater;
    private ArrayList<T> mList;
    private LruCache<String, Bitmap> mMemoryCache;
    private SparseBooleanArray mSparseBooleanArray;
    private String owner;

    public class SetImageTask extends AsyncTask<String, Integer, Bitmap> {
        ImageView imageView;
        String mImageUrl;

        public SetImageTask(String str, ImageView imageView2) {
            this.mImageUrl = str;
            this.imageView = imageView2;
        }

        /* JADX WARNING: Removed duplicated region for block: B:33:0x0058 A[SYNTHETIC, Splitter:B:33:0x0058] */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        private android.graphics.Bitmap loadContactPhotoThumbnail(java.lang.String r4) {
            /*
                r3 = this;
                r1 = 0
                r0 = 11
                boolean r0 = org.linphone.mediastream.Version.sdkAboveOrEqual(r0)     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
                if (r0 == 0) goto L_0x0027
                android.net.Uri r0 = android.net.Uri.parse(r4)     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
            L_0x000d:
                com.pccw.sms.adapter.GroupInfoParticipantAdapter r2 = com.pccw.sms.adapter.GroupInfoParticipantAdapter.this     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
                android.content.Context r2 = r2.mContext     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
                android.content.ContentResolver r2 = r2.getContentResolver()     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
                java.io.InputStream r2 = r2.openInputStream(r0)     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
                if (r2 == 0) goto L_0x0039
                android.graphics.Bitmap r0 = android.graphics.BitmapFactory.decodeStream(r2)     // Catch:{ FileNotFoundException -> 0x0064 }
                if (r2 == 0) goto L_0x0026
                r2.close()     // Catch:{ IOException -> 0x0034 }
            L_0x0026:
                return r0
            L_0x0027:
                android.net.Uri r0 = android.provider.ContactsContract.Contacts.CONTENT_URI     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
                android.net.Uri r0 = android.net.Uri.withAppendedPath(r0, r4)     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
                java.lang.String r2 = "photo"
                android.net.Uri r0 = android.net.Uri.withAppendedPath(r0, r2)     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
                goto L_0x000d
            L_0x0034:
                r1 = move-exception
                r1.printStackTrace()
                goto L_0x0026
            L_0x0039:
                if (r2 == 0) goto L_0x003e
                r2.close()     // Catch:{ IOException -> 0x0040 }
            L_0x003e:
                r0 = r1
                goto L_0x0026
            L_0x0040:
                r0 = move-exception
                r0.printStackTrace()
                goto L_0x003e
            L_0x0045:
                r0 = move-exception
                r2 = r1
            L_0x0047:
                r0.printStackTrace()     // Catch:{ all -> 0x0061 }
                if (r2 == 0) goto L_0x003e
                r2.close()     // Catch:{ IOException -> 0x0050 }
                goto L_0x003e
            L_0x0050:
                r0 = move-exception
                r0.printStackTrace()
                goto L_0x003e
            L_0x0055:
                r0 = move-exception
            L_0x0056:
                if (r1 == 0) goto L_0x005b
                r1.close()     // Catch:{ IOException -> 0x005c }
            L_0x005b:
                throw r0
            L_0x005c:
                r1 = move-exception
                r1.printStackTrace()
                goto L_0x005b
            L_0x0061:
                r0 = move-exception
                r1 = r2
                goto L_0x0056
            L_0x0064:
                r0 = move-exception
                goto L_0x0047
            */
            throw new UnsupportedOperationException("Method not decompiled: com.pccw.sms.adapter.GroupInfoParticipantAdapter.SetImageTask.loadContactPhotoThumbnail(java.lang.String):android.graphics.Bitmap");
        }

        /* access modifiers changed from: protected */
        public Bitmap doInBackground(String... strArr) {
            Bitmap loadContactPhotoThumbnail = this.mImageUrl.contains("content://") ? loadContactPhotoThumbnail(this.mImageUrl) : BitmapUtil.getProfileImageThumbnail(GroupInfoParticipantAdapter.this.mContext, this.mImageUrl);
            if (loadContactPhotoThumbnail == null) {
                return null;
            }
            return UserPhotoUtil.getCircularBitmap(loadContactPhotoThumbnail, 70, 70);
        }

        public void onPostExecute(Bitmap bitmap) {
            if (isCancelled()) {
                bitmap = null;
            }
            if (bitmap != null && this.imageView != null) {
                this.imageView.setImageBitmap(bitmap);
                GroupInfoParticipantAdapter.this.addBitmapToMemoryCache(this.mImageUrl, bitmap);
            }
        }
    }

    public GroupInfoParticipantAdapter(Context context, ArrayList<T> arrayList) {
        this.mContext = context;
        this.mInflater = LayoutInflater.from(this.mContext);
        this.mSparseBooleanArray = new SparseBooleanArray();
        this.mList = new ArrayList<>();
        this.mList = arrayList;
        this.owner = ClientStateManager.getRegisteredNumber(this.mContext);
        this.mMemoryCache = new LruCache<String, Bitmap>(((int) (Runtime.getRuntime().maxMemory() / PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID)) / 8) {
            /* access modifiers changed from: protected */
            public int sizeOf(String str, Bitmap bitmap) {
                return (bitmap.getRowBytes() * bitmap.getHeight()) / 1024;
            }
        };
    }

    public void addBitmapToMemoryCache(String str, Bitmap bitmap) {
        if (str != null && bitmap != null && getBitmapFromMemCache(str) == null) {
            this.mMemoryCache.put(str, bitmap);
        }
    }

    public Bitmap getBitmapFromMemCache(String str) {
        return this.mMemoryCache.get(str);
    }

    public ArrayList<T> getCheckedItems() {
        ArrayList<T> arrayList = new ArrayList<>();
        for (int i = 0; i < this.mList.size(); i++) {
            if (this.mSparseBooleanArray.get(i)) {
                arrayList.add(this.mList.get(i));
            }
        }
        return arrayList;
    }

    public ArrayList<String> getCheckedUserId() {
        ArrayList<String> arrayList = new ArrayList<>();
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= this.mList.size()) {
                return arrayList;
            }
            if (this.mSparseBooleanArray.get(i2)) {
                arrayList.add(((ConversationParticipantItem) this.mList.get(i2)).getUserId());
            }
            i = i2 + 1;
        }
    }

    public int getCount() {
        return this.mList.size();
    }

    public Object getItem(int i) {
        GroupMember groupMember = (GroupMember) this.mList.get(i);
        if (this.owner == null || this.owner.equals(groupMember.getMemberUserName())) {
            return null;
        }
        return groupMember;
    }

    public long getItemId(int i) {
        return (long) i;
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        if (view == null) {
            view = this.mInflater.inflate(R.layout.group_partcipants_list_item, (ViewGroup) null);
        }
        TextView textView = (TextView) view.findViewById(R.id.participant_name);
        ImageView imageView = (ImageView) view.findViewById(R.id.participant_thumbnail);
        ((TextView) view.findViewById(R.id.admin)).setVisibility(4);
        GroupMember groupMember = (GroupMember) this.mList.get(i);
        String memberUserName = groupMember.getMemberUserName();
        String nickName = (this.owner == null || !this.owner.equals(memberUserName)) ? groupMember.getNickName() : this.mContext.getResources().getString(R.string.chat_group_you);
        if (nickName == null || "".equals(nickName)) {
            textView.setText(memberUserName);
        } else {
            textView.setText(nickName);
        }
        String profileImagePath = ((GroupMember) this.mList.get(i)).getProfileImagePath();
        if (profileImagePath == null || profileImagePath.equals("")) {
            imageView.setImageBitmap(BitmapFactory.decodeResource(this.mContext.getResources(), R.drawable.default_profile_pic));
        } else {
            loadBitmap(profileImagePath, imageView, R.drawable.default_profile_pic);
        }
        return view;
    }

    public void loadBitmap(String str, ImageView imageView, int i) {
        Bitmap bitmapFromMemCache = getBitmapFromMemCache(str);
        if (bitmapFromMemCache != null) {
            imageView.setImageBitmap(bitmapFromMemCache);
            return;
        }
        imageView.setImageResource(i);
        new SetImageTask(str, imageView).execute(new String[]{str});
    }
}
