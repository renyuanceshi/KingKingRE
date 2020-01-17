package de.timroes.axmlrpc.xmlcreator;

public class SimpleXMLCreator {
    private XmlElement root;

    public void setRootElement(XmlElement xmlElement) {
        this.root = xmlElement;
    }

    public String toString() {
        return "<?xml version=\"1.0\"?>\n" + this.root.toString();
    }
}
