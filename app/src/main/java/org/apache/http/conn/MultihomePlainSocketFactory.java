package org.apache.http.conn;

import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import org.apache.http.annotation.Immutable;
import org.apache.http.conn.scheme.SocketFactory;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@Immutable
@Deprecated
public final class MultihomePlainSocketFactory implements SocketFactory {
    private static final MultihomePlainSocketFactory DEFAULT_FACTORY = new MultihomePlainSocketFactory();

    private MultihomePlainSocketFactory() {
    }

    public static MultihomePlainSocketFactory getSocketFactory() {
        return DEFAULT_FACTORY;
    }

    public Socket connectSocket(Socket socket, String str, int i, InetAddress inetAddress, int i2, HttpParams httpParams) throws IOException {
        Socket socket2;
        Args.notNull(str, "Target host");
        Args.notNull(httpParams, "HTTP parameters");
        Socket createSocket = socket == null ? createSocket() : socket;
        if (inetAddress != null || i2 > 0) {
            if (i2 <= 0) {
                i2 = 0;
            }
            createSocket.bind(new InetSocketAddress(inetAddress, i2));
        }
        int connectionTimeout = HttpConnectionParams.getConnectionTimeout(httpParams);
        InetAddress[] allByName = InetAddress.getAllByName(str);
        ArrayList arrayList = new ArrayList(allByName.length);
        arrayList.addAll(Arrays.asList(allByName));
        Collections.shuffle(arrayList);
        IOException e = null;
        Iterator it = arrayList.iterator();
        while (true) {
            socket2 = createSocket;
            if (!it.hasNext()) {
                break;
            }
            InetAddress inetAddress2 = (InetAddress) it.next();
            try {
                socket2.connect(new InetSocketAddress(inetAddress2, i), connectionTimeout);
                break;
            } catch (SocketTimeoutException e2) {
                throw new ConnectTimeoutException("Connect to " + inetAddress2 + " timed out");
            } catch (IOException e3) {
                e = e3;
                createSocket = new Socket();
            }
        }
        if (e == null) {
            return socket2;
        }
        throw e;
    }

    public Socket createSocket() {
        return new Socket();
    }

    public final boolean isSecure(Socket socket) throws IllegalArgumentException {
        Args.notNull(socket, "Socket");
        Asserts.check(!socket.isClosed(), "Socket is closed");
        return false;
    }
}
