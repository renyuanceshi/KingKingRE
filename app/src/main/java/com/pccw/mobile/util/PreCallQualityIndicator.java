package com.pccw.mobile.util;

import android.content.Context;
import android.os.Handler;
import android.os.Message;
import com.pccw.mobile.service.EchoClient;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.pref.EchoServerPref;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Timer;
import java.util.TimerTask;
import org.apache.http.HttpStatus;

public class PreCallQualityIndicator {
    public static final int PRE_CALL_QI_MSG = 1000;
    public static int validEchoId = -1;
    /* access modifiers changed from: private */
    public Thread checkNetQuaPauseTimeThread = null;
    /* access modifiers changed from: private */
    public Thread checkNetQuaThread = null;
    Context ctx;
    /* access modifiers changed from: private */
    public EchoClient echoClient;
    /* access modifiers changed from: private */
    public EchoServerPref echoServerPref;
    public boolean isUpdateIndiThreadWorking = false;
    public boolean keepLoopingIndicator = false;
    /* access modifiers changed from: private */
    public Handler mHandler;
    public int networkIndiRefreshTime = HttpStatus.SC_BAD_REQUEST;
    public Timer networkIndiTimer = null;
    /* access modifiers changed from: private */
    public Handler uiHandler;

    public PreCallQualityIndicator(Context context, Handler handler) {
        this.ctx = context;
        this.echoServerPref = new EchoServerPref(context);
        this.mHandler = new Handler();
        this.uiHandler = handler;
    }

    /* access modifiers changed from: private */
    public void checkNetworkQuality() {
        if (this.checkNetQuaThread != null) {
            this.checkNetQuaThread.interrupt();
            this.checkNetQuaThread = null;
        }
        final String echoServerHost1 = this.echoServerPref.getEchoServerHost1();
        final String echoServerHost2 = this.echoServerPref.getEchoServerHost2();
        if (!echoServerHost1.equalsIgnoreCase("NA") || !echoServerHost2.equalsIgnoreCase("NA")) {
            this.checkNetQuaThread = new Thread(new Runnable() {
                private int[] calcSectionSummary(int i, int[] iArr, long[] jArr, long[] jArr2) {
                    int[] iArr2 = new int[5];
                    for (int i2 = 0; i2 < iArr2.length; i2++) {
                        iArr2[i2] = 2;
                    }
                    for (int i3 = 0; i3 < i; i3++) {
                        int i4 = iArr[i3];
                        double jitter = ((double) jitter(jArr2, (i3 + 1) * 20)) / 1000000.0d;
                        double latency = latency(jArr, jArr2, i3 * 20, ((i3 + 1) * 20) - 1);
                        if (i4 <= 10 || jitter >= 50.0d || latency >= 1000.0d) {
                            iArr2[i3] = 2;
                        } else if (i4 < 16 || jitter > 25.0d || latency > 400.0d) {
                            iArr2[i3] = 1;
                        } else {
                            iArr2[i3] = 0;
                        }
                    }
                    return iArr2;
                }

                /* access modifiers changed from: private */
                public int[] calcValidPacketPerSection(long[] jArr) {
                    int[] iArr = new int[5];
                    for (int i = 0; i < iArr.length; i++) {
                        iArr[i] = 0;
                    }
                    for (int i2 = 0; i2 < jArr.length; i2++) {
                        if (jArr[i2] != 0) {
                            if (i2 <= 19) {
                                iArr[0] = iArr[0] + 1;
                            } else if (i2 <= 39) {
                                iArr[1] = iArr[1] + 1;
                            } else if (i2 <= 59) {
                                iArr[2] = iArr[2] + 1;
                            } else if (i2 <= 79) {
                                iArr[3] = iArr[3] + 1;
                            } else {
                                iArr[4] = iArr[4] + 1;
                            }
                        }
                    }
                    return iArr;
                }

                /* access modifiers changed from: private */
                public long jitter(long[] jArr, int i) {
                    long j = 0;
                    long j2 = 0;
                    int i2 = 0;
                    int i3 = 0;
                    while (i2 < i) {
                        if (jArr[i2] == 0) {
                            i2++;
                        } else {
                            long abs = (jArr[i3] == 0 || i2 - i3 == 0) ? 0 : (((Math.abs((jArr[i2] - jArr[i3]) - ((long) (((double) (i2 - i3)) * 3.0E7d))) / ((long) (i2 - i3))) - j) / 16) + j;
                            j2 = abs;
                            i3 = i2;
                            j = abs;
                            i2++;
                        }
                    }
                    return j2;
                }

                /* access modifiers changed from: private */
                public double latency(long[] jArr, long[] jArr2, int i, int i2) {
                    int i3 = 0;
                    double d = 0.0d;
                    while (i <= i2) {
                        double d2 = ((double) (jArr2[i] - jArr[i])) / 1000000.0d;
                        if (d2 > 0.0d) {
                            d += d2;
                            i3++;
                        }
                        i++;
                    }
                    return d / ((double) i3);
                }

                private void setTextNetworkQualitySummary(final String str) {
                    PreCallQualityIndicator.this.mHandler.post(new Runnable() {
                        public void run() {
                            Message message = new Message();
                            message.what = 1000;
                            if (str.equals("GOOD")) {
                                message.obj = "GOOD";
                            } else if (str.equals("FAIR")) {
                                message.obj = "FAIR";
                            } else if (str.equals("BAD")) {
                                message.obj = "BAD";
                            } else {
                                message.obj = "UNKNOWN";
                            }
                            PreCallQualityIndicator.this.uiHandler.sendMessage(message);
                        }
                    });
                }

                public void run() {
                    int i;
                    String str = null;
                    try {
                        String validEchoServerHost = PreCallQualityIndicator.this.echoServerPref.getValidEchoServerHost();
                        if (!validEchoServerHost.equalsIgnoreCase("HOST_1") && !validEchoServerHost.equalsIgnoreCase("HOST_2")) {
                            PreCallQualityIndicator.this.echoServerPref.setValidEchoServerHost("HOST_1");
                            str = echoServerHost1;
                        } else if (validEchoServerHost.equalsIgnoreCase("HOST_1")) {
                            str = echoServerHost1;
                        } else if (validEchoServerHost.equalsIgnoreCase("HOST_2")) {
                            str = echoServerHost2;
                        }
                        InetAddress byName = InetAddress.getByName(str);
                        PreCallQualityIndicator.validEchoId++;
                        if (PreCallQualityIndicator.validEchoId == 10) {
                            PreCallQualityIndicator.validEchoId = 0;
                        }
                        EchoClient unused = PreCallQualityIndicator.this.echoClient = new EchoClient(byName, Constants.HEARTBEAT_RETRY_INTERVAL, PreCallQualityIndicator.validEchoId, ClientStateManager.getEncryptedPccwImsi(PreCallQualityIndicator.this.ctx));
                        PreCallQualityIndicator.this.echoClient.run();
                        long nanoTime = System.nanoTime();
                        long j = (long) (((double) 5) * 1.0E9d);
                        long j2 = (long) (((double) 5) * 1.0E9d);
                        boolean z = false;
                        int i2 = 1;
                        while (PreCallQualityIndicator.this.checkNetQuaThread != null) {
                            Thread.sleep(100);
                            PreCallQualityIndicator.this.mHandler.post(new Runnable() {
                                public void run() {
                                    double d = (((double) PreCallQualityIndicator.this.echoClient.validPacket) / ((double) PreCallQualityIndicator.this.echoClient.retryTime)) * 100.0d;
                                    String.format("%.1f", new Object[]{Double.valueOf(d)}) + "%";
                                    String.format("%.2f", new Object[]{Double.valueOf(((double) PreCallQualityIndicator.this.echoClient.elapsedTime) / 1.0E9d)}) + "s";
                                    double access$700 = ((double) AnonymousClass3.this.jitter(PreCallQualityIndicator.this.echoClient.receiveTimeArr, PreCallQualityIndicator.this.echoClient.receiveTimeArr.length)) / 1000000.0d;
                                    String.format("%.1f", new Object[]{Double.valueOf(access$700)}) + "ms";
                                    if (access$700 < 0.1d || d <= 1.0d) {
                                    }
                                }
                            });
                            long nanoTime2 = System.nanoTime() - nanoTime;
                            if (nanoTime2 >= j2 && !z) {
                                z = true;
                                PreCallQualityIndicator.this.mHandler.post(new Runnable() {
                                    public void run() {
                                    }
                                });
                            }
                            boolean z2 = z;
                            if (nanoTime2 < ((long) (((double) i2) * 1.0E9d))) {
                                i = i2;
                            } else if (i2 == 2 || i2 == 5) {
                                int i3 = i2 == 2 ? 1 : i2 == 5 ? 5 : 0;
                                int[] calcSectionSummary = calcSectionSummary(i3, calcValidPacketPerSection(PreCallQualityIndicator.this.echoClient.receiveTimeArr), PreCallQualityIndicator.this.echoClient.sendTimeArr, PreCallQualityIndicator.this.echoClient.receiveTimeArr);
                                int i4 = 0;
                                int i5 = 0;
                                int i6 = 0;
                                for (int i7 = 0; i7 < i3; i7++) {
                                    if (calcSectionSummary[i7] == 0) {
                                        i6++;
                                    } else if (calcSectionSummary[i7] == 1) {
                                        i5++;
                                    } else {
                                        i4++;
                                    }
                                }
                                if (PreCallQualityIndicator.this.echoClient.validPacket == 0) {
                                    setTextNetworkQualitySummary("Error");
                                } else if (i4 >= 3) {
                                    setTextNetworkQualitySummary("BAD");
                                } else if (i5 >= 3) {
                                    setTextNetworkQualitySummary("FAIR");
                                } else if (i6 >= 3) {
                                    setTextNetworkQualitySummary("GOOD");
                                } else if (i4 >= 2) {
                                    setTextNetworkQualitySummary("BAD");
                                } else if (i5 >= 2) {
                                    setTextNetworkQualitySummary("FAIR");
                                } else if (i6 >= 2) {
                                    setTextNetworkQualitySummary("GOOD");
                                } else if (i4 >= 1) {
                                    setTextNetworkQualitySummary("BAD");
                                } else if (i5 >= 1) {
                                    setTextNetworkQualitySummary("FAIR");
                                } else if (i6 >= 1) {
                                    setTextNetworkQualitySummary("GOOD");
                                }
                                i = i2 + 1;
                            } else {
                                i = i2 + 1;
                            }
                            if (nanoTime2 >= j) {
                                PreCallQualityIndicator.this.checkNetQuaThread.interrupt();
                                Thread unused2 = PreCallQualityIndicator.this.checkNetQuaThread = null;
                                PreCallQualityIndicator.this.mHandler.post(new Runnable() {
                                    public void run() {
                                        if (PreCallQualityIndicator.this.echoClient.validPacket == 0) {
                                            if (PreCallQualityIndicator.this.echoServerPref.getValidEchoServerHost().equalsIgnoreCase("HOST_1")) {
                                                PreCallQualityIndicator.this.echoServerPref.setValidEchoServerHost("HOST_2");
                                            } else if (PreCallQualityIndicator.this.echoServerPref.getValidEchoServerHost().equalsIgnoreCase("HOST_2")) {
                                                PreCallQualityIndicator.this.echoServerPref.setValidEchoServerHost("HOST_1");
                                            }
                                        }
                                        double unused = AnonymousClass3.this.latency(PreCallQualityIndicator.this.echoClient.sendTimeArr, PreCallQualityIndicator.this.echoClient.receiveTimeArr, 0, PreCallQualityIndicator.this.echoClient.receiveTimeArr.length - 1);
                                        int[] access$900 = AnonymousClass3.this.calcValidPacketPerSection(PreCallQualityIndicator.this.echoClient.receiveTimeArr);
                                        String str = "";
                                        int i = 0;
                                        while (i < access$900.length) {
                                            String str2 = i != 4 ? str + access$900[i] + "," : str + access$900[i];
                                            i++;
                                            str = str2;
                                        }
                                    }
                                });
                                PreCallQualityIndicator.this.isUpdateIndiThreadWorking = false;
                                i2 = i;
                                z = z2;
                            } else {
                                i2 = i;
                                z = z2;
                            }
                        }
                    } catch (UnknownHostException e) {
                        PreCallQualityIndicator.this.mHandler.post(new Runnable() {
                            public void run() {
                            }
                        });
                    } catch (Exception e2) {
                        PreCallQualityIndicator.this.mHandler.post(new Runnable() {
                            public void run() {
                            }
                        });
                    }
                }
            });
            this.checkNetQuaThread.start();
            return;
        }
        if (this.networkIndiTimer != null) {
            this.networkIndiTimer.cancel();
            this.networkIndiTimer.purge();
            this.networkIndiTimer = null;
        }
        this.isUpdateIndiThreadWorking = false;
    }

    /* access modifiers changed from: private */
    public void checkNetworkQualityPauseTime() {
        if (this.checkNetQuaPauseTimeThread != null) {
            this.checkNetQuaPauseTimeThread.interrupt();
            this.checkNetQuaPauseTimeThread = null;
        }
        this.checkNetQuaPauseTimeThread = new Thread(new Runnable() {
            public void run() {
                long j = (long) (((double) 5) * 1.0E9d);
                long nanoTime = System.nanoTime();
                while (PreCallQualityIndicator.this.checkNetQuaPauseTimeThread != null) {
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    if (System.nanoTime() - nanoTime >= j) {
                        if (PreCallQualityIndicator.this.checkNetQuaPauseTimeThread != null) {
                            PreCallQualityIndicator.this.checkNetQuaPauseTimeThread.interrupt();
                            Thread unused = PreCallQualityIndicator.this.checkNetQuaPauseTimeThread = null;
                        }
                        PreCallQualityIndicator.this.isUpdateIndiThreadWorking = false;
                    }
                }
            }
        });
        this.checkNetQuaPauseTimeThread.start();
    }

    private void startPreCallQI() {
        this.keepLoopingIndicator = true;
        if (this.networkIndiTimer == null) {
            this.networkIndiTimer = new Timer();
            this.networkIndiTimer.schedule(new TimerTask() {
                public void run() {
                    PreCallQualityIndicator.this.mHandler.post(new Runnable() {
                        public void run() {
                            if (PreCallQualityIndicator.this.keepLoopingIndicator && !PreCallQualityIndicator.this.isUpdateIndiThreadWorking) {
                                PreCallQualityIndicator.this.isUpdateIndiThreadWorking = true;
                                if (!MobileSipService.getInstance().isNetworkAvailable(PreCallQualityIndicator.this.ctx)) {
                                    PreCallQualityIndicator.this.mHandler.post(new Runnable() {
                                        public void run() {
                                            PreCallQualityIndicator.this.restoreNetworkIndiToDefault();
                                        }
                                    });
                                    PreCallQualityIndicator.this.checkNetworkQualityPauseTime();
                                    return;
                                }
                                PreCallQualityIndicator.this.checkNetworkQuality();
                            }
                        }
                    });
                }
            }, 500, (long) this.networkIndiRefreshTime);
        }
    }

    private void stopPreCallQI() {
        if (this.networkIndiTimer != null) {
            this.networkIndiTimer.cancel();
            this.networkIndiTimer = null;
        }
        if (this.checkNetQuaThread != null) {
            this.checkNetQuaThread.interrupt();
            this.checkNetQuaThread = null;
        }
        this.isUpdateIndiThreadWorking = false;
    }

    public void restoreNetworkIndiToDefault() {
        Message message = new Message();
        message.what = 1000;
        message.obj = "UNKNOWN";
        this.uiHandler.sendMessage(message);
    }

    public void startChecking() {
        startPreCallQI();
    }

    public void stopChecking() {
        stopPreCallQI();
    }
}
