package com.pccw.mobile.service;

import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.util.PreCallQualityIndicator;
import java.io.IOException;
import java.math.BigInteger;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

public class EchoClient {
    boolean contRun = false;
    /* access modifiers changed from: private */
    public String csNum;
    /* access modifiers changed from: private */
    public int echoId;
    public long elapsedTime = 0;
    /* access modifiers changed from: private */
    public InetAddress host;
    /* access modifiers changed from: private */
    public int port;
    Thread receiveThread = null;
    public long[] receiveTimeArr = new long[this.retryTime];
    public int retryTime = 100;
    Thread sendThread = null;
    public long[] sendTimeArr = new long[this.retryTime];
    public int validPacket = 0;

    public EchoClient(InetAddress inetAddress, int i, int i2, String str) {
        this.host = inetAddress;
        this.port = i;
        this.echoId = i2;
        this.csNum = str;
    }

    public static String HexToString(String str) {
        StringBuilder sb = new StringBuilder();
        char[] charArray = str.toCharArray();
        for (int i = 0; i < charArray.length - 1; i += 2) {
            sb.append((char) ((Character.digit(charArray[i], 16) * 16) + Character.digit(charArray[i + 1], 16)));
        }
        return sb.toString();
    }

    public static byte[] hexStringToByteArray(String str) {
        int length = str.length();
        byte[] bArr = new byte[(length / 2)];
        for (int i = 0; i < length; i += 2) {
            bArr[i / 2] = (byte) ((byte) ((Character.digit(str.charAt(i), 16) << 4) + Character.digit(str.charAt(i + 1), 16)));
        }
        return bArr;
    }

    public String StringToHex(String str) {
        return String.format("%040x", new Object[]{new BigInteger(1, str.getBytes())});
    }

    public void run() {
        try {
            final DatagramSocket datagramSocket = new DatagramSocket();
            byte[] bArr = new byte[Constants.HEARTBEAT_RETRY_INTERVAL];
            final DatagramPacket datagramPacket = new DatagramPacket(bArr, bArr.length);
            for (int i = 0; i < this.retryTime; i++) {
                this.receiveTimeArr[i] = 0;
            }
            this.contRun = true;
            final Thread thread = new Thread(new Runnable() {
                boolean counting = true;
                long startTime = System.nanoTime();
                long timeLimit = 5000000000L;

                public void run() {
                    while (this.counting) {
                        try {
                            Thread.sleep(2510);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        if (System.nanoTime() - this.startTime >= this.timeLimit) {
                            this.counting = false;
                            EchoClient.this.contRun = false;
                            if (!datagramSocket.isClosed()) {
                                datagramSocket.close();
                            }
                            if (EchoClient.this.receiveThread != null) {
                                EchoClient.this.receiveThread.interrupt();
                                EchoClient.this.receiveThread = null;
                            }
                        }
                    }
                }
            });
            this.sendThread = new Thread(new Runnable() {
                public void run() {
                    String str = "";
                    while (str.length() < 62) {
                        str = str + "a";
                    }
                    byte[] bytes = str.getBytes();
                    DatagramPacket datagramPacket = new DatagramPacket(bytes, bytes.length, EchoClient.this.host, EchoClient.this.port);
                    int i = 0;
                    while (true) {
                        int i2 = i;
                        if (i2 < EchoClient.this.retryTime) {
                            String str2 = "id=" + EchoClient.this.echoId + ";" + Integer.toString(i2) + ";" + EchoClient.this.csNum + ";";
                            String hexString = Integer.toHexString((i2 * 240) + 2240);
                            while (hexString.length() < 8) {
                                hexString = "0" + hexString;
                            }
                            String hexString2 = Integer.toHexString(i2);
                            while (hexString2.length() < 4) {
                                hexString2 = "0" + hexString2;
                            }
                            while (str2.length() < 50) {
                                str2 = str2 + "a";
                            }
                            datagramPacket.setData(EchoClient.hexStringToByteArray("8064" + hexString2 + hexString + "7b0418e4" + EchoClient.this.StringToHex(str2)));
                            try {
                                datagramSocket.send(datagramPacket);
                                EchoClient.this.sendTimeArr[i2] = System.nanoTime();
                                if (i2 == 0) {
                                    thread.start();
                                }
                                Thread.sleep(30);
                            } catch (IOException | InterruptedException e) {
                            }
                            i = i2 + 1;
                        } else {
                            return;
                        }
                    }
                }
            });
            this.receiveThread = new Thread(new Runnable() {
                public void run() {
                    EchoClient.this.validPacket = 0;
                    long j = 0;
                    while (EchoClient.this.contRun) {
                        try {
                            datagramSocket.receive(datagramPacket);
                            String[] split = new String(datagramPacket.getData(), 12, 9).split(";");
                            if (Integer.parseInt(split[0].split("=")[1].trim()) == PreCallQualityIndicator.validEchoId) {
                                EchoClient.this.receiveTimeArr[Integer.parseInt(split[1].trim())] = System.nanoTime();
                                EchoClient.this.validPacket++;
                                if (j == 0) {
                                    j = System.nanoTime();
                                } else if (EchoClient.this.validPacket < EchoClient.this.retryTime) {
                                    EchoClient.this.elapsedTime = System.nanoTime() - j;
                                } else {
                                    return;
                                }
                            } else {
                                continue;
                            }
                        } catch (IOException e) {
                        }
                    }
                }
            });
            this.receiveThread.start();
            Thread.sleep(100);
            this.sendThread.start();
        } catch (Exception e) {
        }
    }

    public void stop() {
        this.contRun = false;
        if (this.receiveThread != null) {
            this.receiveThread.interrupt();
        }
    }
}
