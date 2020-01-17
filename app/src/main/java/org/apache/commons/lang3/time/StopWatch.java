package org.apache.commons.lang3.time;

public class StopWatch {
    private static final long NANO_2_MILLIS = 1000000;
    private State runningState = State.UNSTARTED;
    private SplitState splitState = SplitState.UNSPLIT;
    private long startTime;
    private long startTimeMillis;
    private long stopTime;

    private enum SplitState {
        SPLIT,
        UNSPLIT
    }

    private enum State {
        UNSTARTED {
            /* access modifiers changed from: package-private */
            public boolean isStarted() {
                return false;
            }

            /* access modifiers changed from: package-private */
            public boolean isStopped() {
                return true;
            }

            /* access modifiers changed from: package-private */
            public boolean isSuspended() {
                return false;
            }
        },
        RUNNING {
            /* access modifiers changed from: package-private */
            public boolean isStarted() {
                return true;
            }

            /* access modifiers changed from: package-private */
            public boolean isStopped() {
                return false;
            }

            /* access modifiers changed from: package-private */
            public boolean isSuspended() {
                return false;
            }
        },
        STOPPED {
            /* access modifiers changed from: package-private */
            public boolean isStarted() {
                return false;
            }

            /* access modifiers changed from: package-private */
            public boolean isStopped() {
                return true;
            }

            /* access modifiers changed from: package-private */
            public boolean isSuspended() {
                return false;
            }
        },
        SUSPENDED {
            /* access modifiers changed from: package-private */
            public boolean isStarted() {
                return true;
            }

            /* access modifiers changed from: package-private */
            public boolean isStopped() {
                return false;
            }

            /* access modifiers changed from: package-private */
            public boolean isSuspended() {
                return true;
            }
        };

        /* access modifiers changed from: package-private */
        public abstract boolean isStarted();

        /* access modifiers changed from: package-private */
        public abstract boolean isStopped();

        /* access modifiers changed from: package-private */
        public abstract boolean isSuspended();
    }

    public long getNanoTime() {
        if (this.runningState == State.STOPPED || this.runningState == State.SUSPENDED) {
            return this.stopTime - this.startTime;
        }
        if (this.runningState == State.UNSTARTED) {
            return 0;
        }
        if (this.runningState == State.RUNNING) {
            return System.nanoTime() - this.startTime;
        }
        throw new RuntimeException("Illegal running state has occurred.");
    }

    public long getSplitNanoTime() {
        if (this.splitState == SplitState.SPLIT) {
            return this.stopTime - this.startTime;
        }
        throw new IllegalStateException("Stopwatch must be split to get the split time. ");
    }

    public long getSplitTime() {
        return getSplitNanoTime() / NANO_2_MILLIS;
    }

    public long getStartTime() {
        if (this.runningState != State.UNSTARTED) {
            return this.startTimeMillis;
        }
        throw new IllegalStateException("Stopwatch has not been started");
    }

    public long getTime() {
        return getNanoTime() / NANO_2_MILLIS;
    }

    public boolean isStarted() {
        return this.runningState.isStarted();
    }

    public boolean isStopped() {
        return this.runningState.isStopped();
    }

    public boolean isSuspended() {
        return this.runningState.isSuspended();
    }

    public void reset() {
        this.runningState = State.UNSTARTED;
        this.splitState = SplitState.UNSPLIT;
    }

    public void resume() {
        if (this.runningState != State.SUSPENDED) {
            throw new IllegalStateException("Stopwatch must be suspended to resume. ");
        }
        this.startTime += System.nanoTime() - this.stopTime;
        this.runningState = State.RUNNING;
    }

    public void split() {
        if (this.runningState != State.RUNNING) {
            throw new IllegalStateException("Stopwatch is not running. ");
        }
        this.stopTime = System.nanoTime();
        this.splitState = SplitState.SPLIT;
    }

    public void start() {
        if (this.runningState == State.STOPPED) {
            throw new IllegalStateException("Stopwatch must be reset before being restarted. ");
        } else if (this.runningState != State.UNSTARTED) {
            throw new IllegalStateException("Stopwatch already started. ");
        } else {
            this.startTime = System.nanoTime();
            this.startTimeMillis = System.currentTimeMillis();
            this.runningState = State.RUNNING;
        }
    }

    public void stop() {
        if (this.runningState == State.RUNNING || this.runningState == State.SUSPENDED) {
            if (this.runningState == State.RUNNING) {
                this.stopTime = System.nanoTime();
            }
            this.runningState = State.STOPPED;
            return;
        }
        throw new IllegalStateException("Stopwatch is not running. ");
    }

    public void suspend() {
        if (this.runningState != State.RUNNING) {
            throw new IllegalStateException("Stopwatch must be running to suspend. ");
        }
        this.stopTime = System.nanoTime();
        this.runningState = State.SUSPENDED;
    }

    public String toSplitString() {
        return DurationFormatUtils.formatDurationHMS(getSplitTime());
    }

    public String toString() {
        return DurationFormatUtils.formatDurationHMS(getTime());
    }

    public void unsplit() {
        if (this.splitState != SplitState.SPLIT) {
            throw new IllegalStateException("Stopwatch has not been split. ");
        }
        this.splitState = SplitState.UNSPLIT;
    }
}
