package com.pccw.mobile.util;

import android.content.Context;
import android.os.Handler;
import android.os.Message;
import com.pccw.mobile.service.EchoClient;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.pref.EchoServerPref;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Timer;
import java.util.TimerTask;

public class PreCallQualityIndicator {
   public static final int PRE_CALL_QI_MSG = 1000;
   public static int validEchoId = -1;
   private Thread checkNetQuaPauseTimeThread = null;
   private Thread checkNetQuaThread = null;
   Context ctx;
   private EchoClient echoClient;
   private EchoServerPref echoServerPref;
   public boolean isUpdateIndiThreadWorking = false;
   public boolean keepLoopingIndicator = false;
   private Handler mHandler;
   public int networkIndiRefreshTime = 400;
   public Timer networkIndiTimer = null;
   private Handler uiHandler;

   public PreCallQualityIndicator(Context var1, Handler var2) {
      this.ctx = var1;
      this.echoServerPref = new EchoServerPref(var1);
      this.mHandler = new Handler();
      this.uiHandler = var2;
   }

   private void checkNetworkQuality() {
      if (this.checkNetQuaThread != null) {
         this.checkNetQuaThread.interrupt();
         this.checkNetQuaThread = null;
      }

      final String var1 = this.echoServerPref.getEchoServerHost1();
      final String var2 = this.echoServerPref.getEchoServerHost2();
      if (var1.equalsIgnoreCase("NA") && var2.equalsIgnoreCase("NA")) {
         if (this.networkIndiTimer != null) {
            this.networkIndiTimer.cancel();
            this.networkIndiTimer.purge();
            this.networkIndiTimer = null;
         }

         this.isUpdateIndiThreadWorking = false;
      } else {
         this.checkNetQuaThread = new Thread(new Runnable() {
            private int[] calcSectionSummary(int var1x, int[] var2x, long[] var3, long[] var4) {
               int[] var5 = new int[5];

               int var6;
               for(var6 = 0; var6 < var5.length; ++var6) {
                  var5[var6] = 2;
               }

               for(var6 = 0; var6 < var1x; ++var6) {
                  int var7 = var2x[var6];
                  double var8 = (double)this.jitter(var4, (var6 + 1) * 20) / 1000000.0D;
                  double var10 = this.latency(var3, var4, var6 * 20, (var6 + 1) * 20 - 1);
                  if (var7 > 10 && var8 < 50.0D && var10 < 1000.0D) {
                     if (var7 >= 16 && var8 <= 25.0D && var10 <= 400.0D) {
                        var5[var6] = 0;
                     } else {
                        var5[var6] = 1;
                     }
                  } else {
                     var5[var6] = 2;
                  }
               }

               return var5;
            }

            private int[] calcValidPacketPerSection(long[] var1x) {
               int[] var2x = new int[5];

               int var3;
               for(var3 = 0; var3 < var2x.length; ++var3) {
                  var2x[var3] = 0;
               }

               for(var3 = 0; var3 < var1x.length; ++var3) {
                  if (var1x[var3] != 0L) {
                     int var10002;
                     if (var3 <= 19) {
                        var10002 = var2x[0]++;
                     } else if (var3 <= 39) {
                        var10002 = var2x[1]++;
                     } else if (var3 <= 59) {
                        var10002 = var2x[2]++;
                     } else if (var3 <= 79) {
                        var10002 = var2x[3]++;
                     } else {
                        var10002 = var2x[4]++;
                     }
                  }
               }

               return var2x;
            }

            private long jitter(long[] var1x, int var2x) {
               long var3 = 0L;
               int var5 = 0;
               long var6 = 0L;
               int var8 = 0;

               while(true) {
                  while(var8 < var2x) {
                     if (var1x[var8] == 0L) {
                        ++var8;
                     } else {
                        if (var1x[var5] != 0L && var8 - var5 != 0) {
                           var3 += (Math.abs(var1x[var8] - var1x[var5] - (long)((double)(var8 - var5) * 3.0E7D)) / (long)(var8 - var5) - var3) / 16L;
                        } else {
                           var3 = 0L;
                        }

                        var5 = var8++;
                        var6 = var3;
                        var3 = var3;
                     }
                  }

                  return var6;
               }
            }

            private double latency(long[] var1x, long[] var2x, int var3, int var4) {
               double var5 = 0.0D;
               byte var7 = 0;
               int var8 = var3;

               double var11;
               for(var3 = var7; var8 <= var4; var5 = var11) {
                  double var9 = (double)(var2x[var8] - var1x[var8]) / 1000000.0D;
                  int var13 = var3;
                  var11 = var5;
                  if (var9 > 0.0D) {
                     var11 = var5 + var9;
                     var13 = var3 + 1;
                  }

                  ++var8;
                  var3 = var13;
               }

               return var5 / (double)var3;
            }

            private void setTextNetworkQualitySummary(final String var1x) {
               PreCallQualityIndicator.this.mHandler.post(new Runnable() {
                  public void run() {
                     Message var1xx = new Message();
                     var1xx.what = 1000;
                     if (var1x.equals("GOOD")) {
                        var1xx.obj = "GOOD";
                     } else if (var1x.equals("FAIR")) {
                        var1xx.obj = "FAIR";
                     } else if (var1x.equals("BAD")) {
                        var1xx.obj = "BAD";
                     } else {
                        var1xx.obj = "UNKNOWN";
                     }

                     PreCallQualityIndicator.this.uiHandler.sendMessage(var1xx);
                  }
               });
            }

            public void run() {
               String var1x = null;

               label263: {
                  label249: {
                     boolean var10001;
                     label256: {
                        String var2x;
                        try {
                           var2x = PreCallQualityIndicator.this.echoServerPref.getValidEchoServerHost();
                           if (!var2x.equalsIgnoreCase("HOST_1") && !var2x.equalsIgnoreCase("HOST_2")) {
                              PreCallQualityIndicator.this.echoServerPref.setValidEchoServerHost("HOST_1");
                              var1x = var1;
                              break label256;
                           }
                        } catch (Exception var55) {
                           var10001 = false;
                           break label263;
                        }

                        try {
                           if (var2x.equalsIgnoreCase("HOST_1")) {
                              var1x = var1;
                              break label256;
                           }
                        } catch (Exception var57) {
                           var10001 = false;
                           break label263;
                        }

                        try {
                           if (var2x.equalsIgnoreCase("HOST_2")) {
                              var1x = var2;
                           }
                        } catch (Exception var53) {
                           var10001 = false;
                           break label263;
                        }
                     }

                     InetAddress var58;
                     try {
                        var58 = InetAddress.getByName(var1x);
                        ++PreCallQualityIndicator.validEchoId;
                        if (PreCallQualityIndicator.validEchoId == 10) {
                           PreCallQualityIndicator.validEchoId = 0;
                        }
                     } catch (UnknownHostException var50) {
                        var10001 = false;
                        break label249;
                     } catch (Exception var51) {
                        var10001 = false;
                        break label263;
                     }

                     long var5;
                     try {
                        String var3 = ClientStateManager.getEncryptedPccwImsi(PreCallQualityIndicator.this.ctx);
                        PreCallQualityIndicator var59 = PreCallQualityIndicator.this;
                        EchoClient var4 = new EchoClient(var58, 10000, PreCallQualityIndicator.validEchoId, var3);
                        var59.echoClient = var4;
                        PreCallQualityIndicator.this.echoClient.run();
                        var5 = System.nanoTime();
                     } catch (Exception var49) {
                        var10001 = false;
                        break label263;
                     }

                     long var7 = (long)((double)5 * 1.0E9D);
                     long var9 = (long)((double)5 * 1.0E9D);
                     boolean var11 = false;
                     int var12 = 1;

                     while(true) {
                        long var13;
                        try {
                           if (PreCallQualityIndicator.this.checkNetQuaThread == null) {
                              return;
                           }

                           Thread.sleep(100L);
                           Handler var61 = PreCallQualityIndicator.this.mHandler;
                           Runnable var60 = new Runnable() {
                              public void run() {
                                 double var1x = (double)PreCallQualityIndicator.this.echoClient.validPacket / (double)PreCallQualityIndicator.this.echoClient.retryTime * 100.0D;
                                 (new StringBuilder()).append(String.format("%.1f", var1x)).append("%").toString();
                                 (new StringBuilder()).append(String.format("%.2f", (double)PreCallQualityIndicator.this.echoClient.elapsedTime / 1.0E9D)).append("s").toString();
                                 double var3 = (double)jitter(PreCallQualityIndicator.this.echoClient.receiveTimeArr, PreCallQualityIndicator.this.echoClient.receiveTimeArr.length) / 1000000.0D;
                                 (new StringBuilder()).append(String.format("%.1f", var3)).append("ms").toString();
                                 if (var3 >= 0.1D && var1x <= 1.0D) {
                                 }

                              }
                           };
                           var61.post(var60);
                           var13 = System.nanoTime() - var5;
                        } catch (Exception var45) {
                           var10001 = false;
                           break label263;
                        }

                        boolean var15 = var11;
                        Handler var62;
                        Runnable var63;
                        if (var13 >= var9) {
                           var15 = var11;
                           if (!var11) {
                              var15 = true;

                              try {
                                 var62 = PreCallQualityIndicator.this.mHandler;
                                 var63 = new Runnable() {
                                    public void run() {
                                    }
                                 };
                                 var62.post(var63);
                              } catch (Exception var43) {
                                 var10001 = false;
                                 break label263;
                              }
                           }
                        }

                        int var16 = var12;
                        if (var13 >= (long)((double)var12 * 1.0E9D)) {
                           if (var12 != 2 && var12 != 5) {
                              var16 = var12 + 1;
                           } else {
                              byte var66 = 0;
                              if (var12 == 2) {
                                 var66 = 1;
                              } else if (var12 == 5) {
                                 var66 = 5;
                              }

                              int[] var64;
                              try {
                                 var64 = this.calcSectionSummary(var66, this.calcValidPacketPerSection(PreCallQualityIndicator.this.echoClient.receiveTimeArr), PreCallQualityIndicator.this.echoClient.sendTimeArr, PreCallQualityIndicator.this.echoClient.receiveTimeArr);
                              } catch (Exception var41) {
                                 var10001 = false;
                                 break label263;
                              }

                              int var17 = 0;
                              int var18 = 0;
                              int var65 = 0;

                              for(int var19 = 0; var19 < var66; ++var19) {
                                 if (var64[var19] == 0) {
                                    ++var65;
                                 } else if (var64[var19] == 1) {
                                    ++var18;
                                 } else {
                                    ++var17;
                                 }
                              }

                              label203: {
                                 try {
                                    if (PreCallQualityIndicator.this.echoClient.validPacket == 0) {
                                       this.setTextNetworkQualitySummary("Error");
                                       break label203;
                                    }
                                 } catch (Exception var47) {
                                    var10001 = false;
                                    break label263;
                                 }

                                 if (var17 >= 3) {
                                    try {
                                       this.setTextNetworkQualitySummary("BAD");
                                    } catch (Exception var39) {
                                       var10001 = false;
                                       break label263;
                                    }
                                 } else if (var18 >= 3) {
                                    try {
                                       this.setTextNetworkQualitySummary("FAIR");
                                    } catch (Exception var37) {
                                       var10001 = false;
                                       break label263;
                                    }
                                 } else if (var65 >= 3) {
                                    try {
                                       this.setTextNetworkQualitySummary("GOOD");
                                    } catch (Exception var35) {
                                       var10001 = false;
                                       break label263;
                                    }
                                 } else if (var17 >= 2) {
                                    try {
                                       this.setTextNetworkQualitySummary("BAD");
                                    } catch (Exception var33) {
                                       var10001 = false;
                                       break label263;
                                    }
                                 } else if (var18 >= 2) {
                                    try {
                                       this.setTextNetworkQualitySummary("FAIR");
                                    } catch (Exception var31) {
                                       var10001 = false;
                                       break label263;
                                    }
                                 } else if (var65 >= 2) {
                                    try {
                                       this.setTextNetworkQualitySummary("GOOD");
                                    } catch (Exception var29) {
                                       var10001 = false;
                                       break label263;
                                    }
                                 } else if (var17 >= 1) {
                                    try {
                                       this.setTextNetworkQualitySummary("BAD");
                                    } catch (Exception var27) {
                                       var10001 = false;
                                       break label263;
                                    }
                                 } else if (var18 >= 1) {
                                    try {
                                       this.setTextNetworkQualitySummary("FAIR");
                                    } catch (Exception var25) {
                                       var10001 = false;
                                       break label263;
                                    }
                                 } else if (var65 >= 1) {
                                    try {
                                       this.setTextNetworkQualitySummary("GOOD");
                                    } catch (Exception var23) {
                                       var10001 = false;
                                       break label263;
                                    }
                                 }
                              }

                              var16 = var12 + 1;
                           }
                        }

                        var11 = var15;
                        var12 = var16;
                        if (var13 >= var7) {
                           try {
                              PreCallQualityIndicator.this.checkNetQuaThread.interrupt();
                              PreCallQualityIndicator.this.checkNetQuaThread = null;
                              var62 = PreCallQualityIndicator.this.mHandler;
                              var63 = new Runnable() {
                                 public void run() {
                                    if (PreCallQualityIndicator.this.echoClient.validPacket == 0) {
                                       if (PreCallQualityIndicator.this.echoServerPref.getValidEchoServerHost().equalsIgnoreCase("HOST_1")) {
                                          PreCallQualityIndicator.this.echoServerPref.setValidEchoServerHost("HOST_2");
                                       } else if (PreCallQualityIndicator.this.echoServerPref.getValidEchoServerHost().equalsIgnoreCase("HOST_2")) {
                                          PreCallQualityIndicator.this.echoServerPref.setValidEchoServerHost("HOST_1");
                                       }
                                    }

                                    latency(PreCallQualityIndicator.this.echoClient.sendTimeArr, PreCallQualityIndicator.this.echoClient.receiveTimeArr, 0, PreCallQualityIndicator.this.echoClient.receiveTimeArr.length - 1);
                                    int[] var1x = calcValidPacketPerSection(PreCallQualityIndicator.this.echoClient.receiveTimeArr);
                                    String var2x = "";

                                    for(int var3 = 0; var3 < var1x.length; ++var3) {
                                       if (var3 != 4) {
                                          var2x = var2x + var1x[var3] + ",";
                                       } else {
                                          var2x = var2x + var1x[var3];
                                       }
                                    }

                                 }
                              };
                              var62.post(var63);
                              PreCallQualityIndicator.this.isUpdateIndiThreadWorking = false;
                           } catch (Exception var21) {
                              var10001 = false;
                              break label263;
                           }

                           var11 = var15;
                           var12 = var16;
                        }
                     }
                  }

                  PreCallQualityIndicator.this.mHandler.post(new Runnable() {
                     public void run() {
                     }
                  });
                  return;
               }

               PreCallQualityIndicator.this.mHandler.post(new Runnable() {
                  public void run() {
                  }
               });
            }
         });
         this.checkNetQuaThread.start();
      }

   }

   private void checkNetworkQualityPauseTime() {
      if (this.checkNetQuaPauseTimeThread != null) {
         this.checkNetQuaPauseTimeThread.interrupt();
         this.checkNetQuaPauseTimeThread = null;
      }

      this.checkNetQuaPauseTimeThread = new Thread(new Runnable() {
         public void run() {
            long var1 = (long)((double)5 * 1.0E9D);
            long var3 = System.nanoTime();

            while(PreCallQualityIndicator.this.checkNetQuaPauseTimeThread != null) {
               try {
                  Thread.sleep(1000L);
               } catch (InterruptedException var6) {
                  var6.printStackTrace();
               }

               if (System.nanoTime() - var3 >= var1) {
                  if (PreCallQualityIndicator.this.checkNetQuaPauseTimeThread != null) {
                     PreCallQualityIndicator.this.checkNetQuaPauseTimeThread.interrupt();
                     PreCallQualityIndicator.this.checkNetQuaPauseTimeThread = null;
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
                        } else {
                           PreCallQualityIndicator.this.checkNetworkQuality();
                        }
                     }

                  }
               });
            }
         }, 500L, (long)this.networkIndiRefreshTime);
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
      Message var1 = new Message();
      var1.what = 1000;
      var1.obj = "UNKNOWN";
      this.uiHandler.sendMessage(var1);
   }

   public void startChecking() {
      this.startPreCallQI();
   }

   public void stopChecking() {
      this.stopPreCallQI();
   }
}
