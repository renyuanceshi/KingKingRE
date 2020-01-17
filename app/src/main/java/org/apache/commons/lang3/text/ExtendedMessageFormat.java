package org.apache.commons.lang3.text;

import java.text.Format;
import java.text.MessageFormat;
import java.text.ParsePosition;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.Validate;

public class ExtendedMessageFormat extends MessageFormat {
    private static final String DUMMY_PATTERN = "";
    private static final char END_FE = '}';
    private static final String ESCAPED_QUOTE = "''";
    private static final int HASH_SEED = 31;
    private static final char QUOTE = '\'';
    private static final char START_FE = '{';
    private static final char START_FMT = ',';
    private static final long serialVersionUID = -2362048321261811743L;
    private final Map<String, ? extends FormatFactory> registry;
    private String toPattern;

    public ExtendedMessageFormat(String str) {
        this(str, Locale.getDefault());
    }

    public ExtendedMessageFormat(String str, Locale locale) {
        this(str, locale, (Map<String, ? extends FormatFactory>) null);
    }

    public ExtendedMessageFormat(String str, Locale locale, Map<String, ? extends FormatFactory> map) {
        super("");
        setLocale(locale);
        this.registry = map;
        applyPattern(str);
    }

    public ExtendedMessageFormat(String str, Map<String, ? extends FormatFactory> map) {
        this(str, Locale.getDefault(), map);
    }

    private StringBuilder appendQuotedString(String str, ParsePosition parsePosition, StringBuilder sb, boolean z) {
        int index = parsePosition.getIndex();
        char[] charArray = str.toCharArray();
        if (!z || charArray[index] != '\'') {
            int i = index;
            for (int index2 = parsePosition.getIndex(); index2 < str.length(); index2++) {
                if (!z || !str.substring(index2).startsWith(ESCAPED_QUOTE)) {
                    switch (charArray[parsePosition.getIndex()]) {
                        case '\'':
                            next(parsePosition);
                            if (sb != null) {
                                return sb.append(charArray, i, parsePosition.getIndex() - i);
                            }
                            return null;
                        default:
                            next(parsePosition);
                            break;
                    }
                } else {
                    sb.append(charArray, i, parsePosition.getIndex() - i).append(QUOTE);
                    parsePosition.setIndex(ESCAPED_QUOTE.length() + index2);
                    i = parsePosition.getIndex();
                }
            }
            throw new IllegalArgumentException("Unterminated quoted string at position " + index);
        }
        next(parsePosition);
        if (sb == null) {
            return null;
        }
        return sb.append(QUOTE);
    }

    private boolean containsElements(Collection<?> collection) {
        if (collection == null || collection.isEmpty()) {
            return false;
        }
        for (Object obj : collection) {
            if (obj != null) {
                return true;
            }
        }
        return false;
    }

    private Format getFormat(String str) {
        String str2;
        if (this.registry == null) {
            return null;
        }
        int indexOf = str.indexOf(44);
        if (indexOf > 0) {
            String trim = str.substring(0, indexOf).trim();
            str2 = str.substring(indexOf + 1).trim();
            str = trim;
        } else {
            str2 = null;
        }
        FormatFactory formatFactory = (FormatFactory) this.registry.get(str);
        if (formatFactory != null) {
            return formatFactory.getFormat(str, str2, getLocale());
        }
        return null;
    }

    private void getQuotedString(String str, ParsePosition parsePosition, boolean z) {
        appendQuotedString(str, parsePosition, (StringBuilder) null, z);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0051, code lost:
        r3 = r3 + 1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private java.lang.String insertFormats(java.lang.String r8, java.util.ArrayList<java.lang.String> r9) {
        /*
            r7 = this;
            r1 = 0
            boolean r0 = r7.containsElements(r9)
            if (r0 != 0) goto L_0x0008
        L_0x0007:
            return r8
        L_0x0008:
            java.lang.StringBuilder r4 = new java.lang.StringBuilder
            int r0 = r8.length()
            int r0 = r0 * 2
            r4.<init>(r0)
            java.text.ParsePosition r5 = new java.text.ParsePosition
            r5.<init>(r1)
            r2 = -1
            r0 = r1
            r3 = r2
        L_0x001b:
            int r2 = r5.getIndex()
            int r6 = r8.length()
            if (r2 >= r6) goto L_0x0069
            int r2 = r5.getIndex()
            char r2 = r8.charAt(r2)
            switch(r2) {
                case 39: goto L_0x0037;
                case 123: goto L_0x003b;
                case 125: goto L_0x0066;
                default: goto L_0x0030;
            }
        L_0x0030:
            r4.append(r2)
            r7.next(r5)
            goto L_0x001b
        L_0x0037:
            r7.appendQuotedString(r8, r5, r4, r1)
            goto L_0x001b
        L_0x003b:
            int r2 = r0 + 1
            r0 = 123(0x7b, float:1.72E-43)
            java.lang.StringBuilder r0 = r4.append(r0)
            java.text.ParsePosition r6 = r7.next(r5)
            int r6 = r7.readArgumentIndex(r8, r6)
            r0.append(r6)
            r0 = 1
            if (r2 != r0) goto L_0x006e
            int r3 = r3 + 1
            java.lang.Object r0 = r9.get(r3)
            java.lang.String r0 = (java.lang.String) r0
            if (r0 == 0) goto L_0x006e
            r6 = 44
            java.lang.StringBuilder r6 = r4.append(r6)
            r6.append(r0)
            r0 = r2
            goto L_0x001b
        L_0x0066:
            int r0 = r0 + -1
            goto L_0x0030
        L_0x0069:
            java.lang.String r8 = r4.toString()
            goto L_0x0007
        L_0x006e:
            r0 = r2
            goto L_0x001b
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang3.text.ExtendedMessageFormat.insertFormats(java.lang.String, java.util.ArrayList):java.lang.String");
    }

    private ParsePosition next(ParsePosition parsePosition) {
        parsePosition.setIndex(parsePosition.getIndex() + 1);
        return parsePosition;
    }

    private String parseFormatDescription(String str, ParsePosition parsePosition) {
        int index = parsePosition.getIndex();
        seekNonWs(str, parsePosition);
        int index2 = parsePosition.getIndex();
        int i = 1;
        while (parsePosition.getIndex() < str.length()) {
            switch (str.charAt(parsePosition.getIndex())) {
                case '\'':
                    getQuotedString(str, parsePosition, false);
                    break;
                case '{':
                    i++;
                    break;
                case '}':
                    i--;
                    if (i != 0) {
                        break;
                    } else {
                        return str.substring(index2, parsePosition.getIndex());
                    }
            }
            next(parsePosition);
        }
        throw new IllegalArgumentException("Unterminated format element at position " + index);
    }

    private int readArgumentIndex(String str, ParsePosition parsePosition) {
        int index = parsePosition.getIndex();
        seekNonWs(str, parsePosition);
        StringBuilder sb = new StringBuilder();
        boolean z = false;
        while (!z && parsePosition.getIndex() < str.length()) {
            char charAt = str.charAt(parsePosition.getIndex());
            if (Character.isWhitespace(charAt)) {
                seekNonWs(str, parsePosition);
                charAt = str.charAt(parsePosition.getIndex());
                if (!(charAt == ',' || charAt == '}')) {
                    z = true;
                    next(parsePosition);
                }
            }
            char c = charAt;
            if ((c == ',' || c == '}') && sb.length() > 0) {
                try {
                    return Integer.parseInt(sb.toString());
                } catch (NumberFormatException e) {
                }
            }
            z = !Character.isDigit(c);
            sb.append(c);
            next(parsePosition);
        }
        if (z) {
            throw new IllegalArgumentException("Invalid format argument index at position " + index + ": " + str.substring(index, parsePosition.getIndex()));
        }
        throw new IllegalArgumentException("Unterminated format element at position " + index);
    }

    private void seekNonWs(String str, ParsePosition parsePosition) {
        char[] charArray = str.toCharArray();
        do {
            int isMatch = StrMatcher.splitMatcher().isMatch(charArray, parsePosition.getIndex());
            parsePosition.setIndex(parsePosition.getIndex() + isMatch);
            if (isMatch <= 0) {
                return;
            }
        } while (parsePosition.getIndex() < str.length());
    }

    public final void applyPattern(String str) {
        String str2;
        Format format;
        int i = 0;
        if (this.registry == null) {
            super.applyPattern(str);
            this.toPattern = super.toPattern();
            return;
        }
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        StringBuilder sb = new StringBuilder(str.length());
        ParsePosition parsePosition = new ParsePosition(0);
        char[] charArray = str.toCharArray();
        int i2 = 0;
        while (parsePosition.getIndex() < str.length()) {
            switch (charArray[parsePosition.getIndex()]) {
                case '\'':
                    appendQuotedString(str, parsePosition, sb, true);
                    continue;
                case '{':
                    i2++;
                    seekNonWs(str, parsePosition);
                    int index = parsePosition.getIndex();
                    sb.append(START_FE).append(readArgumentIndex(str, next(parsePosition)));
                    seekNonWs(str, parsePosition);
                    if (charArray[parsePosition.getIndex()] == ',') {
                        str2 = parseFormatDescription(str, next(parsePosition));
                        format = getFormat(str2);
                        if (format == null) {
                            sb.append(START_FMT).append(str2);
                        }
                    } else {
                        str2 = null;
                        format = null;
                    }
                    arrayList.add(format);
                    if (format == null) {
                        str2 = null;
                    }
                    arrayList2.add(str2);
                    Validate.isTrue(arrayList.size() == i2);
                    Validate.isTrue(arrayList2.size() == i2);
                    if (charArray[parsePosition.getIndex()] != '}') {
                        throw new IllegalArgumentException("Unreadable format element at position " + index);
                    }
                    break;
            }
            sb.append(charArray[parsePosition.getIndex()]);
            next(parsePosition);
        }
        super.applyPattern(sb.toString());
        this.toPattern = insertFormats(super.toPattern(), arrayList2);
        if (containsElements(arrayList)) {
            Format[] formats = getFormats();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                Format format2 = (Format) it.next();
                if (format2 != null) {
                    formats[i] = format2;
                }
                i++;
            }
            super.setFormats(formats);
        }
    }

    public boolean equals(Object obj) {
        if (obj != this) {
            if (obj == null || !super.equals(obj) || ObjectUtils.notEqual(getClass(), obj.getClass())) {
                return false;
            }
            ExtendedMessageFormat extendedMessageFormat = (ExtendedMessageFormat) obj;
            if (ObjectUtils.notEqual(this.toPattern, extendedMessageFormat.toPattern) || ObjectUtils.notEqual(this.registry, extendedMessageFormat.registry)) {
                return false;
            }
        }
        return true;
    }

    public int hashCode() {
        return (((super.hashCode() * 31) + ObjectUtils.hashCode(this.registry)) * 31) + ObjectUtils.hashCode(this.toPattern);
    }

    public void setFormat(int i, Format format) {
        throw new UnsupportedOperationException();
    }

    public void setFormatByArgumentIndex(int i, Format format) {
        throw new UnsupportedOperationException();
    }

    public void setFormats(Format[] formatArr) {
        throw new UnsupportedOperationException();
    }

    public void setFormatsByArgumentIndex(Format[] formatArr) {
        throw new UnsupportedOperationException();
    }

    public String toPattern() {
        return this.toPattern;
    }
}
