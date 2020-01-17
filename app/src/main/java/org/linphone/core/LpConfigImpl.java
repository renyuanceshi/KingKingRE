package org.linphone.core;

class LpConfigImpl implements LpConfig {
    private long nativePtr;
    boolean ownPtr;

    private LpConfigImpl() {
        this.ownPtr = false;
        this.nativePtr = -1;
        this.ownPtr = false;
    }

    public LpConfigImpl(long j) {
        this.ownPtr = false;
        this.nativePtr = j;
    }

    @Deprecated
    public LpConfigImpl(String str) {
        this.ownPtr = false;
        this.nativePtr = newLpConfigImpl(str);
        this.ownPtr = true;
    }

    private native void delete(long j);

    public static LpConfigImpl fromBuffer(String str) {
        LpConfigImpl lpConfigImpl = new LpConfigImpl();
        lpConfigImpl.nativePtr = lpConfigImpl.newLpConfigImplFromBuffer(str);
        lpConfigImpl.ownPtr = true;
        return lpConfigImpl;
    }

    public static LpConfigImpl fromFile(String str) {
        LpConfigImpl lpConfigImpl = new LpConfigImpl();
        lpConfigImpl.nativePtr = lpConfigImpl.newLpConfigImpl(str);
        lpConfigImpl.ownPtr = true;
        return lpConfigImpl;
    }

    private native boolean getBool(long j, String str, String str2, boolean z);

    private native float getFloat(long j, String str, String str2, float f);

    private native int getInt(long j, String str, String str2, int i);

    private native int[] getIntRange(long j, String str, String str2, int i, int i2);

    private native String getString(long j, String str, String str2, String str3);

    private native void loadXmlFile(long j, String str);

    private native long newLpConfigImpl(String str);

    private native long newLpConfigImplFromBuffer(String str);

    private native void setBool(long j, String str, String str2, boolean z);

    private native void setFloat(long j, String str, String str2, float f);

    private native void setInt(long j, String str, String str2, int i);

    private native void setIntRange(long j, String str, String str2, int i, int i2);

    private native void setString(long j, String str, String str2, String str3);

    private native void sync(long j);

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        if (this.ownPtr) {
            delete(this.nativePtr);
        }
    }

    public boolean getBool(String str, String str2, boolean z) {
        return getBool(this.nativePtr, str, str2, z);
    }

    public float getFloat(String str, String str2, float f) {
        return getFloat(this.nativePtr, str, str2, f);
    }

    public int getInt(String str, String str2, int i) {
        return getInt(this.nativePtr, str, str2, i);
    }

    public int[] getIntRange(String str, String str2, int i, int i2) {
        return getIntRange(this.nativePtr, str, str2, i, i2);
    }

    public String getString(String str, String str2, String str3) {
        return getString(this.nativePtr, str, str2, str3);
    }

    public void loadXmlFile(String str) {
        loadXmlFile(this.nativePtr, str);
    }

    public void setBool(String str, String str2, boolean z) {
        setBool(this.nativePtr, str, str2, z);
    }

    public void setFloat(String str, String str2, float f) {
        setFloat(this.nativePtr, str, str2, f);
    }

    public void setInt(String str, String str2, int i) {
        setInt(this.nativePtr, str, str2, i);
    }

    public void setIntRange(String str, String str2, int i, int i2) {
        setIntRange(this.nativePtr, str, str2, i, i2);
    }

    public void setString(String str, String str2, String str3) {
        setString(this.nativePtr, str, str2, str3);
    }

    public void sync() {
        sync(this.nativePtr);
    }
}
