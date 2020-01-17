package org.apache.commons.lang3.text;

import java.io.Reader;
import java.io.Serializable;
import java.io.Writer;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.SystemUtils;
import org.apache.commons.lang3.builder.Builder;

public class StrBuilder implements CharSequence, Appendable, Serializable, Builder<String> {
    static final int CAPACITY = 32;
    private static final long serialVersionUID = 7628716375283629643L;
    protected char[] buffer;
    private String newLine;
    private String nullText;
    protected int size;

    class StrBuilderReader extends Reader {
        private int mark;
        private int pos;

        StrBuilderReader() {
        }

        public void close() {
        }

        public void mark(int i) {
            this.mark = this.pos;
        }

        public boolean markSupported() {
            return true;
        }

        public int read() {
            if (!ready()) {
                return -1;
            }
            StrBuilder strBuilder = StrBuilder.this;
            int i = this.pos;
            this.pos = i + 1;
            return strBuilder.charAt(i);
        }

        public int read(char[] cArr, int i, int i2) {
            if (i < 0 || i2 < 0 || i > cArr.length || i + i2 > cArr.length || i + i2 < 0) {
                throw new IndexOutOfBoundsException();
            } else if (i2 == 0) {
                return 0;
            } else {
                if (this.pos >= StrBuilder.this.size()) {
                    return -1;
                }
                int size = this.pos + i2 > StrBuilder.this.size() ? StrBuilder.this.size() - this.pos : i2;
                StrBuilder.this.getChars(this.pos, this.pos + size, cArr, i);
                this.pos += size;
                return size;
            }
        }

        public boolean ready() {
            return this.pos < StrBuilder.this.size();
        }

        public void reset() {
            this.pos = this.mark;
        }

        public long skip(long j) {
            long size = ((long) this.pos) + j > ((long) StrBuilder.this.size()) ? (long) (StrBuilder.this.size() - this.pos) : j;
            if (size < 0) {
                return 0;
            }
            this.pos = (int) (((long) this.pos) + size);
            return size;
        }
    }

    class StrBuilderTokenizer extends StrTokenizer {
        StrBuilderTokenizer() {
        }

        public String getContent() {
            String content = super.getContent();
            return content == null ? StrBuilder.this.toString() : content;
        }

        /* access modifiers changed from: protected */
        public List<String> tokenize(char[] cArr, int i, int i2) {
            return cArr == null ? super.tokenize(StrBuilder.this.buffer, 0, StrBuilder.this.size()) : super.tokenize(cArr, i, i2);
        }
    }

    class StrBuilderWriter extends Writer {
        StrBuilderWriter() {
        }

        public void close() {
        }

        public void flush() {
        }

        public void write(int i) {
            StrBuilder.this.append((char) i);
        }

        public void write(String str) {
            StrBuilder.this.append(str);
        }

        public void write(String str, int i, int i2) {
            StrBuilder.this.append(str, i, i2);
        }

        public void write(char[] cArr) {
            StrBuilder.this.append(cArr);
        }

        public void write(char[] cArr, int i, int i2) {
            StrBuilder.this.append(cArr, i, i2);
        }
    }

    public StrBuilder() {
        this(32);
    }

    public StrBuilder(int i) {
        this.buffer = new char[(i <= 0 ? 32 : i)];
    }

    public StrBuilder(String str) {
        if (str == null) {
            this.buffer = new char[32];
            return;
        }
        this.buffer = new char[(str.length() + 32)];
        append(str);
    }

    private void deleteImpl(int i, int i2, int i3) {
        System.arraycopy(this.buffer, i2, this.buffer, i, this.size - i2);
        this.size -= i3;
    }

    private StrBuilder replaceImpl(StrMatcher strMatcher, String str, int i, int i2, int i3) {
        int i4;
        int i5;
        if (!(strMatcher == null || this.size == 0)) {
            int length = str == null ? 0 : str.length();
            char[] cArr = this.buffer;
            int i6 = i2;
            int i7 = i3;
            int i8 = i;
            while (i8 < i6 && i7 != 0) {
                int isMatch = strMatcher.isMatch(cArr, i8, i, i6);
                if (isMatch > 0) {
                    replaceImpl(i8, i8 + isMatch, isMatch, str, length);
                    i5 = (i6 - isMatch) + length;
                    i8 = (i8 + length) - 1;
                    i4 = i7 > 0 ? i7 - 1 : i7;
                } else {
                    i4 = i7;
                    i5 = i6;
                }
                i8++;
                i6 = i5;
                i7 = i4;
            }
        }
        return this;
    }

    private void replaceImpl(int i, int i2, int i3, String str, int i4) {
        int i5 = (this.size - i3) + i4;
        if (i4 != i3) {
            ensureCapacity(i5);
            System.arraycopy(this.buffer, i2, this.buffer, i + i4, this.size - i2);
            this.size = i5;
        }
        if (i4 > 0) {
            str.getChars(0, i4, this.buffer, i);
        }
    }

    public StrBuilder append(char c) {
        ensureCapacity(length() + 1);
        char[] cArr = this.buffer;
        int i = this.size;
        this.size = i + 1;
        cArr[i] = (char) c;
        return this;
    }

    public StrBuilder append(double d) {
        return append(String.valueOf(d));
    }

    public StrBuilder append(float f) {
        return append(String.valueOf(f));
    }

    public StrBuilder append(int i) {
        return append(String.valueOf(i));
    }

    public StrBuilder append(long j) {
        return append(String.valueOf(j));
    }

    public StrBuilder append(CharSequence charSequence) {
        return charSequence == null ? appendNull() : append(charSequence.toString());
    }

    public StrBuilder append(CharSequence charSequence, int i, int i2) {
        return charSequence == null ? appendNull() : append(charSequence.toString(), i, i2);
    }

    public StrBuilder append(Object obj) {
        return obj == null ? appendNull() : append(obj.toString());
    }

    public StrBuilder append(String str) {
        if (str == null) {
            return appendNull();
        }
        int length = str.length();
        if (length <= 0) {
            return this;
        }
        int length2 = length();
        ensureCapacity(length2 + length);
        str.getChars(0, length, this.buffer, length2);
        this.size = length + this.size;
        return this;
    }

    public StrBuilder append(String str, int i, int i2) {
        if (str == null) {
            return appendNull();
        }
        if (i < 0 || i > str.length()) {
            throw new StringIndexOutOfBoundsException("startIndex must be valid");
        } else if (i2 < 0 || i + i2 > str.length()) {
            throw new StringIndexOutOfBoundsException("length must be valid");
        } else if (i2 <= 0) {
            return this;
        } else {
            int length = length();
            ensureCapacity(length + i2);
            str.getChars(i, i + i2, this.buffer, length);
            this.size += i2;
            return this;
        }
    }

    public StrBuilder append(String str, Object... objArr) {
        return append(String.format(str, objArr));
    }

    public StrBuilder append(StringBuffer stringBuffer) {
        if (stringBuffer == null) {
            return appendNull();
        }
        int length = stringBuffer.length();
        if (length <= 0) {
            return this;
        }
        int length2 = length();
        ensureCapacity(length2 + length);
        stringBuffer.getChars(0, length, this.buffer, length2);
        this.size = length + this.size;
        return this;
    }

    public StrBuilder append(StringBuffer stringBuffer, int i, int i2) {
        if (stringBuffer == null) {
            return appendNull();
        }
        if (i < 0 || i > stringBuffer.length()) {
            throw new StringIndexOutOfBoundsException("startIndex must be valid");
        } else if (i2 < 0 || i + i2 > stringBuffer.length()) {
            throw new StringIndexOutOfBoundsException("length must be valid");
        } else if (i2 <= 0) {
            return this;
        } else {
            int length = length();
            ensureCapacity(length + i2);
            stringBuffer.getChars(i, i + i2, this.buffer, length);
            this.size += i2;
            return this;
        }
    }

    public StrBuilder append(StringBuilder sb) {
        if (sb == null) {
            return appendNull();
        }
        int length = sb.length();
        if (length <= 0) {
            return this;
        }
        int length2 = length();
        ensureCapacity(length2 + length);
        sb.getChars(0, length, this.buffer, length2);
        this.size = length + this.size;
        return this;
    }

    public StrBuilder append(StringBuilder sb, int i, int i2) {
        if (sb == null) {
            return appendNull();
        }
        if (i < 0 || i > sb.length()) {
            throw new StringIndexOutOfBoundsException("startIndex must be valid");
        } else if (i2 < 0 || i + i2 > sb.length()) {
            throw new StringIndexOutOfBoundsException("length must be valid");
        } else if (i2 <= 0) {
            return this;
        } else {
            int length = length();
            ensureCapacity(length + i2);
            sb.getChars(i, i + i2, this.buffer, length);
            this.size += i2;
            return this;
        }
    }

    public StrBuilder append(StrBuilder strBuilder) {
        if (strBuilder == null) {
            return appendNull();
        }
        int length = strBuilder.length();
        if (length <= 0) {
            return this;
        }
        int length2 = length();
        ensureCapacity(length2 + length);
        System.arraycopy(strBuilder.buffer, 0, this.buffer, length2, length);
        this.size = length + this.size;
        return this;
    }

    public StrBuilder append(StrBuilder strBuilder, int i, int i2) {
        if (strBuilder == null) {
            return appendNull();
        }
        if (i < 0 || i > strBuilder.length()) {
            throw new StringIndexOutOfBoundsException("startIndex must be valid");
        } else if (i2 < 0 || i + i2 > strBuilder.length()) {
            throw new StringIndexOutOfBoundsException("length must be valid");
        } else if (i2 <= 0) {
            return this;
        } else {
            int length = length();
            ensureCapacity(length + i2);
            strBuilder.getChars(i, i + i2, this.buffer, length);
            this.size += i2;
            return this;
        }
    }

    public StrBuilder append(boolean z) {
        if (z) {
            ensureCapacity(this.size + 4);
            char[] cArr = this.buffer;
            int i = this.size;
            this.size = i + 1;
            cArr[i] = (char) 116;
            char[] cArr2 = this.buffer;
            int i2 = this.size;
            this.size = i2 + 1;
            cArr2[i2] = (char) 114;
            char[] cArr3 = this.buffer;
            int i3 = this.size;
            this.size = i3 + 1;
            cArr3[i3] = (char) 117;
            char[] cArr4 = this.buffer;
            int i4 = this.size;
            this.size = i4 + 1;
            cArr4[i4] = (char) 101;
        } else {
            ensureCapacity(this.size + 5);
            char[] cArr5 = this.buffer;
            int i5 = this.size;
            this.size = i5 + 1;
            cArr5[i5] = (char) 102;
            char[] cArr6 = this.buffer;
            int i6 = this.size;
            this.size = i6 + 1;
            cArr6[i6] = (char) 97;
            char[] cArr7 = this.buffer;
            int i7 = this.size;
            this.size = i7 + 1;
            cArr7[i7] = (char) 108;
            char[] cArr8 = this.buffer;
            int i8 = this.size;
            this.size = i8 + 1;
            cArr8[i8] = (char) 115;
            char[] cArr9 = this.buffer;
            int i9 = this.size;
            this.size = i9 + 1;
            cArr9[i9] = (char) 101;
        }
        return this;
    }

    public StrBuilder append(char[] cArr) {
        if (cArr == null) {
            return appendNull();
        }
        int length = cArr.length;
        if (length <= 0) {
            return this;
        }
        int length2 = length();
        ensureCapacity(length2 + length);
        System.arraycopy(cArr, 0, this.buffer, length2, length);
        this.size = length + this.size;
        return this;
    }

    public StrBuilder append(char[] cArr, int i, int i2) {
        if (cArr == null) {
            return appendNull();
        }
        if (i < 0 || i > cArr.length) {
            throw new StringIndexOutOfBoundsException("Invalid startIndex: " + i2);
        } else if (i2 < 0 || i + i2 > cArr.length) {
            throw new StringIndexOutOfBoundsException("Invalid length: " + i2);
        } else if (i2 <= 0) {
            return this;
        } else {
            int length = length();
            ensureCapacity(length + i2);
            System.arraycopy(cArr, i, this.buffer, length, i2);
            this.size += i2;
            return this;
        }
    }

    public StrBuilder appendAll(Iterable<?> iterable) {
        if (iterable != null) {
            for (Object append : iterable) {
                append((Object) append);
            }
        }
        return this;
    }

    public StrBuilder appendAll(Iterator<?> it) {
        if (it != null) {
            while (it.hasNext()) {
                append((Object) it.next());
            }
        }
        return this;
    }

    public <T> StrBuilder appendAll(T... tArr) {
        if (tArr != null && tArr.length > 0) {
            for (T append : tArr) {
                append((Object) append);
            }
        }
        return this;
    }

    public StrBuilder appendFixedWidthPadLeft(int i, int i2, char c) {
        return appendFixedWidthPadLeft((Object) String.valueOf(i), i2, c);
    }

    public StrBuilder appendFixedWidthPadLeft(Object obj, int i, char c) {
        if (i > 0) {
            ensureCapacity(this.size + i);
            String nullText2 = obj == null ? getNullText() : obj.toString();
            if (nullText2 == null) {
                nullText2 = "";
            }
            int length = nullText2.length();
            if (length >= i) {
                nullText2.getChars(length - i, length, this.buffer, this.size);
            } else {
                int i2 = i - length;
                for (int i3 = 0; i3 < i2; i3++) {
                    this.buffer[this.size + i3] = (char) c;
                }
                nullText2.getChars(0, length, this.buffer, i2 + this.size);
            }
            this.size += i;
        }
        return this;
    }

    public StrBuilder appendFixedWidthPadRight(int i, int i2, char c) {
        return appendFixedWidthPadRight((Object) String.valueOf(i), i2, c);
    }

    public StrBuilder appendFixedWidthPadRight(Object obj, int i, char c) {
        if (i > 0) {
            ensureCapacity(this.size + i);
            String nullText2 = obj == null ? getNullText() : obj.toString();
            if (nullText2 == null) {
                nullText2 = "";
            }
            int length = nullText2.length();
            if (length >= i) {
                nullText2.getChars(0, i, this.buffer, this.size);
            } else {
                nullText2.getChars(0, length, this.buffer, this.size);
                for (int i2 = 0; i2 < i - length; i2++) {
                    this.buffer[this.size + length + i2] = (char) c;
                }
            }
            this.size += i;
        }
        return this;
    }

    public StrBuilder appendNewLine() {
        if (this.newLine != null) {
            return append(this.newLine);
        }
        append(SystemUtils.LINE_SEPARATOR);
        return this;
    }

    public StrBuilder appendNull() {
        return this.nullText == null ? this : append(this.nullText);
    }

    public StrBuilder appendPadding(int i, char c) {
        if (i >= 0) {
            ensureCapacity(this.size + i);
            for (int i2 = 0; i2 < i; i2++) {
                char[] cArr = this.buffer;
                int i3 = this.size;
                this.size = i3 + 1;
                cArr[i3] = (char) c;
            }
        }
        return this;
    }

    public StrBuilder appendSeparator(char c) {
        if (size() > 0) {
            append(c);
        }
        return this;
    }

    public StrBuilder appendSeparator(char c, char c2) {
        if (size() > 0) {
            append(c);
        } else {
            append(c2);
        }
        return this;
    }

    public StrBuilder appendSeparator(char c, int i) {
        if (i > 0) {
            append(c);
        }
        return this;
    }

    public StrBuilder appendSeparator(String str) {
        return appendSeparator(str, (String) null);
    }

    public StrBuilder appendSeparator(String str, int i) {
        if (str != null && i > 0) {
            append(str);
        }
        return this;
    }

    public StrBuilder appendSeparator(String str, String str2) {
        if (!isEmpty()) {
            str2 = str;
        }
        if (str2 != null) {
            append(str2);
        }
        return this;
    }

    public StrBuilder appendWithSeparators(Iterable<?> iterable, String str) {
        if (iterable != null) {
            String objectUtils = ObjectUtils.toString(str);
            Iterator<?> it = iterable.iterator();
            while (it.hasNext()) {
                append((Object) it.next());
                if (it.hasNext()) {
                    append(objectUtils);
                }
            }
        }
        return this;
    }

    public StrBuilder appendWithSeparators(Iterator<?> it, String str) {
        if (it != null) {
            String objectUtils = ObjectUtils.toString(str);
            while (it.hasNext()) {
                append((Object) it.next());
                if (it.hasNext()) {
                    append(objectUtils);
                }
            }
        }
        return this;
    }

    public StrBuilder appendWithSeparators(Object[] objArr, String str) {
        if (objArr != null && objArr.length > 0) {
            String objectUtils = ObjectUtils.toString(str);
            append(objArr[0]);
            for (int i = 1; i < objArr.length; i++) {
                append(objectUtils);
                append(objArr[i]);
            }
        }
        return this;
    }

    public StrBuilder appendln(char c) {
        return append(c).appendNewLine();
    }

    public StrBuilder appendln(double d) {
        return append(d).appendNewLine();
    }

    public StrBuilder appendln(float f) {
        return append(f).appendNewLine();
    }

    public StrBuilder appendln(int i) {
        return append(i).appendNewLine();
    }

    public StrBuilder appendln(long j) {
        return append(j).appendNewLine();
    }

    public StrBuilder appendln(Object obj) {
        return append(obj).appendNewLine();
    }

    public StrBuilder appendln(String str) {
        return append(str).appendNewLine();
    }

    public StrBuilder appendln(String str, int i, int i2) {
        return append(str, i, i2).appendNewLine();
    }

    public StrBuilder appendln(String str, Object... objArr) {
        return append(str, objArr).appendNewLine();
    }

    public StrBuilder appendln(StringBuffer stringBuffer) {
        return append(stringBuffer).appendNewLine();
    }

    public StrBuilder appendln(StringBuffer stringBuffer, int i, int i2) {
        return append(stringBuffer, i, i2).appendNewLine();
    }

    public StrBuilder appendln(StringBuilder sb) {
        return append(sb).appendNewLine();
    }

    public StrBuilder appendln(StringBuilder sb, int i, int i2) {
        return append(sb, i, i2).appendNewLine();
    }

    public StrBuilder appendln(StrBuilder strBuilder) {
        return append(strBuilder).appendNewLine();
    }

    public StrBuilder appendln(StrBuilder strBuilder, int i, int i2) {
        return append(strBuilder, i, i2).appendNewLine();
    }

    public StrBuilder appendln(boolean z) {
        return append(z).appendNewLine();
    }

    public StrBuilder appendln(char[] cArr) {
        return append(cArr).appendNewLine();
    }

    public StrBuilder appendln(char[] cArr, int i, int i2) {
        return append(cArr, i, i2).appendNewLine();
    }

    public Reader asReader() {
        return new StrBuilderReader();
    }

    public StrTokenizer asTokenizer() {
        return new StrBuilderTokenizer();
    }

    public Writer asWriter() {
        return new StrBuilderWriter();
    }

    public String build() {
        return toString();
    }

    public int capacity() {
        return this.buffer.length;
    }

    public char charAt(int i) {
        if (i >= 0 && i < length()) {
            return this.buffer[i];
        }
        throw new StringIndexOutOfBoundsException(i);
    }

    public StrBuilder clear() {
        this.size = 0;
        return this;
    }

    public boolean contains(char c) {
        char[] cArr = this.buffer;
        for (int i = 0; i < this.size; i++) {
            if (cArr[i] == c) {
                return true;
            }
        }
        return false;
    }

    public boolean contains(String str) {
        return indexOf(str, 0) >= 0;
    }

    public boolean contains(StrMatcher strMatcher) {
        return indexOf(strMatcher, 0) >= 0;
    }

    public StrBuilder delete(int i, int i2) {
        int validateRange = validateRange(i, i2);
        int i3 = validateRange - i;
        if (i3 > 0) {
            deleteImpl(i, validateRange, i3);
        }
        return this;
    }

    public StrBuilder deleteAll(char c) {
        int i = 0;
        while (i < this.size) {
            if (this.buffer[i] == c) {
                int i2 = i;
                do {
                    i2++;
                    if (i2 >= this.size) {
                        break;
                    }
                } while (this.buffer[i2] == c);
                int i3 = i2 - i;
                deleteImpl(i, i2, i3);
                i = i2 - i3;
            }
            i++;
        }
        return this;
    }

    public StrBuilder deleteAll(String str) {
        int length = str == null ? 0 : str.length();
        if (length > 0) {
            int indexOf = indexOf(str, 0);
            while (indexOf >= 0) {
                deleteImpl(indexOf, indexOf + length, length);
                indexOf = indexOf(str, indexOf);
            }
        }
        return this;
    }

    public StrBuilder deleteAll(StrMatcher strMatcher) {
        return replace(strMatcher, (String) null, 0, this.size, -1);
    }

    public StrBuilder deleteCharAt(int i) {
        if (i < 0 || i >= this.size) {
            throw new StringIndexOutOfBoundsException(i);
        }
        deleteImpl(i, i + 1, 1);
        return this;
    }

    public StrBuilder deleteFirst(char c) {
        int i = 0;
        while (true) {
            if (i >= this.size) {
                break;
            } else if (this.buffer[i] == c) {
                deleteImpl(i, i + 1, 1);
                break;
            } else {
                i++;
            }
        }
        return this;
    }

    public StrBuilder deleteFirst(String str) {
        int indexOf;
        int length = str == null ? 0 : str.length();
        if (length > 0 && (indexOf = indexOf(str, 0)) >= 0) {
            deleteImpl(indexOf, indexOf + length, length);
        }
        return this;
    }

    public StrBuilder deleteFirst(StrMatcher strMatcher) {
        return replace(strMatcher, (String) null, 0, this.size, 1);
    }

    public boolean endsWith(String str) {
        if (str == null) {
            return false;
        }
        int length = str.length();
        if (length == 0) {
            return true;
        }
        if (length > this.size) {
            return false;
        }
        int i = this.size - length;
        int i2 = 0;
        while (i2 < length) {
            if (this.buffer[i] != str.charAt(i2)) {
                return false;
            }
            i2++;
            i++;
        }
        return true;
    }

    public StrBuilder ensureCapacity(int i) {
        if (i > this.buffer.length) {
            char[] cArr = this.buffer;
            this.buffer = new char[(i * 2)];
            System.arraycopy(cArr, 0, this.buffer, 0, this.size);
        }
        return this;
    }

    public boolean equals(Object obj) {
        if (obj instanceof StrBuilder) {
            return equals((StrBuilder) obj);
        }
        return false;
    }

    public boolean equals(StrBuilder strBuilder) {
        if (this == strBuilder) {
            return true;
        }
        if (this.size != strBuilder.size) {
            return false;
        }
        char[] cArr = this.buffer;
        char[] cArr2 = strBuilder.buffer;
        for (int i = this.size - 1; i >= 0; i--) {
            if (cArr[i] != cArr2[i]) {
                return false;
            }
        }
        return true;
    }

    public boolean equalsIgnoreCase(StrBuilder strBuilder) {
        if (this == strBuilder) {
            return true;
        }
        if (this.size != strBuilder.size) {
            return false;
        }
        char[] cArr = this.buffer;
        char[] cArr2 = strBuilder.buffer;
        for (int i = this.size - 1; i >= 0; i--) {
            char c = cArr[i];
            char c2 = cArr2[i];
            if (c != c2 && Character.toUpperCase(c) != Character.toUpperCase(c2)) {
                return false;
            }
        }
        return true;
    }

    public void getChars(int i, int i2, char[] cArr, int i3) {
        if (i < 0) {
            throw new StringIndexOutOfBoundsException(i);
        } else if (i2 < 0 || i2 > length()) {
            throw new StringIndexOutOfBoundsException(i2);
        } else if (i > i2) {
            throw new StringIndexOutOfBoundsException("end < start");
        } else {
            System.arraycopy(this.buffer, i, cArr, i3, i2 - i);
        }
    }

    public char[] getChars(char[] cArr) {
        int length = length();
        if (cArr == null || cArr.length < length) {
            cArr = new char[length];
        }
        System.arraycopy(this.buffer, 0, cArr, 0, length);
        return cArr;
    }

    public String getNewLineText() {
        return this.newLine;
    }

    public String getNullText() {
        return this.nullText;
    }

    public int hashCode() {
        char[] cArr = this.buffer;
        int i = 0;
        for (int i2 = this.size - 1; i2 >= 0; i2--) {
            i = (i * 31) + cArr[i2];
        }
        return i;
    }

    public int indexOf(char c) {
        return indexOf(c, 0);
    }

    public int indexOf(char c, int i) {
        if (i < 0) {
            i = 0;
        }
        if (i >= this.size) {
            return -1;
        }
        char[] cArr = this.buffer;
        for (int i2 = i; i2 < this.size; i2++) {
            if (cArr[i2] == c) {
                return i2;
            }
        }
        return -1;
    }

    public int indexOf(String str) {
        return indexOf(str, 0);
    }

    public int indexOf(String str, int i) {
        int i2 = i < 0 ? 0 : i;
        if (str == null || i2 >= this.size) {
            return -1;
        }
        int length = str.length();
        if (length == 1) {
            return indexOf(str.charAt(0), i2);
        }
        if (length == 0) {
            return i2;
        }
        if (length > this.size) {
            return -1;
        }
        char[] cArr = this.buffer;
        int i3 = this.size;
        while (i2 < (i3 - length) + 1) {
            int i4 = 0;
            while (i4 < length) {
                if (str.charAt(i4) != cArr[i2 + i4]) {
                    i2++;
                } else {
                    i4++;
                }
            }
            return i2;
        }
        return -1;
    }

    public int indexOf(StrMatcher strMatcher) {
        return indexOf(strMatcher, 0);
    }

    public int indexOf(StrMatcher strMatcher, int i) {
        int i2 = i < 0 ? 0 : i;
        if (strMatcher == null || i2 >= this.size) {
            return -1;
        }
        int i3 = this.size;
        char[] cArr = this.buffer;
        for (int i4 = i2; i4 < i3; i4++) {
            if (strMatcher.isMatch(cArr, i4, i2, i3) > 0) {
                return i4;
            }
        }
        return -1;
    }

    public StrBuilder insert(int i, char c) {
        validateIndex(i);
        ensureCapacity(this.size + 1);
        System.arraycopy(this.buffer, i, this.buffer, i + 1, this.size - i);
        this.buffer[i] = (char) c;
        this.size++;
        return this;
    }

    public StrBuilder insert(int i, double d) {
        return insert(i, String.valueOf(d));
    }

    public StrBuilder insert(int i, float f) {
        return insert(i, String.valueOf(f));
    }

    public StrBuilder insert(int i, int i2) {
        return insert(i, String.valueOf(i2));
    }

    public StrBuilder insert(int i, long j) {
        return insert(i, String.valueOf(j));
    }

    public StrBuilder insert(int i, Object obj) {
        return obj == null ? insert(i, this.nullText) : insert(i, obj.toString());
    }

    public StrBuilder insert(int i, String str) {
        int length;
        validateIndex(i);
        if (str == null) {
            str = this.nullText;
        }
        if (str != null && (length = str.length()) > 0) {
            int i2 = this.size + length;
            ensureCapacity(i2);
            System.arraycopy(this.buffer, i, this.buffer, i + length, this.size - i);
            this.size = i2;
            str.getChars(0, length, this.buffer, i);
        }
        return this;
    }

    public StrBuilder insert(int i, boolean z) {
        validateIndex(i);
        if (z) {
            ensureCapacity(this.size + 4);
            System.arraycopy(this.buffer, i, this.buffer, i + 4, this.size - i);
            int i2 = i + 1;
            this.buffer[i] = (char) 116;
            int i3 = i2 + 1;
            this.buffer[i2] = (char) 114;
            this.buffer[i3] = (char) 117;
            this.buffer[i3 + 1] = (char) 101;
            this.size += 4;
        } else {
            ensureCapacity(this.size + 5);
            System.arraycopy(this.buffer, i, this.buffer, i + 5, this.size - i);
            int i4 = i + 1;
            this.buffer[i] = (char) 102;
            int i5 = i4 + 1;
            this.buffer[i4] = (char) 97;
            int i6 = i5 + 1;
            this.buffer[i5] = (char) 108;
            this.buffer[i6] = (char) 115;
            this.buffer[i6 + 1] = (char) 101;
            this.size += 5;
        }
        return this;
    }

    public StrBuilder insert(int i, char[] cArr) {
        validateIndex(i);
        if (cArr == null) {
            return insert(i, this.nullText);
        }
        int length = cArr.length;
        if (length <= 0) {
            return this;
        }
        ensureCapacity(this.size + length);
        System.arraycopy(this.buffer, i, this.buffer, i + length, this.size - i);
        System.arraycopy(cArr, 0, this.buffer, i, length);
        this.size = length + this.size;
        return this;
    }

    public StrBuilder insert(int i, char[] cArr, int i2, int i3) {
        validateIndex(i);
        if (cArr == null) {
            return insert(i, this.nullText);
        }
        if (i2 < 0 || i2 > cArr.length) {
            throw new StringIndexOutOfBoundsException("Invalid offset: " + i2);
        } else if (i3 < 0 || i2 + i3 > cArr.length) {
            throw new StringIndexOutOfBoundsException("Invalid length: " + i3);
        } else if (i3 <= 0) {
            return this;
        } else {
            ensureCapacity(this.size + i3);
            System.arraycopy(this.buffer, i, this.buffer, i + i3, this.size - i);
            System.arraycopy(cArr, i2, this.buffer, i, i3);
            this.size += i3;
            return this;
        }
    }

    public boolean isEmpty() {
        return this.size == 0;
    }

    public int lastIndexOf(char c) {
        return lastIndexOf(c, this.size - 1);
    }

    public int lastIndexOf(char c, int i) {
        int i2 = i >= this.size ? this.size - 1 : i;
        if (i2 < 0) {
            return -1;
        }
        while (i2 >= 0) {
            if (this.buffer[i2] == c) {
                return i2;
            }
            i2--;
        }
        return -1;
    }

    public int lastIndexOf(String str) {
        return lastIndexOf(str, this.size - 1);
    }

    public int lastIndexOf(String str, int i) {
        int i2 = i >= this.size ? this.size - 1 : i;
        if (str == null || i2 < 0) {
            return -1;
        }
        int length = str.length();
        if (length <= 0 || length > this.size) {
            if (length == 0) {
                return i2;
            }
        } else if (length == 1) {
            return lastIndexOf(str.charAt(0), i2);
        } else {
            int i3 = (i2 - length) + 1;
            while (i3 >= 0) {
                int i4 = 0;
                while (i4 < length) {
                    if (str.charAt(i4) != this.buffer[i3 + i4]) {
                        i3--;
                    } else {
                        i4++;
                    }
                }
                return i3;
            }
        }
        return -1;
    }

    public int lastIndexOf(StrMatcher strMatcher) {
        return lastIndexOf(strMatcher, this.size);
    }

    public int lastIndexOf(StrMatcher strMatcher, int i) {
        int i2 = i >= this.size ? this.size - 1 : i;
        if (strMatcher == null || i2 < 0) {
            return -1;
        }
        char[] cArr = this.buffer;
        for (int i3 = i2; i3 >= 0; i3--) {
            if (strMatcher.isMatch(cArr, i3, 0, i2 + 1) > 0) {
                return i3;
            }
        }
        return -1;
    }

    public String leftString(int i) {
        return i <= 0 ? "" : i >= this.size ? new String(this.buffer, 0, this.size) : new String(this.buffer, 0, i);
    }

    public int length() {
        return this.size;
    }

    public String midString(int i, int i2) {
        if (i < 0) {
            i = 0;
        }
        return (i2 <= 0 || i >= this.size) ? "" : this.size <= i + i2 ? new String(this.buffer, i, this.size - i) : new String(this.buffer, i, i2);
    }

    public StrBuilder minimizeCapacity() {
        if (this.buffer.length > length()) {
            char[] cArr = this.buffer;
            this.buffer = new char[length()];
            System.arraycopy(cArr, 0, this.buffer, 0, this.size);
        }
        return this;
    }

    public StrBuilder replace(int i, int i2, String str) {
        int validateRange = validateRange(i, i2);
        replaceImpl(i, validateRange, validateRange - i, str, str == null ? 0 : str.length());
        return this;
    }

    public StrBuilder replace(StrMatcher strMatcher, String str, int i, int i2, int i3) {
        return replaceImpl(strMatcher, str, i, validateRange(i, i2), i3);
    }

    public StrBuilder replaceAll(char c, char c2) {
        if (c != c2) {
            for (int i = 0; i < this.size; i++) {
                if (this.buffer[i] == c) {
                    this.buffer[i] = (char) c2;
                }
            }
        }
        return this;
    }

    public StrBuilder replaceAll(String str, String str2) {
        int length = str == null ? 0 : str.length();
        if (length > 0) {
            int length2 = str2 == null ? 0 : str2.length();
            int indexOf = indexOf(str, 0);
            while (indexOf >= 0) {
                replaceImpl(indexOf, indexOf + length, length, str2, length2);
                indexOf = indexOf(str, indexOf + length2);
            }
        }
        return this;
    }

    public StrBuilder replaceAll(StrMatcher strMatcher, String str) {
        return replace(strMatcher, str, 0, this.size, -1);
    }

    public StrBuilder replaceFirst(char c, char c2) {
        if (c != c2) {
            int i = 0;
            while (true) {
                if (i >= this.size) {
                    break;
                } else if (this.buffer[i] == c) {
                    this.buffer[i] = (char) c2;
                    break;
                } else {
                    i++;
                }
            }
        }
        return this;
    }

    public StrBuilder replaceFirst(String str, String str2) {
        int indexOf;
        int i = 0;
        int length = str == null ? 0 : str.length();
        if (length > 0 && (indexOf = indexOf(str, 0)) >= 0) {
            if (str2 != null) {
                i = str2.length();
            }
            replaceImpl(indexOf, indexOf + length, length, str2, i);
        }
        return this;
    }

    public StrBuilder replaceFirst(StrMatcher strMatcher, String str) {
        return replace(strMatcher, str, 0, this.size, 1);
    }

    public StrBuilder reverse() {
        if (this.size != 0) {
            int i = this.size / 2;
            char[] cArr = this.buffer;
            int i2 = 0;
            int i3 = this.size - 1;
            while (i2 < i) {
                char c = cArr[i2];
                cArr[i2] = (char) cArr[i3];
                cArr[i3] = (char) c;
                i2++;
                i3--;
            }
        }
        return this;
    }

    public String rightString(int i) {
        return i <= 0 ? "" : i >= this.size ? new String(this.buffer, 0, this.size) : new String(this.buffer, this.size - i, i);
    }

    public StrBuilder setCharAt(int i, char c) {
        if (i < 0 || i >= length()) {
            throw new StringIndexOutOfBoundsException(i);
        }
        this.buffer[i] = (char) c;
        return this;
    }

    public StrBuilder setLength(int i) {
        if (i < 0) {
            throw new StringIndexOutOfBoundsException(i);
        }
        if (i < this.size) {
            this.size = i;
        } else if (i > this.size) {
            ensureCapacity(i);
            this.size = i;
            for (int i2 = this.size; i2 < i; i2++) {
                this.buffer[i2] = (char) 0;
            }
        }
        return this;
    }

    public StrBuilder setNewLineText(String str) {
        this.newLine = str;
        return this;
    }

    public StrBuilder setNullText(String str) {
        if (str != null && str.isEmpty()) {
            str = null;
        }
        this.nullText = str;
        return this;
    }

    public int size() {
        return this.size;
    }

    public boolean startsWith(String str) {
        if (str == null) {
            return false;
        }
        int length = str.length();
        if (length == 0) {
            return true;
        }
        if (length > this.size) {
            return false;
        }
        for (int i = 0; i < length; i++) {
            if (this.buffer[i] != str.charAt(i)) {
                return false;
            }
        }
        return true;
    }

    public CharSequence subSequence(int i, int i2) {
        if (i < 0) {
            throw new StringIndexOutOfBoundsException(i);
        } else if (i2 > this.size) {
            throw new StringIndexOutOfBoundsException(i2);
        } else if (i <= i2) {
            return substring(i, i2);
        } else {
            throw new StringIndexOutOfBoundsException(i2 - i);
        }
    }

    public String substring(int i) {
        return substring(i, this.size);
    }

    public String substring(int i, int i2) {
        return new String(this.buffer, i, validateRange(i, i2) - i);
    }

    public char[] toCharArray() {
        if (this.size == 0) {
            return ArrayUtils.EMPTY_CHAR_ARRAY;
        }
        char[] cArr = new char[this.size];
        System.arraycopy(this.buffer, 0, cArr, 0, this.size);
        return cArr;
    }

    public char[] toCharArray(int i, int i2) {
        int validateRange = validateRange(i, i2) - i;
        if (validateRange == 0) {
            return ArrayUtils.EMPTY_CHAR_ARRAY;
        }
        char[] cArr = new char[validateRange];
        System.arraycopy(this.buffer, i, cArr, 0, validateRange);
        return cArr;
    }

    public String toString() {
        return new String(this.buffer, 0, this.size);
    }

    public StringBuffer toStringBuffer() {
        return new StringBuffer(this.size).append(this.buffer, 0, this.size);
    }

    public StringBuilder toStringBuilder() {
        return new StringBuilder(this.size).append(this.buffer, 0, this.size);
    }

    public StrBuilder trim() {
        if (this.size != 0) {
            int i = this.size;
            char[] cArr = this.buffer;
            int i2 = 0;
            while (i2 < i && cArr[i2] <= ' ') {
                i2++;
            }
            while (i2 < i && cArr[i - 1] <= ' ') {
                i--;
            }
            if (i < this.size) {
                delete(i, this.size);
            }
            if (i2 > 0) {
                delete(0, i2);
            }
        }
        return this;
    }

    /* access modifiers changed from: protected */
    public void validateIndex(int i) {
        if (i < 0 || i > this.size) {
            throw new StringIndexOutOfBoundsException(i);
        }
    }

    /* access modifiers changed from: protected */
    public int validateRange(int i, int i2) {
        if (i < 0) {
            throw new StringIndexOutOfBoundsException(i);
        }
        if (i2 > this.size) {
            i2 = this.size;
        }
        if (i <= i2) {
            return i2;
        }
        throw new StringIndexOutOfBoundsException("end < start");
    }
}
