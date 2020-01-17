package org.apache.commons.lang.math;

import android.support.v7.widget.ActivityChooserView;
import java.util.Random;

public final class JVMRandom extends Random {
    private static final Random SHARED_RANDOM = new Random();
    private static final long serialVersionUID = 1;
    private boolean constructed;

    public JVMRandom() {
        this.constructed = false;
        this.constructed = true;
    }

    private static int bitsRequired(long j) {
        int i = 0;
        long j2 = j;
        long j3 = j;
        while (j3 >= 0) {
            if (j2 == 0) {
                return i;
            }
            i++;
            j3 <<= 1;
            j2 >>= 1;
        }
        return 64 - i;
    }

    private static long next63bits() {
        return SHARED_RANDOM.nextLong() & Long.MAX_VALUE;
    }

    public static long nextLong(long j) {
        long next63bits;
        long j2;
        if (j <= 0) {
            throw new IllegalArgumentException("Upper bound for nextInt must be positive");
        } else if (((-j) & j) == j) {
            return next63bits() >> (63 - bitsRequired(j - 1));
        } else {
            do {
                next63bits = next63bits();
                j2 = next63bits % j;
            } while ((next63bits - j2) + (j - 1) < 0);
            return j2;
        }
    }

    public boolean nextBoolean() {
        return SHARED_RANDOM.nextBoolean();
    }

    public void nextBytes(byte[] bArr) {
        throw new UnsupportedOperationException();
    }

    public double nextDouble() {
        return SHARED_RANDOM.nextDouble();
    }

    public float nextFloat() {
        return SHARED_RANDOM.nextFloat();
    }

    public double nextGaussian() {
        synchronized (this) {
            throw new UnsupportedOperationException();
        }
    }

    public int nextInt() {
        return nextInt(ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED);
    }

    public int nextInt(int i) {
        return SHARED_RANDOM.nextInt(i);
    }

    public long nextLong() {
        return nextLong(Long.MAX_VALUE);
    }

    public void setSeed(long j) {
        synchronized (this) {
            if (this.constructed) {
                throw new UnsupportedOperationException();
            }
        }
    }
}
