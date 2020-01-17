package de.timroes.axmlrpc;

public class XMLRPCServerException extends XMLRPCException {
    private int errornr;

    public XMLRPCServerException(String str, int i) {
        super(str);
        this.errornr = i;
    }

    public int getErrorNr() {
        return this.errornr;
    }

    public String getMessage() {
        return super.getMessage() + " [" + this.errornr + "]";
    }
}
