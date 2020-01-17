package com.google.android.gms.tasks;

final class zzd implements Runnable {
    private /* synthetic */ Task zzbLR;
    private /* synthetic */ zzc zzbLT;

    zzd(zzc zzc, Task task) {
        this.zzbLT = zzc;
        this.zzbLR = task;
    }

    public final void run() {
        try {
            Task task = (Task) this.zzbLT.zzbLP.then(this.zzbLR);
            if (task == null) {
                this.zzbLT.onFailure(new NullPointerException("Continuation returned null"));
                return;
            }
            task.addOnSuccessListener(TaskExecutors.zzbMd, this.zzbLT);
            task.addOnFailureListener(TaskExecutors.zzbMd, (OnFailureListener) this.zzbLT);
        } catch (RuntimeExecutionException e) {
            if (e.getCause() instanceof Exception) {
                this.zzbLT.zzbLQ.setException((Exception) e.getCause());
            } else {
                this.zzbLT.zzbLQ.setException(e);
            }
        } catch (Exception e2) {
            this.zzbLT.zzbLQ.setException(e2);
        }
    }
}
