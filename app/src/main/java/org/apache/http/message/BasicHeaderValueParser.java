package org.apache.http.message;

import java.util.ArrayList;
import org.apache.http.HeaderElement;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.annotation.Immutable;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@Immutable
public class BasicHeaderValueParser implements HeaderValueParser {
    private static final char[] ALL_DELIMITERS = {PARAM_DELIMITER, ELEM_DELIMITER};
    @Deprecated
    public static final BasicHeaderValueParser DEFAULT = new BasicHeaderValueParser();
    private static final char ELEM_DELIMITER = ',';
    public static final BasicHeaderValueParser INSTANCE = new BasicHeaderValueParser();
    private static final char PARAM_DELIMITER = ';';

    private static boolean isOneOf(char c, char[] cArr) {
        if (cArr == null) {
            return false;
        }
        for (char c2 : cArr) {
            if (c == c2) {
                return true;
            }
        }
        return false;
    }

    public static HeaderElement[] parseElements(String str, HeaderValueParser headerValueParser) throws ParseException {
        Args.notNull(str, "Value");
        CharArrayBuffer charArrayBuffer = new CharArrayBuffer(str.length());
        charArrayBuffer.append(str);
        ParserCursor parserCursor = new ParserCursor(0, str.length());
        if (headerValueParser == null) {
            headerValueParser = INSTANCE;
        }
        return headerValueParser.parseElements(charArrayBuffer, parserCursor);
    }

    public static HeaderElement parseHeaderElement(String str, HeaderValueParser headerValueParser) throws ParseException {
        Args.notNull(str, "Value");
        CharArrayBuffer charArrayBuffer = new CharArrayBuffer(str.length());
        charArrayBuffer.append(str);
        ParserCursor parserCursor = new ParserCursor(0, str.length());
        if (headerValueParser == null) {
            headerValueParser = INSTANCE;
        }
        return headerValueParser.parseHeaderElement(charArrayBuffer, parserCursor);
    }

    public static NameValuePair parseNameValuePair(String str, HeaderValueParser headerValueParser) throws ParseException {
        Args.notNull(str, "Value");
        CharArrayBuffer charArrayBuffer = new CharArrayBuffer(str.length());
        charArrayBuffer.append(str);
        ParserCursor parserCursor = new ParserCursor(0, str.length());
        if (headerValueParser == null) {
            headerValueParser = INSTANCE;
        }
        return headerValueParser.parseNameValuePair(charArrayBuffer, parserCursor);
    }

    public static NameValuePair[] parseParameters(String str, HeaderValueParser headerValueParser) throws ParseException {
        Args.notNull(str, "Value");
        CharArrayBuffer charArrayBuffer = new CharArrayBuffer(str.length());
        charArrayBuffer.append(str);
        ParserCursor parserCursor = new ParserCursor(0, str.length());
        if (headerValueParser == null) {
            headerValueParser = INSTANCE;
        }
        return headerValueParser.parseParameters(charArrayBuffer, parserCursor);
    }

    /* access modifiers changed from: protected */
    public HeaderElement createHeaderElement(String str, String str2, NameValuePair[] nameValuePairArr) {
        return new BasicHeaderElement(str, str2, nameValuePairArr);
    }

    /* access modifiers changed from: protected */
    public NameValuePair createNameValuePair(String str, String str2) {
        return new BasicNameValuePair(str, str2);
    }

    public HeaderElement[] parseElements(CharArrayBuffer charArrayBuffer, ParserCursor parserCursor) {
        Args.notNull(charArrayBuffer, "Char array buffer");
        Args.notNull(parserCursor, "Parser cursor");
        ArrayList arrayList = new ArrayList();
        while (!parserCursor.atEnd()) {
            HeaderElement parseHeaderElement = parseHeaderElement(charArrayBuffer, parserCursor);
            if (parseHeaderElement.getName().length() != 0 || parseHeaderElement.getValue() != null) {
                arrayList.add(parseHeaderElement);
            }
        }
        return (HeaderElement[]) arrayList.toArray(new HeaderElement[arrayList.size()]);
    }

    public HeaderElement parseHeaderElement(CharArrayBuffer charArrayBuffer, ParserCursor parserCursor) {
        Args.notNull(charArrayBuffer, "Char array buffer");
        Args.notNull(parserCursor, "Parser cursor");
        NameValuePair parseNameValuePair = parseNameValuePair(charArrayBuffer, parserCursor);
        NameValuePair[] nameValuePairArr = null;
        if (!parserCursor.atEnd() && charArrayBuffer.charAt(parserCursor.getPos() - 1) != ',') {
            nameValuePairArr = parseParameters(charArrayBuffer, parserCursor);
        }
        return createHeaderElement(parseNameValuePair.getName(), parseNameValuePair.getValue(), nameValuePairArr);
    }

    public NameValuePair parseNameValuePair(CharArrayBuffer charArrayBuffer, ParserCursor parserCursor) {
        return parseNameValuePair(charArrayBuffer, parserCursor, ALL_DELIMITERS);
    }

    public NameValuePair parseNameValuePair(CharArrayBuffer charArrayBuffer, ParserCursor parserCursor, char[] cArr) {
        boolean z;
        String str;
        boolean z2 = true;
        Args.notNull(charArrayBuffer, "Char array buffer");
        Args.notNull(parserCursor, "Parser cursor");
        int pos = parserCursor.getPos();
        int pos2 = parserCursor.getPos();
        int upperBound = parserCursor.getUpperBound();
        while (true) {
            if (pos >= upperBound) {
                z = false;
                break;
            }
            char charAt = charArrayBuffer.charAt(pos);
            if (charAt == '=') {
                z = false;
                break;
            } else if (isOneOf(charAt, cArr)) {
                z = true;
                break;
            } else {
                pos++;
            }
        }
        if (pos == upperBound) {
            str = charArrayBuffer.substringTrimmed(pos2, upperBound);
            z = true;
        } else {
            String substringTrimmed = charArrayBuffer.substringTrimmed(pos2, pos);
            pos++;
            str = substringTrimmed;
        }
        if (z) {
            parserCursor.updatePos(pos);
            return createNameValuePair(str, (String) null);
        }
        boolean z3 = false;
        boolean z4 = false;
        int i = pos;
        while (true) {
            if (i < upperBound) {
                char charAt2 = charArrayBuffer.charAt(i);
                if (charAt2 == '\"' && !z3) {
                    z4 = !z4;
                }
                if (!z4 && !z3 && isOneOf(charAt2, cArr)) {
                    break;
                }
                z3 = z3 ? false : z4 && charAt2 == '\\';
                i++;
            } else {
                z2 = z;
                break;
            }
        }
        int i2 = pos;
        while (i2 < i && HTTP.isWhitespace(charArrayBuffer.charAt(i2))) {
            i2++;
        }
        int i3 = i;
        while (i3 > i2 && HTTP.isWhitespace(charArrayBuffer.charAt(i3 - 1))) {
            i3--;
        }
        if (i3 - i2 >= 2 && charArrayBuffer.charAt(i2) == '\"' && charArrayBuffer.charAt(i3 - 1) == '\"') {
            i2++;
            i3--;
        }
        String substring = charArrayBuffer.substring(i2, i3);
        parserCursor.updatePos(z2 ? i + 1 : i);
        return createNameValuePair(str, substring);
    }

    public NameValuePair[] parseParameters(CharArrayBuffer charArrayBuffer, ParserCursor parserCursor) {
        Args.notNull(charArrayBuffer, "Char array buffer");
        Args.notNull(parserCursor, "Parser cursor");
        int pos = parserCursor.getPos();
        int upperBound = parserCursor.getUpperBound();
        while (pos < upperBound && HTTP.isWhitespace(charArrayBuffer.charAt(pos))) {
            pos++;
        }
        parserCursor.updatePos(pos);
        if (parserCursor.atEnd()) {
            return new NameValuePair[0];
        }
        ArrayList arrayList = new ArrayList();
        while (!parserCursor.atEnd()) {
            arrayList.add(parseNameValuePair(charArrayBuffer, parserCursor));
            if (charArrayBuffer.charAt(parserCursor.getPos() - 1) == ',') {
                break;
            }
        }
        return (NameValuePair[]) arrayList.toArray(new NameValuePair[arrayList.size()]);
    }
}
