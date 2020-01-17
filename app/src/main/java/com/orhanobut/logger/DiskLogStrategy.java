package com.orhanobut.logger;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class DiskLogStrategy implements LogStrategy {
    private final Handler handler;

    static class WriteHandler extends Handler {
        private final String folder;
        private final int maxFileSize;

        WriteHandler(Looper looper, String str, int i) {
            super(looper);
            this.folder = str;
            this.maxFileSize = i;
        }

        private File getLogFile(String str, String str2) {
            File file = new File(str);
            if (!file.exists()) {
                file.mkdirs();
            }
            File file2 = null;
            File file3 = new File(file, String.format("%s_%s.csv", new Object[]{str2, 0}));
            int i = 0;
            while (file3.exists()) {
                i++;
                file2 = file3;
                file3 = new File(file, String.format("%s_%s.csv", new Object[]{str2, Integer.valueOf(i)}));
            }
            return (file2 == null || file2.length() >= ((long) this.maxFileSize)) ? file3 : file2;
        }

        private void writeLog(FileWriter fileWriter, String str) throws IOException {
            fileWriter.append(str);
        }

        public void handleMessage(Message message) {
            FileWriter fileWriter;
            String str = (String) message.obj;
            try {
                FileWriter fileWriter2 = new FileWriter(getLogFile(this.folder, "logs"), true);
                try {
                    writeLog(fileWriter2, str);
                    fileWriter2.flush();
                    fileWriter2.close();
                } catch (IOException e) {
                    fileWriter = fileWriter2;
                }
            } catch (IOException e2) {
                fileWriter = null;
                if (fileWriter != null) {
                    try {
                        fileWriter.flush();
                        fileWriter.close();
                    } catch (IOException e3) {
                    }
                }
            }
        }
    }

    public DiskLogStrategy(Handler handler2) {
        this.handler = handler2;
    }

    public void log(int i, String str, String str2) {
        this.handler.sendMessage(this.handler.obtainMessage(i, str2));
    }
}
