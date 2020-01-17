package org.apache.http.impl.client.cache;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Formatter;
import java.util.Locale;
import org.apache.http.annotation.GuardedBy;
import org.apache.http.annotation.ThreadSafe;

@ThreadSafe
class BasicIdGenerator {
    @GuardedBy("this")
    private long count;
    private final String hostname;
    private final SecureRandom rnd;

    public BasicIdGenerator() {
        String str;
        try {
            str = InetAddress.getLocalHost().getHostName();
        } catch (UnknownHostException e) {
            str = "localhost";
        }
        this.hostname = str;
        try {
            this.rnd = SecureRandom.getInstance("SHA1PRNG");
            this.rnd.setSeed(System.currentTimeMillis());
        } catch (NoSuchAlgorithmException e2) {
            throw new Error(e2);
        }
    }

    public String generate() {
        StringBuilder sb = new StringBuilder();
        generate(sb);
        return sb.toString();
    }

    public void generate(StringBuilder sb) {
        synchronized (this) {
            this.count++;
            int nextInt = this.rnd.nextInt();
            sb.append(System.currentTimeMillis());
            sb.append('.');
            Formatter formatter = new Formatter(sb, Locale.US);
            formatter.format("%1$016x-%2$08x", new Object[]{Long.valueOf(this.count), Integer.valueOf(nextInt)});
            formatter.close();
            sb.append('.');
            sb.append(this.hostname);
        }
    }
}
