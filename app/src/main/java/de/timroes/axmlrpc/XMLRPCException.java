package de.timroes.axmlrpc;

public class XMLRPCException extends Exception {
    public XMLRPCException(Exception exc) {
        super(exc);
    }

    public XMLRPCException(String str) {
        super(str);
    }

    public XMLRPCException(String str, Exception exc) {
        super(str, exc);
    }
}
