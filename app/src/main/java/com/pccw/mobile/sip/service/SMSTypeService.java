package com.pccw.mobile.sip.service;

import android.content.Context;
import com.pccw.database.dao.KKSMSTypeDAOImpl;
import com.pccw.database.entity.KKSMSType;
import com.pccw.mobile.sip.SMSType;
import com.pccw.mobile.sip.util.SMSTypeHelper;
import com.pccw.sms.util.SMSFormatUtil;
import com.pccw.sms.util.SMSNumberUtil;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class SMSTypeService {
    private static final int SMS_TYPE_UPDATE_INTERVAL = 14400000;
    protected KKSMSTypeDAOImpl kksmsTypeDAOImpl;
    protected Context mContext;

    public SMSTypeService(Context context) {
        this.mContext = context;
        this.kksmsTypeDAOImpl = new KKSMSTypeDAOImpl(context);
    }

    private List<SMSType> getCheckedSMSTypeList(List<String> list) {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = new ArrayList();
        ArrayList arrayList4 = new ArrayList();
        for (String next : list) {
            if (SMSNumberUtil.isHKMobileNumber(next)) {
                arrayList.add(next);
            } else if (SMSNumberUtil.isInternationalNumber(next)) {
                arrayList2.add(next);
            } else {
                arrayList3.add(next);
            }
        }
        if (!arrayList.isEmpty()) {
            arrayList4.addAll(SMSTypeHelper.callSMSTypeAPI(SMSFormatUtil.convertListToSortedSplittingString(arrayList)));
        }
        if (!arrayList2.isEmpty()) {
            arrayList4.addAll(SMSTypeHelper.createListOfInternationalSMSType(SMSFormatUtil.convertListToSortedSplittingString(arrayList2)));
        }
        if (!arrayList3.isEmpty()) {
            arrayList4.addAll(SMSTypeHelper.createListOfUnknownSMSType(SMSFormatUtil.convertListToSortedSplittingString(arrayList3)));
        }
        return arrayList4;
    }

    private SMSType getSMSType(KKSMSType kKSMSType) {
        return new SMSType(kKSMSType.getMsisdn(), kKSMSType.getSmsType());
    }

    private boolean isUpdateTimeOvered(KKSMSType kKSMSType, Long l) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        long j = 0;
        if (kKSMSType != null) {
            try {
                j = simpleDateFormat.parse(kKSMSType.getUpdateTime()).getTime();
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return l.longValue() - j >= 14400000;
    }

    private void updateDB(List<SMSType> list, String str) {
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < list.size()) {
                SMSType sMSType = list.get(i2);
                KKSMSType kKSMSType = new KKSMSType(sMSType.msisdn, sMSType.type, str);
                if (list.contains(sMSType.msisdn)) {
                    this.kksmsTypeDAOImpl.update(kKSMSType);
                } else {
                    this.kksmsTypeDAOImpl.add(kKSMSType);
                }
                i = i2 + 1;
            } else {
                return;
            }
        }
    }

    public List<SMSType> getSMSTypeList(String str) {
        List<SMSType> checkedSMSTypeList;
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        long currentTimeMillis = System.currentTimeMillis();
        String format = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date(currentTimeMillis));
        String[] split = str.split(";");
        for (int i = 0; i < split.length; i++) {
            KKSMSType find = this.kksmsTypeDAOImpl.find(split[i]);
            if (find == null || isUpdateTimeOvered(find, Long.valueOf(currentTimeMillis))) {
                arrayList2.add(split[i]);
            } else {
                arrayList.add(getSMSType(find));
            }
        }
        if (!arrayList2.isEmpty() && (checkedSMSTypeList = getCheckedSMSTypeList(arrayList2)) != null) {
            arrayList.addAll(checkedSMSTypeList);
            updateDB(checkedSMSTypeList, format);
        }
        return arrayList;
    }
}
