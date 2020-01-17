package com.pccw.sms.service;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import com.pccw.database.dao.AllHistoryTempDAOImpl;
import com.pccw.database.entity.AllHistoryTemp;
import com.pccw.database.helper.DBHelper;
import com.pccw.mobile.provider.KingKingContentProvider;
import com.pccw.mobile.util.FormatUtil;
import java.util.ArrayList;
import java.util.Date;

public class AllHistoryIMServer {
    private String LOG_TAG = "AllHistoryIMServer";
    protected Context context;
    protected AllHistoryTempDAOImpl mAllHistoryTempDAOImpl;

    public interface MixCallLogQuery {
        public static final int CACHED_NAME = 5;
        public static final int CACHED_NUMBER_LABEL = 7;
        public static final int CACHED_NUMBER_TYPE = 6;
        public static final int DATE = 3;
        public static final int DURATION = 4;
        public static final int NUMBER = 1;
        public static final String[] PROJECTION = {"_id", DBHelper.NUMBER, "type", DBHelper.DATE, "duration", "name", DBHelper.CACHED_NUMBER_TYPE, DBHelper.CACHED_NUMBER_LABEL};
        public static final int QUERY_ID = 0;
        public static final int TYPE = 2;
        public static final Uri URI = KingKingContentProvider.CALL_LOG_URI;
        public static final int _ID = 0;
    }

    public AllHistoryIMServer(Context context2) {
        this.context = context2;
        this.mAllHistoryTempDAOImpl = new AllHistoryTempDAOImpl(context2);
    }

    public void addCallLogAll(Cursor cursor) {
        ArrayList arrayList = new ArrayList();
        while (cursor.moveToNext()) {
            String string = cursor.getString(1);
            arrayList.add(new AllHistoryTemp(PhoneListService.normalizeContactNumber(string), cursor.getInt(2), FormatUtil.convertDateToStr(new Date(cursor.getLong(3)), "yyyy-MM-dd HH:mm:ss"), cursor.getString(4), cursor.getString(5), cursor.getString(2), cursor.getString(7), string));
        }
        this.mAllHistoryTempDAOImpl.addList(arrayList);
    }

    public void clearCallLogAll() {
        this.mAllHistoryTempDAOImpl.removeAllFromCallLogTemp();
        this.mAllHistoryTempDAOImpl.dropAllHistoryCombinedView();
    }

    public Cursor getAllHistoryCursor() {
        this.mAllHistoryTempDAOImpl.removeAllFromCallLogTemp();
        this.mAllHistoryTempDAOImpl.dropAllHistoryCombinedView();
        Cursor query = this.context.getContentResolver().query(MixCallLogQuery.URI, MixCallLogQuery.PROJECTION, (String) null, (String[]) null, (String) null);
        new ArrayList();
        addCallLogAll(query);
        return getAllHistoryViewCursor();
    }

    public Cursor getAllHistoryViewCursor() {
        return this.mAllHistoryTempDAOImpl.getCursor();
    }
}
