package de.timroes.axmlrpc.xmlcreator;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class XmlElement {
    private List<XmlElement> children = new ArrayList();
    private String content;
    private String name;

    public XmlElement(String str) {
        this.name = str;
    }

    public void addChildren(XmlElement xmlElement) {
        this.children.add(xmlElement);
    }

    public void setContent(String str) {
        this.content = str;
    }

    public String toString() {
        if (this.content != null && this.content.length() > 0) {
            return "\n<" + this.name + ">" + this.content + "</" + this.name + ">\n";
        }
        if (this.children.size() <= 0) {
            return "\n<" + this.name + "/>\n";
        }
        String str = "\n<" + this.name + ">";
        Iterator<XmlElement> it = this.children.iterator();
        while (true) {
            String str2 = str;
            if (!it.hasNext()) {
                return str2 + "</" + this.name + ">\n";
            }
            str = str2 + it.next().toString();
        }
    }
}
