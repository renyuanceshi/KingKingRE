package de.timroes.axmlrpc;

public class XMLRPCRuntimeException extends RuntimeException {
    public XMLRPCRuntimeException(Exception exc) {
        super(exc);
    }

    public XMLRPCRuntimeException(String str) {
        super(str);
    }
}
