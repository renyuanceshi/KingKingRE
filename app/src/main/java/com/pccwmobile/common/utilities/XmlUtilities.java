package com.pccwmobile.common.utilities;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

public class XmlUtilities {
    public static NodeList getNodeListByXPath(String str, String str2) {
        try {
            try {
                return (NodeList) XPathFactory.newInstance().newXPath().evaluate(str2, new InputSource(str2Stream(str)), XPathConstants.NODESET);
            } catch (Exception e) {
                e = e;
            }
        } catch (Exception e2) {
            e = e2;
            e.printStackTrace();
            return null;
        }
    }

    public static String getNodeValueByXPath(String str, String str2) {
        try {
            try {
                return (String) XPathFactory.newInstance().newXPath().evaluate(str2, new InputSource(str2Stream(str)), XPathConstants.STRING);
            } catch (Exception e) {
                e = e;
            }
        } catch (Exception e2) {
            e = e2;
            e.printStackTrace();
            return null;
        }
    }

    public static List<String> getValueInNodeListByXpath(NodeList nodeList, String str) {
        Exception e;
        ArrayList arrayList = null;
        try {
            ArrayList arrayList2 = new ArrayList();
            try {
                XPath newXPath = XPathFactory.newInstance().newXPath();
                int i = 0;
                while (true) {
                    int i2 = i;
                    if (i2 >= nodeList.getLength()) {
                        return arrayList2;
                    }
                    arrayList2.add(newXPath.evaluate(str, (Element) nodeList.item(i2)));
                    i = i2 + 1;
                }
            } catch (Exception e2) {
                e = e2;
                arrayList = arrayList2;
                e.printStackTrace();
                return arrayList;
            }
        } catch (Exception e3) {
            e = e3;
            e.printStackTrace();
            return arrayList;
        }
    }

    private static InputStream str2Stream(String str) {
        try {
            return new ByteArrayInputStream(str.getBytes("UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }
}
