package org.apache.http.impl.client.cache;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.cache.Resource;

@Immutable
public class HeapResource implements Resource {
    private static final long serialVersionUID = -2078599905620463394L;
    private final byte[] b;

    public HeapResource(byte[] bArr) {
        this.b = bArr;
    }

    public void dispose() {
    }

    /* access modifiers changed from: package-private */
    public byte[] getByteArray() {
        return this.b;
    }

    public InputStream getInputStream() {
        return new ByteArrayInputStream(this.b);
    }

    public long length() {
        return (long) this.b.length;
    }
}
