package org.apache.http.message;

import java.util.NoSuchElementException;
import org.apache.http.HeaderIterator;
import org.apache.http.ParseException;
import org.apache.http.TokenIterator;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;

@NotThreadSafe
public class BasicTokenIterator implements TokenIterator {
    public static final String HTTP_SEPARATORS = " ,;=()<>@:\\\"/[]?{}\t";
    protected String currentHeader;
    protected String currentToken;
    protected final HeaderIterator headerIt;
    protected int searchPos = findNext(-1);

    public BasicTokenIterator(HeaderIterator headerIterator) {
        this.headerIt = (HeaderIterator) Args.notNull(headerIterator, "Header iterator");
    }

    /* access modifiers changed from: protected */
    public String createToken(String str, int i, int i2) {
        return str.substring(i, i2);
    }

    /* access modifiers changed from: protected */
    public int findNext(int i) throws ParseException {
        int findTokenSeparator;
        if (i >= 0) {
            findTokenSeparator = findTokenSeparator(i);
        } else if (!this.headerIt.hasNext()) {
            return -1;
        } else {
            this.currentHeader = this.headerIt.nextHeader().getValue();
            findTokenSeparator = 0;
        }
        int findTokenStart = findTokenStart(findTokenSeparator);
        if (findTokenStart < 0) {
            this.currentToken = null;
            return -1;
        }
        int findTokenEnd = findTokenEnd(findTokenStart);
        this.currentToken = createToken(this.currentHeader, findTokenStart, findTokenEnd);
        return findTokenEnd;
    }

    /* access modifiers changed from: protected */
    public int findTokenEnd(int i) {
        Args.notNegative(i, "Search position");
        int length = this.currentHeader.length();
        int i2 = i + 1;
        while (i2 < length && isTokenChar(this.currentHeader.charAt(i2))) {
            i2++;
        }
        return i2;
    }

    /* access modifiers changed from: protected */
    public int findTokenSeparator(int i) {
        int notNegative = Args.notNegative(i, "Search position");
        boolean z = false;
        int length = this.currentHeader.length();
        while (!z && notNegative < length) {
            char charAt = this.currentHeader.charAt(notNegative);
            if (isTokenSeparator(charAt)) {
                z = true;
            } else if (isWhitespace(charAt)) {
                notNegative++;
            } else if (isTokenChar(charAt)) {
                throw new ParseException("Tokens without separator (pos " + notNegative + "): " + this.currentHeader);
            } else {
                throw new ParseException("Invalid character after token (pos " + notNegative + "): " + this.currentHeader);
            }
        }
        return notNegative;
    }

    /* access modifiers changed from: protected */
    public int findTokenStart(int i) {
        boolean z = false;
        int notNegative = Args.notNegative(i, "Search position");
        while (!z && this.currentHeader != null) {
            int length = this.currentHeader.length();
            int i2 = notNegative;
            while (!z && i2 < length) {
                char charAt = this.currentHeader.charAt(i2);
                if (isTokenSeparator(charAt) || isWhitespace(charAt)) {
                    i2++;
                } else if (isTokenChar(this.currentHeader.charAt(i2))) {
                    z = true;
                } else {
                    throw new ParseException("Invalid character before token (pos " + i2 + "): " + this.currentHeader);
                }
            }
            if (z) {
                notNegative = i2;
            } else if (this.headerIt.hasNext()) {
                this.currentHeader = this.headerIt.nextHeader().getValue();
                notNegative = 0;
            } else {
                this.currentHeader = null;
                notNegative = i2;
            }
        }
        if (z) {
            return notNegative;
        }
        return -1;
    }

    public boolean hasNext() {
        return this.currentToken != null;
    }

    /* access modifiers changed from: protected */
    public boolean isHttpSeparator(char c) {
        return HTTP_SEPARATORS.indexOf(c) >= 0;
    }

    /* access modifiers changed from: protected */
    public boolean isTokenChar(char c) {
        return Character.isLetterOrDigit(c) || (!Character.isISOControl(c) && !isHttpSeparator(c));
    }

    /* access modifiers changed from: protected */
    public boolean isTokenSeparator(char c) {
        return c == ',';
    }

    /* access modifiers changed from: protected */
    public boolean isWhitespace(char c) {
        return c == 9 || Character.isSpaceChar(c);
    }

    public final Object next() throws NoSuchElementException, ParseException {
        return nextToken();
    }

    public String nextToken() throws NoSuchElementException, ParseException {
        if (this.currentToken == null) {
            throw new NoSuchElementException("Iteration already finished.");
        }
        String str = this.currentToken;
        this.searchPos = findNext(this.searchPos);
        return str;
    }

    public final void remove() throws UnsupportedOperationException {
        throw new UnsupportedOperationException("Removing tokens is not supported.");
    }
}
