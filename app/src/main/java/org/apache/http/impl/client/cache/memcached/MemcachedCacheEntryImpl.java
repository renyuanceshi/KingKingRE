package org.apache.http.impl.client.cache.memcached;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import org.apache.http.client.cache.HttpCacheEntry;

public class MemcachedCacheEntryImpl implements MemcachedCacheEntry {
    private HttpCacheEntry httpCacheEntry;
    private String key;

    public MemcachedCacheEntryImpl() {
    }

    public MemcachedCacheEntryImpl(String str, HttpCacheEntry httpCacheEntry2) {
        this.key = str;
        this.httpCacheEntry = httpCacheEntry2;
    }

    public HttpCacheEntry getHttpCacheEntry() {
        HttpCacheEntry httpCacheEntry2;
        synchronized (this) {
            httpCacheEntry2 = this.httpCacheEntry;
        }
        return httpCacheEntry2;
    }

    public String getStorageKey() {
        String str;
        synchronized (this) {
            str = this.key;
        }
        return str;
    }

    public void set(byte[] bArr) {
        synchronized (this) {
            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
            try {
                ObjectInputStream objectInputStream = new ObjectInputStream(byteArrayInputStream);
                String str = (String) objectInputStream.readObject();
                HttpCacheEntry httpCacheEntry2 = (HttpCacheEntry) objectInputStream.readObject();
                objectInputStream.close();
                byteArrayInputStream.close();
                this.key = str;
                this.httpCacheEntry = httpCacheEntry2;
            } catch (IOException e) {
                throw new MemcachedSerializationException(e);
            } catch (ClassNotFoundException e2) {
                throw new MemcachedSerializationException(e2);
            }
        }
    }

    public byte[] toByteArray() {
        byte[] byteArray;
        synchronized (this) {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            try {
                ObjectOutputStream objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
                objectOutputStream.writeObject(this.key);
                objectOutputStream.writeObject(this.httpCacheEntry);
                objectOutputStream.close();
                byteArray = byteArrayOutputStream.toByteArray();
            } catch (IOException e) {
                throw new MemcachedSerializationException(e);
            }
        }
        return byteArray;
    }
}
