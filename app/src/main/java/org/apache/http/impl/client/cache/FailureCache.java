package org.apache.http.impl.client.cache;

public interface FailureCache {
    int getErrorCount(String str);

    void increaseErrorCount(String str);

    void resetErrorCount(String str);
}
