package org.apache.http.impl.cookie;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import org.apache.http.annotation.Immutable;

@Immutable
public class PublicSuffixListParser {
    private static final int MAX_LINE_LEN = 256;
    private final PublicSuffixFilter filter;

    PublicSuffixListParser(PublicSuffixFilter publicSuffixFilter) {
        this.filter = publicSuffixFilter;
    }

    private boolean readLine(Reader reader, StringBuilder sb) throws IOException {
        char c;
        sb.setLength(0);
        boolean z = false;
        do {
            int read = reader.read();
            if (read == -1 || (c = (char) read) == 10) {
                return read != -1;
            }
            if (Character.isWhitespace(c)) {
                z = true;
            }
            if (!z) {
                sb.append(c);
            }
        } while (sb.length() <= 256);
        throw new IOException("Line too long");
    }

    public void parse(Reader reader) throws IOException {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        BufferedReader bufferedReader = new BufferedReader(reader);
        StringBuilder sb = new StringBuilder(256);
        boolean z = true;
        while (z) {
            boolean readLine = readLine(bufferedReader, sb);
            String sb2 = sb.toString();
            if (sb2.length() == 0 || sb2.startsWith("//")) {
                z = readLine;
            } else {
                if (sb2.startsWith(".")) {
                    sb2 = sb2.substring(1);
                }
                boolean startsWith = sb2.startsWith("!");
                if (startsWith) {
                    sb2 = sb2.substring(1);
                }
                if (startsWith) {
                    arrayList2.add(sb2);
                    z = readLine;
                } else {
                    arrayList.add(sb2);
                    z = readLine;
                }
            }
        }
        this.filter.setPublicSuffixes(arrayList);
        this.filter.setExceptions(arrayList2);
    }
}
