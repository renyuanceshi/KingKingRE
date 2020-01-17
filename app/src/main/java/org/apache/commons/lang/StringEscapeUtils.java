package org.apache.commons.lang;

import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Locale;
import org.apache.commons.lang.exception.NestableRuntimeException;

public class StringEscapeUtils {
    private static final char CSV_DELIMITER = ',';
    private static final char CSV_QUOTE = '\"';
    private static final String CSV_QUOTE_STR = String.valueOf(CSV_QUOTE);
    private static final char[] CSV_SEARCH_CHARS = {CSV_DELIMITER, CSV_QUOTE, 13, 10};

    public static String escapeCsv(String str) {
        if (StringUtils.containsNone(str, CSV_SEARCH_CHARS)) {
            return str;
        }
        try {
            StringWriter stringWriter = new StringWriter();
            escapeCsv(stringWriter, str);
            return stringWriter.toString();
        } catch (IOException e) {
            throw new UnhandledException(e);
        }
    }

    public static void escapeCsv(Writer writer, String str) throws IOException {
        if (!StringUtils.containsNone(str, CSV_SEARCH_CHARS)) {
            writer.write(34);
            for (int i = 0; i < str.length(); i++) {
                char charAt = str.charAt(i);
                if (charAt == '\"') {
                    writer.write(34);
                }
                writer.write(charAt);
            }
            writer.write(34);
        } else if (str != null) {
            writer.write(str);
        }
    }

    public static String escapeHtml(String str) {
        if (str == null) {
            return null;
        }
        try {
            StringWriter stringWriter = new StringWriter((int) (((double) str.length()) * 1.5d));
            escapeHtml(stringWriter, str);
            return stringWriter.toString();
        } catch (IOException e) {
            throw new UnhandledException(e);
        }
    }

    public static void escapeHtml(Writer writer, String str) throws IOException {
        if (writer == null) {
            throw new IllegalArgumentException("The Writer must not be null.");
        } else if (str != null) {
            Entities.HTML40.escape(writer, str);
        }
    }

    public static String escapeJava(String str) {
        return escapeJavaStyleString(str, false, false);
    }

    public static void escapeJava(Writer writer, String str) throws IOException {
        escapeJavaStyleString(writer, str, false, false);
    }

    public static String escapeJavaScript(String str) {
        return escapeJavaStyleString(str, true, true);
    }

    public static void escapeJavaScript(Writer writer, String str) throws IOException {
        escapeJavaStyleString(writer, str, true, true);
    }

    private static String escapeJavaStyleString(String str, boolean z, boolean z2) {
        if (str == null) {
            return null;
        }
        try {
            StringWriter stringWriter = new StringWriter(str.length() * 2);
            escapeJavaStyleString(stringWriter, str, z, z2);
            return stringWriter.toString();
        } catch (IOException e) {
            throw new UnhandledException(e);
        }
    }

    private static void escapeJavaStyleString(Writer writer, String str, boolean z, boolean z2) throws IOException {
        if (writer == null) {
            throw new IllegalArgumentException("The Writer must not be null");
        } else if (str != null) {
            int length = str.length();
            for (int i = 0; i < length; i++) {
                char charAt = str.charAt(i);
                if (charAt <= 4095) {
                    if (charAt <= 255) {
                        if (charAt <= 127) {
                            if (charAt >= ' ') {
                                switch (charAt) {
                                    case '\"':
                                        writer.write(92);
                                        writer.write(34);
                                        break;
                                    case '\'':
                                        if (z) {
                                            writer.write(92);
                                        }
                                        writer.write(39);
                                        break;
                                    case '/':
                                        if (z2) {
                                            writer.write(92);
                                        }
                                        writer.write(47);
                                        break;
                                    case '\\':
                                        writer.write(92);
                                        writer.write(92);
                                        break;
                                    default:
                                        writer.write(charAt);
                                        break;
                                }
                            } else {
                                switch (charAt) {
                                    case 8:
                                        writer.write(92);
                                        writer.write(98);
                                        break;
                                    case 9:
                                        writer.write(92);
                                        writer.write(116);
                                        break;
                                    case 10:
                                        writer.write(92);
                                        writer.write(110);
                                        break;
                                    case 12:
                                        writer.write(92);
                                        writer.write(102);
                                        break;
                                    case 13:
                                        writer.write(92);
                                        writer.write(114);
                                        break;
                                    default:
                                        if (charAt <= 15) {
                                            writer.write(new StringBuffer().append("\\u000").append(hex(charAt)).toString());
                                            break;
                                        } else {
                                            writer.write(new StringBuffer().append("\\u00").append(hex(charAt)).toString());
                                            break;
                                        }
                                }
                            }
                        } else {
                            writer.write(new StringBuffer().append("\\u00").append(hex(charAt)).toString());
                        }
                    } else {
                        writer.write(new StringBuffer().append("\\u0").append(hex(charAt)).toString());
                    }
                } else {
                    writer.write(new StringBuffer().append("\\u").append(hex(charAt)).toString());
                }
            }
        }
    }

    public static String escapeSql(String str) {
        if (str == null) {
            return null;
        }
        return StringUtils.replace(str, "'", "''");
    }

    public static String escapeXml(String str) {
        if (str == null) {
            return null;
        }
        return Entities.XML.escape(str);
    }

    public static void escapeXml(Writer writer, String str) throws IOException {
        if (writer == null) {
            throw new IllegalArgumentException("The Writer must not be null.");
        } else if (str != null) {
            Entities.XML.escape(writer, str);
        }
    }

    private static String hex(char c) {
        return Integer.toHexString(c).toUpperCase(Locale.ENGLISH);
    }

    public static String unescapeCsv(String str) {
        if (str == null) {
            return null;
        }
        try {
            StringWriter stringWriter = new StringWriter();
            unescapeCsv(stringWriter, str);
            return stringWriter.toString();
        } catch (IOException e) {
            throw new UnhandledException(e);
        }
    }

    public static void unescapeCsv(Writer writer, String str) throws IOException {
        if (str != null) {
            if (str.length() < 2) {
                writer.write(str);
            } else if (str.charAt(0) == '\"' && str.charAt(str.length() - 1) == '\"') {
                String substring = str.substring(1, str.length() - 1);
                if (StringUtils.containsAny(substring, CSV_SEARCH_CHARS)) {
                    str = StringUtils.replace(substring, new StringBuffer().append(CSV_QUOTE_STR).append(CSV_QUOTE_STR).toString(), CSV_QUOTE_STR);
                }
                writer.write(str);
            } else {
                writer.write(str);
            }
        }
    }

    public static String unescapeHtml(String str) {
        if (str == null) {
            return null;
        }
        try {
            StringWriter stringWriter = new StringWriter((int) (((double) str.length()) * 1.5d));
            unescapeHtml(stringWriter, str);
            return stringWriter.toString();
        } catch (IOException e) {
            throw new UnhandledException(e);
        }
    }

    public static void unescapeHtml(Writer writer, String str) throws IOException {
        if (writer == null) {
            throw new IllegalArgumentException("The Writer must not be null.");
        } else if (str != null) {
            Entities.HTML40.unescape(writer, str);
        }
    }

    public static String unescapeJava(String str) {
        if (str == null) {
            return null;
        }
        try {
            StringWriter stringWriter = new StringWriter(str.length());
            unescapeJava(stringWriter, str);
            return stringWriter.toString();
        } catch (IOException e) {
            throw new UnhandledException(e);
        }
    }

    public static void unescapeJava(Writer writer, String str) throws IOException {
        if (writer == null) {
            throw new IllegalArgumentException("The Writer must not be null");
        } else if (str != null) {
            int length = str.length();
            StringBuffer stringBuffer = new StringBuffer(4);
            boolean z = false;
            boolean z2 = false;
            for (int i = 0; i < length; i++) {
                char charAt = str.charAt(i);
                if (z) {
                    stringBuffer.append(charAt);
                    if (stringBuffer.length() == 4) {
                        try {
                            writer.write((char) Integer.parseInt(stringBuffer.toString(), 16));
                            stringBuffer.setLength(0);
                            z = false;
                            z2 = false;
                        } catch (NumberFormatException e) {
                            throw new NestableRuntimeException(new StringBuffer().append("Unable to parse unicode value: ").append(stringBuffer).toString(), e);
                        }
                    }
                } else if (z2) {
                    switch (charAt) {
                        case '\"':
                            writer.write(34);
                            z2 = false;
                            break;
                        case '\'':
                            writer.write(39);
                            z2 = false;
                            break;
                        case '\\':
                            writer.write(92);
                            z2 = false;
                            break;
                        case 'b':
                            writer.write(8);
                            z2 = false;
                            break;
                        case 'f':
                            writer.write(12);
                            z2 = false;
                            break;
                        case 'n':
                            writer.write(10);
                            z2 = false;
                            break;
                        case 'r':
                            writer.write(13);
                            z2 = false;
                            break;
                        case 't':
                            writer.write(9);
                            z2 = false;
                            break;
                        case 'u':
                            z = true;
                            z2 = false;
                            break;
                        default:
                            writer.write(charAt);
                            z2 = false;
                            break;
                    }
                } else if (charAt == '\\') {
                    z2 = true;
                } else {
                    writer.write(charAt);
                }
            }
            if (z2) {
                writer.write(92);
            }
        }
    }

    public static String unescapeJavaScript(String str) {
        return unescapeJava(str);
    }

    public static void unescapeJavaScript(Writer writer, String str) throws IOException {
        unescapeJava(writer, str);
    }

    public static String unescapeXml(String str) {
        if (str == null) {
            return null;
        }
        return Entities.XML.unescape(str);
    }

    public static void unescapeXml(Writer writer, String str) throws IOException {
        if (writer == null) {
            throw new IllegalArgumentException("The Writer must not be null.");
        } else if (str != null) {
            Entities.XML.unescape(writer, str);
        }
    }
}
