package com.facebook.places.internal;

import com.facebook.places.internal.ScannerException;
import java.util.List;

public class BleScannerLegacy implements BleScanner {
    BleScannerLegacy() {
    }

    public int getErrorCode() {
        return -1;
    }

    public List<BluetoothScanResult> getScanResults() {
        return null;
    }

    public void initAndCheckEligibility() throws ScannerException {
        throw new ScannerException(ScannerException.Type.NOT_SUPPORTED);
    }

    public void startScanning() throws ScannerException {
        throw new ScannerException(ScannerException.Type.NOT_SUPPORTED);
    }

    public void stopScanning() throws ScannerException {
        throw new ScannerException(ScannerException.Type.NOT_SUPPORTED);
    }
}
