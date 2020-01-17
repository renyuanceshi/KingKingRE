package com.pccw.mobile.server.api;

import java.io.IOException;
import java.io.StringReader;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

public abstract class SyncApiServerConnection {
    protected ApiResponse apiResponse;
    protected StringBuilder sb;

    private class ApiResponseXmlHandler extends ResponseXmlHandler {
        private ApiResponseXmlHandler() {
        }

        public void endElement(String str, String str2, String str3) throws SAXException {
            if (this.sb != null) {
                SyncApiServerConnection.this.XmlElement(str2, this.sb);
                this.sb = null;
            }
        }
    }

    public abstract void XmlElement(String str, StringBuilder sb2);

    public void apiResponseXmlHandler(String str) {
        try {
            XMLReader xMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
            xMLReader.setContentHandler(new ApiResponseXmlHandler());
            xMLReader.parse(new InputSource(new StringReader(str)));
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e2) {
            e2.printStackTrace();
        } catch (IOException e3) {
            e3.printStackTrace();
        }
    }

    public abstract ApiResponse postToServer();
}
