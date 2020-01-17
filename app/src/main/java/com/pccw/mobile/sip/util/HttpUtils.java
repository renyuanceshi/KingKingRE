package com.pccw.mobile.sip.util;

import com.pccw.mobile.sip.Constants;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.HttpVersion;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.scheme.SocketFactory;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.SingleClientConnManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.params.CoreProtocolPNames;
import org.apache.http.params.HttpProtocolParams;
import org.apache.http.util.EntityUtils;

public class HttpUtils {
    public static final String DEFAULT_CHARSET = "UTF-8";

    protected static List<NameValuePair> buildNameValuePairList(Object[] objArr) {
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < objArr.length; i += 2) {
            if (!(objArr[i] instanceof String)) {
                throw new RuntimeException("Odd numbered parameters must be of type String");
            }
            arrayList.add(new BasicNameValuePair(objArr[i].toString(), String.valueOf(objArr[i + 1])));
        }
        return arrayList;
    }

    private static HttpClient getHttpClient() {
        SchemeRegistry schemeRegistry = new SchemeRegistry();
        schemeRegistry.register(new Scheme(HttpHost.DEFAULT_SCHEME_NAME, (SocketFactory) PlainSocketFactory.getSocketFactory(), 80));
        schemeRegistry.register(new Scheme("https", (SocketFactory) new EasySSLSocketFactory(), 443));
        BasicHttpParams basicHttpParams = new BasicHttpParams();
        HttpProtocolParams.setVersion(basicHttpParams, HttpVersion.HTTP_1_1);
        HttpProtocolParams.setContentCharset(basicHttpParams, "UTF-8");
        HttpProtocolParams.setUseExpectContinue(basicHttpParams, true);
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient(new SingleClientConnManager(basicHttpParams, schemeRegistry), basicHttpParams);
        defaultHttpClient.getParams().setParameter(CoreProtocolPNames.USER_AGENT, "0060e Android");
        defaultHttpClient.getParams().setIntParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, Constants.HEARTBEAT_RETRY_INTERVAL);
        defaultHttpClient.getParams().setIntParameter(CoreConnectionPNames.SO_TIMEOUT, Constants.HEARTBEAT_RETRY_INTERVAL);
        return defaultHttpClient;
    }

    public static String post(String str, Object... objArr) {
        HttpClient httpClient = getHttpClient();
        HttpPost httpPost = new HttpPost(str);
        try {
            httpPost.setEntity(new UrlEncodedFormEntity((List<? extends NameValuePair>) buildNameValuePairList(objArr), "UTF-8"));
            httpPost.addHeader(HttpHeaders.ACCEPT_CHARSET, "UTF-8");
            try {
                HttpResponse execute = httpClient.execute(httpPost);
                int statusCode = execute.getStatusLine().getStatusCode();
                String entityUtils = EntityUtils.toString(execute.getEntity(), "UTF8");
                if (statusCode != 200) {
                    throw new HttpException(statusCode);
                }
                httpClient.getConnectionManager().shutdown();
                return entityUtils;
            } catch (RuntimeException e) {
                throw e;
            } catch (IOException e2) {
                throw new NetworkException((Throwable) e2);
            } catch (Exception e3) {
                throw new RuntimeException(e3);
            } catch (Throwable th) {
                httpClient.getConnectionManager().shutdown();
                throw th;
            }
        } catch (UnsupportedEncodingException e4) {
            throw new RuntimeException("encoding failed?", e4);
        }
    }
}
