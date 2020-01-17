package com.pccw.mobile.sip.util;

import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.sip.GetSMSTypeXmlHandler;
import com.pccw.mobile.sip.SMSType;
import com.pccw.sms.util.SMSFormatUtil;
import java.io.StringReader;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.InputSource;
import org.xml.sax.XMLReader;

public class SMSTypeHelper {
    public static List<SMSType> callSMSTypeAPI(String str) {
        boolean z = true;
        String format = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date(System.currentTimeMillis()));
        String gen8DigiRandomNumber = gen8DigiRandomNumber();
        String str2 = gen8DigiRandomNumber + format;
        String str3 = "";
        try {
            str3 = CryptoServices.aesEncryptedByMasterKey(M5DUtils.ecodeByMD5(str + "KingKing"), str2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        int i = 0;
        while (i < 2 && z) {
            try {
                String post = HttpUtils.post(Constants.GET_SMS_TYPE, "msisdnlist", str, "sender", gen8DigiRandomNumber, "r", str3);
                XMLReader xMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
                GetSMSTypeXmlHandler getSMSTypeXmlHandler = new GetSMSTypeXmlHandler();
                xMLReader.setContentHandler(getSMSTypeXmlHandler);
                xMLReader.parse(new InputSource(new StringReader(post)));
                List<SMSType> list = getSMSTypeXmlHandler.typeList;
                try {
                    if ("0".equals(getSMSTypeXmlHandler.resultCode)) {
                        return list;
                    }
                    return null;
                } catch (Exception e2) {
                    z = false;
                }
            } catch (Exception e3) {
                i++;
            }
        }
        return null;
    }

    public static List<SMSType> createListOfInternationalSMSType(String str) {
        ArrayList arrayList = new ArrayList();
        Iterator<String> it = SMSFormatUtil.convertSplittingStringToSortedArrayList(str).iterator();
        while (it.hasNext()) {
            arrayList.add(new SMSType(it.next(), "intl"));
        }
        return arrayList;
    }

    public static List<SMSType> createListOfUnknownSMSType(String str) {
        ArrayList arrayList = new ArrayList();
        Iterator<String> it = SMSFormatUtil.convertSplittingStringToSortedArrayList(str).iterator();
        while (it.hasNext()) {
            arrayList.add(new SMSType(it.next(), "na"));
        }
        return arrayList;
    }

    private static String gen8DigiRandomNumber() {
        return Integer.toString(10000000 + new Random().nextInt(90000000));
    }
}
