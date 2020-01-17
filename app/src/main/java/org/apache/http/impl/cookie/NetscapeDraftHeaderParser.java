package org.apache.http.impl.cookie;

import java.util.ArrayList;
import org.apache.http.HeaderElement;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.annotation.Immutable;
import org.apache.http.message.BasicHeaderElement;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.message.ParserCursor;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@Immutable
public class NetscapeDraftHeaderParser {
    public static final NetscapeDraftHeaderParser DEFAULT = new NetscapeDraftHeaderParser();

    private NameValuePair parseNameValuePair(CharArrayBuffer charArrayBuffer, ParserCursor parserCursor) {
        String str;
        boolean z = true;
        boolean z2 = false;
        int pos = parserCursor.getPos();
        int pos2 = parserCursor.getPos();
        int upperBound = parserCursor.getUpperBound();
        while (true) {
            if (pos < upperBound) {
                char charAt = charArrayBuffer.charAt(pos);
                if (charAt == '=') {
                    break;
                } else if (charAt == ';') {
                    z2 = true;
                    break;
                } else {
                    pos++;
                }
            } else {
                break;
            }
        }
        if (pos == upperBound) {
            str = charArrayBuffer.substringTrimmed(pos2, upperBound);
            z2 = true;
        } else {
            String substringTrimmed = charArrayBuffer.substringTrimmed(pos2, pos);
            pos++;
            str = substringTrimmed;
        }
        if (z2) {
            parserCursor.updatePos(pos);
            return new BasicNameValuePair(str, (String) null);
        }
        int i = pos;
        while (true) {
            if (i >= upperBound) {
                z = z2;
                break;
            } else if (charArrayBuffer.charAt(i) == ';') {
                break;
            } else {
                i++;
            }
        }
        while (pos < i && HTTP.isWhitespace(charArrayBuffer.charAt(pos))) {
            pos++;
        }
        int i2 = i;
        while (i2 > pos && HTTP.isWhitespace(charArrayBuffer.charAt(i2 - 1))) {
            i2--;
        }
        String substring = charArrayBuffer.substring(pos, i2);
        parserCursor.updatePos(z ? i + 1 : i);
        return new BasicNameValuePair(str, substring);
    }

    public HeaderElement parseHeader(CharArrayBuffer charArrayBuffer, ParserCursor parserCursor) throws ParseException {
        Args.notNull(charArrayBuffer, "Char array buffer");
        Args.notNull(parserCursor, "Parser cursor");
        NameValuePair parseNameValuePair = parseNameValuePair(charArrayBuffer, parserCursor);
        ArrayList arrayList = new ArrayList();
        while (!parserCursor.atEnd()) {
            arrayList.add(parseNameValuePair(charArrayBuffer, parserCursor));
        }
        return new BasicHeaderElement(parseNameValuePair.getName(), parseNameValuePair.getValue(), (NameValuePair[]) arrayList.toArray(new NameValuePair[arrayList.size()]));
    }
}
