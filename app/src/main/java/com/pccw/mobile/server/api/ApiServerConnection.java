package com.pccw.mobile.server.api;

import android.os.AsyncTask;
import com.pccw.mobile.server.xml.ApiXmlDefaultHandler;
import java.io.IOException;
import java.io.StringReader;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParserFactory;
import org.apache.http.util.TextUtils;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

public abstract class ApiServerConnection extends AsyncTask<String, Void, ApiResponse> {
    protected ApiResponseListener apiResponseListener;
    protected ApiXmlDefaultHandler handler;
    protected StringBuilder sb;

    public ApiServerConnection(ApiXmlDefaultHandler apiXmlDefaultHandler) {
        this.handler = apiXmlDefaultHandler;
    }

    private void apiResponseXmlHandler(String str) {
        try {
            XMLReader xMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
            xMLReader.setContentHandler(this.handler);
            xMLReader.parse(new InputSource(new StringReader(str)));
        } catch (IOException | ParserConfigurationException | SAXException e) {
            e.printStackTrace();
        }
    }

    /* access modifiers changed from: protected */
    public ApiResponse doInBackground(String... strArr) {
        String postToServer = postToServer();
        if (!TextUtils.isEmpty(postToServer)) {
            apiResponseXmlHandler(postToServer);
        }
        ApiResponse response = this.handler.getResponse();
        if (response != null) {
            this.apiResponseListener.onResponseSuccess(response);
        } else {
            this.apiResponseListener.onResponseFailed();
        }
        return response;
    }

    /* access modifiers changed from: protected */
    public void onPostExecute(ApiResponse apiResponse) {
        super.onPostExecute(apiResponse);
    }

    public abstract String postToServer();
}
