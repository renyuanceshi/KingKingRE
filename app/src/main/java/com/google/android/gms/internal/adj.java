package com.google.android.gms.internal;

import java.io.IOException;

public final class adj {
    public static final String[] EMPTY_STRING_ARRAY = new String[0];
    private static int zzcsj = 11;
    private static int zzcsk = 12;
    private static int zzcsl = 16;
    private static int zzcsm = 26;
    public static final int[] zzcsn = new int[0];
    public static final long[] zzcso = new long[0];
    public static final float[] zzcsp = new float[0];
    private static double[] zzcsq = new double[0];
    public static final boolean[] zzcsr = new boolean[0];
    public static final byte[][] zzcss = new byte[0][];
    public static final byte[] zzcst = new byte[0];

    public static final int zzb(acx acx, int i) throws IOException {
        int i2 = 1;
        int position = acx.getPosition();
        acx.zzcm(i);
        while (acx.zzLy() == i) {
            acx.zzcm(i);
            i2++;
        }
        acx.zzq(position, i);
        return i2;
    }
}
