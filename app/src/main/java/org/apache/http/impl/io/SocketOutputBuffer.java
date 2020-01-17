package org.apache.http.impl.io;

import java.io.IOException;
import java.net.Socket;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;

@NotThreadSafe
@Deprecated
public class SocketOutputBuffer extends AbstractSessionOutputBuffer {
    public SocketOutputBuffer(Socket socket, int i, HttpParams httpParams) throws IOException {
        int i2 = 1024;
        Args.notNull(socket, "Socket");
        int sendBufferSize = i < 0 ? socket.getSendBufferSize() : i;
        init(socket.getOutputStream(), sendBufferSize >= 1024 ? sendBufferSize : i2, httpParams);
    }
}
