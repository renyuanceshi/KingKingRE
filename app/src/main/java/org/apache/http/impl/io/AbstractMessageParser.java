package org.apache.http.impl.io;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.Header;
import org.apache.http.HttpException;
import org.apache.http.HttpMessage;
import org.apache.http.MessageConstraintException;
import org.apache.http.ParseException;
import org.apache.http.ProtocolException;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.config.MessageConstraints;
import org.apache.http.io.HttpMessageParser;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.message.BasicLineParser;
import org.apache.http.message.LineParser;
import org.apache.http.params.HttpParamConfig;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@NotThreadSafe
public abstract class AbstractMessageParser<T extends HttpMessage> implements HttpMessageParser<T> {
    private static final int HEADERS = 1;
    private static final int HEAD_LINE = 0;
    private final List<CharArrayBuffer> headerLines;
    protected final LineParser lineParser;
    private T message;
    private final MessageConstraints messageConstraints;
    private final SessionInputBuffer sessionBuffer;
    private int state;

    public AbstractMessageParser(SessionInputBuffer sessionInputBuffer, LineParser lineParser2, MessageConstraints messageConstraints2) {
        this.sessionBuffer = (SessionInputBuffer) Args.notNull(sessionInputBuffer, "Session input buffer");
        this.lineParser = lineParser2 == null ? BasicLineParser.INSTANCE : lineParser2;
        this.messageConstraints = messageConstraints2 == null ? MessageConstraints.DEFAULT : messageConstraints2;
        this.headerLines = new ArrayList();
        this.state = 0;
    }

    @Deprecated
    public AbstractMessageParser(SessionInputBuffer sessionInputBuffer, LineParser lineParser2, HttpParams httpParams) {
        Args.notNull(sessionInputBuffer, "Session input buffer");
        Args.notNull(httpParams, "HTTP parameters");
        this.sessionBuffer = sessionInputBuffer;
        this.messageConstraints = HttpParamConfig.getMessageConstraints(httpParams);
        this.lineParser = lineParser2 == null ? BasicLineParser.INSTANCE : lineParser2;
        this.headerLines = new ArrayList();
        this.state = 0;
    }

    public static Header[] parseHeaders(SessionInputBuffer sessionInputBuffer, int i, int i2, LineParser lineParser2) throws HttpException, IOException {
        ArrayList arrayList = new ArrayList();
        if (lineParser2 == null) {
            lineParser2 = BasicLineParser.INSTANCE;
        }
        return parseHeaders(sessionInputBuffer, i, i2, lineParser2, arrayList);
    }

    public static Header[] parseHeaders(SessionInputBuffer sessionInputBuffer, int i, int i2, LineParser lineParser2, List<CharArrayBuffer> list) throws HttpException, IOException {
        CharArrayBuffer charArrayBuffer;
        CharArrayBuffer charArrayBuffer2;
        int i3 = 0;
        Args.notNull(sessionInputBuffer, "Session input buffer");
        Args.notNull(lineParser2, "Line parser");
        Args.notNull(list, "Header line list");
        CharArrayBuffer charArrayBuffer3 = null;
        CharArrayBuffer charArrayBuffer4 = null;
        while (true) {
            if (charArrayBuffer4 == null) {
                charArrayBuffer4 = new CharArrayBuffer(64);
            } else {
                charArrayBuffer4.clear();
            }
            if (sessionInputBuffer.readLine(charArrayBuffer4) == -1 || charArrayBuffer4.length() < 1) {
                Header[] headerArr = new Header[list.size()];
            } else {
                if ((charArrayBuffer4.charAt(0) == ' ' || charArrayBuffer4.charAt(0) == 9) && charArrayBuffer3 != null) {
                    int i4 = 0;
                    while (i4 < charArrayBuffer4.length() && ((r4 = charArrayBuffer4.charAt(i4)) == ' ' || r4 == 9)) {
                        i4++;
                    }
                    if (i2 <= 0 || ((charArrayBuffer3.length() + 1) + charArrayBuffer4.length()) - i4 <= i2) {
                        charArrayBuffer3.append(' ');
                        charArrayBuffer3.append(charArrayBuffer4, i4, charArrayBuffer4.length() - i4);
                        charArrayBuffer = charArrayBuffer3;
                        charArrayBuffer2 = charArrayBuffer4;
                    } else {
                        throw new MessageConstraintException("Maximum line length limit exceeded");
                    }
                } else {
                    list.add(charArrayBuffer4);
                    charArrayBuffer = charArrayBuffer4;
                    charArrayBuffer2 = null;
                }
                if (i <= 0 || list.size() < i) {
                    charArrayBuffer3 = charArrayBuffer;
                    charArrayBuffer4 = charArrayBuffer2;
                } else {
                    throw new MessageConstraintException("Maximum header count exceeded");
                }
            }
        }
        Header[] headerArr2 = new Header[list.size()];
        while (i3 < list.size()) {
            try {
                headerArr2[i3] = lineParser2.parseHeader(list.get(i3));
                i3++;
            } catch (ParseException e) {
                throw new ProtocolException(e.getMessage());
            }
        }
        return headerArr2;
    }

    public T parse() throws IOException, HttpException {
        switch (this.state) {
            case 0:
                try {
                    this.message = parseHead(this.sessionBuffer);
                    this.state = 1;
                    break;
                } catch (ParseException e) {
                    throw new ProtocolException(e.getMessage(), e);
                }
            case 1:
                break;
            default:
                throw new IllegalStateException("Inconsistent parser state");
        }
        this.message.setHeaders(parseHeaders(this.sessionBuffer, this.messageConstraints.getMaxHeaderCount(), this.messageConstraints.getMaxLineLength(), this.lineParser, this.headerLines));
        T t = this.message;
        this.message = null;
        this.headerLines.clear();
        this.state = 0;
        return t;
    }

    /* access modifiers changed from: protected */
    public abstract T parseHead(SessionInputBuffer sessionInputBuffer) throws IOException, HttpException, ParseException;
}
