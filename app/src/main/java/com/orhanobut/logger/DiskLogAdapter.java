package com.orhanobut.logger;

public class DiskLogAdapter implements LogAdapter {
    private final FormatStrategy formatStrategy;

    public DiskLogAdapter() {
        this.formatStrategy = CsvFormatStrategy.newBuilder().build();
    }

    public DiskLogAdapter(FormatStrategy formatStrategy2) {
        this.formatStrategy = formatStrategy2;
    }

    public boolean isLoggable(int i, String str) {
        return true;
    }

    public void log(int i, String str, String str2) {
        this.formatStrategy.log(i, str, str2);
    }
}
