package org.apache.commons.lang;

import de.timroes.axmlrpc.serializer.SerializerHandler;
import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

class Entities {
    private static final String[][] APOS_ARRAY = {new String[]{"apos", "39"}};
    private static final String[][] BASIC_ARRAY;
    public static final Entities HTML32;
    public static final Entities HTML40;
    static final String[][] HTML40_ARRAY;
    static final String[][] ISO8859_1_ARRAY;
    public static final Entities XML;
    private final EntityMap map;

    static class ArrayEntityMap implements EntityMap {
        protected final int growBy;
        protected String[] names;
        protected int size;
        protected int[] values;

        public ArrayEntityMap() {
            this.size = 0;
            this.growBy = 100;
            this.names = new String[this.growBy];
            this.values = new int[this.growBy];
        }

        public ArrayEntityMap(int i) {
            this.size = 0;
            this.growBy = i;
            this.names = new String[i];
            this.values = new int[i];
        }

        public void add(String str, int i) {
            ensureCapacity(this.size + 1);
            this.names[this.size] = str;
            this.values[this.size] = i;
            this.size++;
        }

        /* access modifiers changed from: protected */
        public void ensureCapacity(int i) {
            if (i > this.names.length) {
                int max = Math.max(i, this.size + this.growBy);
                String[] strArr = new String[max];
                System.arraycopy(this.names, 0, strArr, 0, this.size);
                this.names = strArr;
                int[] iArr = new int[max];
                System.arraycopy(this.values, 0, iArr, 0, this.size);
                this.values = iArr;
            }
        }

        public String name(int i) {
            for (int i2 = 0; i2 < this.size; i2++) {
                if (this.values[i2] == i) {
                    return this.names[i2];
                }
            }
            return null;
        }

        public int value(String str) {
            for (int i = 0; i < this.size; i++) {
                if (this.names[i].equals(str)) {
                    return this.values[i];
                }
            }
            return -1;
        }
    }

    static class BinaryEntityMap extends ArrayEntityMap {
        public BinaryEntityMap() {
        }

        public BinaryEntityMap(int i) {
            super(i);
        }

        private int binarySearch(int i) {
            int i2 = 0;
            int i3 = this.size - 1;
            while (i2 <= i3) {
                int i4 = (i2 + i3) >>> 1;
                int i5 = this.values[i4];
                if (i5 < i) {
                    i2 = i4 + 1;
                } else if (i5 <= i) {
                    return i4;
                } else {
                    i3 = i4 - 1;
                }
            }
            return -(i2 + 1);
        }

        public void add(String str, int i) {
            ensureCapacity(this.size + 1);
            int binarySearch = binarySearch(i);
            if (binarySearch <= 0) {
                int i2 = -(binarySearch + 1);
                System.arraycopy(this.values, i2, this.values, i2 + 1, this.size - i2);
                this.values[i2] = i;
                System.arraycopy(this.names, i2, this.names, i2 + 1, this.size - i2);
                this.names[i2] = str;
                this.size++;
            }
        }

        public String name(int i) {
            int binarySearch = binarySearch(i);
            if (binarySearch < 0) {
                return null;
            }
            return this.names[binarySearch];
        }
    }

    interface EntityMap {
        void add(String str, int i);

        String name(int i);

        int value(String str);
    }

    static class HashEntityMap extends MapIntMap {
        public HashEntityMap() {
            super(new HashMap(), new HashMap());
        }
    }

    static class LookupEntityMap extends PrimitiveEntityMap {
        private final int LOOKUP_TABLE_SIZE = 256;
        private String[] lookupTable;

        LookupEntityMap() {
        }

        private void createLookupTable() {
            this.lookupTable = new String[256];
            for (int i = 0; i < 256; i++) {
                this.lookupTable[i] = super.name(i);
            }
        }

        private String[] lookupTable() {
            if (this.lookupTable == null) {
                createLookupTable();
            }
            return this.lookupTable;
        }

        public String name(int i) {
            return i < 256 ? lookupTable()[i] : super.name(i);
        }
    }

    static abstract class MapIntMap implements EntityMap {
        protected final Map mapNameToValue;
        protected final Map mapValueToName;

        MapIntMap(Map map, Map map2) {
            this.mapNameToValue = map;
            this.mapValueToName = map2;
        }

        public void add(String str, int i) {
            this.mapNameToValue.put(str, new Integer(i));
            this.mapValueToName.put(new Integer(i), str);
        }

        public String name(int i) {
            return (String) this.mapValueToName.get(new Integer(i));
        }

        public int value(String str) {
            Object obj = this.mapNameToValue.get(str);
            if (obj == null) {
                return -1;
            }
            return ((Integer) obj).intValue();
        }
    }

    static class PrimitiveEntityMap implements EntityMap {
        private final Map mapNameToValue = new HashMap();
        private final IntHashMap mapValueToName = new IntHashMap();

        PrimitiveEntityMap() {
        }

        public void add(String str, int i) {
            this.mapNameToValue.put(str, new Integer(i));
            this.mapValueToName.put(i, str);
        }

        public String name(int i) {
            return (String) this.mapValueToName.get(i);
        }

        public int value(String str) {
            Object obj = this.mapNameToValue.get(str);
            if (obj == null) {
                return -1;
            }
            return ((Integer) obj).intValue();
        }
    }

    static class TreeEntityMap extends MapIntMap {
        public TreeEntityMap() {
            super(new TreeMap(), new TreeMap());
        }
    }

    static {
        String[] strArr = {"lt", "60"};
        BASIC_ARRAY = new String[][]{new String[]{"quot", "34"}, new String[]{"amp", "38"}, strArr, new String[]{"gt", "62"}};
        String[] strArr2 = {"nbsp", "160"};
        String[] strArr3 = {"cent", "162"};
        String[] strArr4 = {"pound", "163"};
        String[] strArr5 = {"brvbar", "166"};
        String[] strArr6 = {"sect", "167"};
        String[] strArr7 = {"uml", "168"};
        String[] strArr8 = {"copy", "169"};
        String[] strArr9 = {"ordf", "170"};
        String[] strArr10 = {"laquo", "171"};
        String[] strArr11 = {"macr", "175"};
        String[] strArr12 = {"deg", "176"};
        String[] strArr13 = {"plusmn", "177"};
        String[] strArr14 = {"sup2", "178"};
        String[] strArr15 = {"sup3", "179"};
        String[] strArr16 = {"acute", "180"};
        String[] strArr17 = {"micro", "181"};
        String[] strArr18 = {"para", "182"};
        String[] strArr19 = {"middot", "183"};
        String[] strArr20 = {"sup1", "185"};
        String[] strArr21 = {"ordm", "186"};
        String[] strArr22 = {"raquo", "187"};
        String[] strArr23 = {"frac14", "188"};
        String[] strArr24 = {"frac12", "189"};
        String[] strArr25 = {"frac34", "190"};
        String[] strArr26 = {"Agrave", "192"};
        String[] strArr27 = {"Aacute", "193"};
        String[] strArr28 = {"Atilde", "195"};
        String[] strArr29 = {"Auml", "196"};
        String[] strArr30 = {"Aring", "197"};
        String[] strArr31 = {"Ccedil", "199"};
        String[] strArr32 = {"Egrave", "200"};
        String[] strArr33 = {"Euml", "203"};
        String[] strArr34 = {"Igrave", "204"};
        String[] strArr35 = {"Iacute", "205"};
        String[] strArr36 = {"Icirc", "206"};
        String[] strArr37 = {"Iuml", "207"};
        String[] strArr38 = {"ETH", "208"};
        String[] strArr39 = {"Ntilde", "209"};
        String[] strArr40 = {"Ograve", "210"};
        String[] strArr41 = {"Oacute", "211"};
        String[] strArr42 = {"Ocirc", "212"};
        String[] strArr43 = {"Otilde", "213"};
        String[] strArr44 = {"Ouml", "214"};
        String[] strArr45 = {"Oslash", "216"};
        String[] strArr46 = {"Uacute", "218"};
        String[] strArr47 = {"Ucirc", "219"};
        String[] strArr48 = {"Uuml", "220"};
        String[] strArr49 = {"THORN", "222"};
        String[] strArr50 = {"szlig", "223"};
        String[] strArr51 = {"aacute", "225"};
        String[] strArr52 = {"acirc", "226"};
        String[] strArr53 = {"atilde", "227"};
        String[] strArr54 = {"auml", "228"};
        String[] strArr55 = {"aring", "229"};
        String[] strArr56 = {"aelig", "230"};
        String[] strArr57 = {"ccedil", "231"};
        String[] strArr58 = {"egrave", "232"};
        String[] strArr59 = {"eacute", "233"};
        String[] strArr60 = {"ecirc", "234"};
        String[] strArr61 = {"euml", "235"};
        String[] strArr62 = {"iacute", "237"};
        String[] strArr63 = {"icirc", "238"};
        String[] strArr64 = {"iuml", "239"};
        String[] strArr65 = {"eth", "240"};
        String[] strArr66 = {"ntilde", "241"};
        String[] strArr67 = {"ograve", "242"};
        String[] strArr68 = {"otilde", "245"};
        String[] strArr69 = {"ouml", "246"};
        String[] strArr70 = {"divide", "247"};
        String[] strArr71 = {"oslash", "248"};
        ISO8859_1_ARRAY = new String[][]{strArr2, new String[]{"iexcl", "161"}, strArr3, strArr4, new String[]{"curren", "164"}, new String[]{"yen", "165"}, strArr5, strArr6, strArr7, strArr8, strArr9, strArr10, new String[]{"not", "172"}, new String[]{"shy", "173"}, new String[]{"reg", "174"}, strArr11, strArr12, strArr13, strArr14, strArr15, strArr16, strArr17, strArr18, strArr19, new String[]{"cedil", "184"}, strArr20, strArr21, strArr22, strArr23, strArr24, strArr25, new String[]{"iquest", "191"}, strArr26, strArr27, new String[]{"Acirc", "194"}, strArr28, strArr29, strArr30, new String[]{"AElig", "198"}, strArr31, strArr32, new String[]{"Eacute", "201"}, new String[]{"Ecirc", "202"}, strArr33, strArr34, strArr35, strArr36, strArr37, strArr38, strArr39, strArr40, strArr41, strArr42, strArr43, strArr44, new String[]{"times", "215"}, strArr45, new String[]{"Ugrave", "217"}, strArr46, strArr47, strArr48, new String[]{"Yacute", "221"}, strArr49, strArr50, new String[]{"agrave", "224"}, strArr51, strArr52, strArr53, strArr54, strArr55, strArr56, strArr57, strArr58, strArr59, strArr60, strArr61, new String[]{"igrave", "236"}, strArr62, strArr63, strArr64, strArr65, strArr66, strArr67, new String[]{"oacute", "243"}, new String[]{"ocirc", "244"}, strArr68, strArr69, strArr70, strArr71, new String[]{"ugrave", "249"}, new String[]{"uacute", "250"}, new String[]{"ucirc", "251"}, new String[]{"uuml", "252"}, new String[]{"yacute", "253"}, new String[]{"thorn", "254"}, new String[]{"yuml", "255"}};
        String[] strArr72 = {"fnof", "402"};
        String[] strArr73 = {"Alpha", "913"};
        String[] strArr74 = {"Beta", "914"};
        String[] strArr75 = {"Gamma", "915"};
        String[] strArr76 = {"Delta", "916"};
        String[] strArr77 = {"Zeta", "918"};
        String[] strArr78 = {"Theta", "920"};
        String[] strArr79 = {"Iota", "921"};
        String[] strArr80 = {"Kappa", "922"};
        String[] strArr81 = {"Lambda", "923"};
        String[] strArr82 = {"Mu", "924"};
        String[] strArr83 = {"Nu", "925"};
        String[] strArr84 = {"Xi", "926"};
        String[] strArr85 = {"Omicron", "927"};
        String[] strArr86 = {"Pi", "928"};
        String[] strArr87 = {"Rho", "929"};
        String[] strArr88 = {"Sigma", "931"};
        String[] strArr89 = {"Tau", "932"};
        String[] strArr90 = {"Upsilon", "933"};
        String[] strArr91 = {"Phi", "934"};
        String[] strArr92 = {"Chi", "935"};
        String[] strArr93 = {"Psi", "936"};
        String[] strArr94 = {"Omega", "937"};
        String[] strArr95 = {"alpha", "945"};
        String[] strArr96 = {"gamma", "947"};
        String[] strArr97 = {"epsilon", "949"};
        String[] strArr98 = {"theta", "952"};
        String[] strArr99 = {"iota", "953"};
        String[] strArr100 = {"lambda", "955"};
        String[] strArr101 = {"mu", "956"};
        String[] strArr102 = {"nu", "957"};
        String[] strArr103 = {"xi", "958"};
        String[] strArr104 = {"omicron", "959"};
        String[] strArr105 = {"pi", "960"};
        String[] strArr106 = {"rho", "961"};
        String[] strArr107 = {"sigmaf", "962"};
        String[] strArr108 = {"sigma", "963"};
        String[] strArr109 = {"tau", "964"};
        String[] strArr110 = {"upsilon", "965"};
        String[] strArr111 = {"phi", "966"};
        String[] strArr112 = {"chi", "967"};
        String[] strArr113 = {"psi", "968"};
        String[] strArr114 = {"omega", "969"};
        String[] strArr115 = {"thetasym", "977"};
        String[] strArr116 = {"upsih", "978"};
        String[] strArr117 = {"piv", "982"};
        String[] strArr118 = {"bull", "8226"};
        String[] strArr119 = {"prime", "8242"};
        String[] strArr120 = {"oline", "8254"};
        String[] strArr121 = {"frasl", "8260"};
        String[] strArr122 = {"weierp", "8472"};
        String[] strArr123 = {"real", "8476"};
        String[] strArr124 = {"trade", "8482"};
        String[] strArr125 = {"larr", "8592"};
        String[] strArr126 = {"uarr", "8593"};
        String[] strArr127 = {"rarr", "8594"};
        String[] strArr128 = {"darr", "8595"};
        String[] strArr129 = {"harr", "8596"};
        String[] strArr130 = {"crarr", "8629"};
        String[] strArr131 = {"lArr", "8656"};
        String[] strArr132 = {"uArr", "8657"};
        String[] strArr133 = {"rArr", "8658"};
        String[] strArr134 = {"dArr", "8659"};
        String[] strArr135 = {"hArr", "8660"};
        String[] strArr136 = {"forall", "8704"};
        String[] strArr137 = {"part", "8706"};
        String[] strArr138 = {"exist", "8707"};
        String[] strArr139 = {"empty", "8709"};
        String[] strArr140 = {"nabla", "8711"};
        String[] strArr141 = {"isin", "8712"};
        String[] strArr142 = {"notin", "8713"};
        String[] strArr143 = {"ni", "8715"};
        String[] strArr144 = {"sum", "8721"};
        String[] strArr145 = {"minus", "8722"};
        String[] strArr146 = {"lowast", "8727"};
        String[] strArr147 = {"radic", "8730"};
        String[] strArr148 = {"prop", "8733"};
        String[] strArr149 = {"infin", "8734"};
        String[] strArr150 = {"ang", "8736"};
        String[] strArr151 = {"and", "8743"};
        String[] strArr152 = {"or", "8744"};
        String[] strArr153 = {"cap", "8745"};
        String[] strArr154 = {SerializerHandler.TYPE_INT, "8747"};
        String[] strArr155 = {"there4", "8756"};
        String[] strArr156 = {"sim", "8764"};
        String[] strArr157 = {"ne", "8800"};
        String[] strArr158 = {"equiv", "8801"};
        String[] strArr159 = {"le", "8804"};
        String[] strArr160 = {"ge", "8805"};
        String[] strArr161 = {"sub", "8834"};
        String[] strArr162 = {"sup", "8835"};
        String[] strArr163 = {"sube", "8838"};
        String[] strArr164 = {"supe", "8839"};
        String[] strArr165 = {"otimes", "8855"};
        String[] strArr166 = {"perp", "8869"};
        String[] strArr167 = {"sdot", "8901"};
        String[] strArr168 = {"lceil", "8968"};
        String[] strArr169 = {"rceil", "8969"};
        String[] strArr170 = {"lfloor", "8970"};
        String[] strArr171 = {"rfloor", "8971"};
        String[] strArr172 = {"lang", "9001"};
        String[] strArr173 = {"rang", "9002"};
        String[] strArr174 = {"loz", "9674"};
        String[] strArr175 = {"spades", "9824"};
        String[] strArr176 = {"clubs", "9827"};
        String[] strArr177 = {"hearts", "9829"};
        String[] strArr178 = {"OElig", "338"};
        String[] strArr179 = {"oelig", "339"};
        String[] strArr180 = {"Scaron", "352"};
        String[] strArr181 = {"scaron", "353"};
        String[] strArr182 = {"Yuml", "376"};
        String[] strArr183 = {"circ", "710"};
        String[] strArr184 = {"ensp", "8194"};
        String[] strArr185 = {"emsp", "8195"};
        String[] strArr186 = {"thinsp", "8201"};
        String[] strArr187 = {"zwnj", "8204"};
        String[] strArr188 = {"zwj", "8205"};
        String[] strArr189 = {"lrm", "8206"};
        String[] strArr190 = {"rlm", "8207"};
        String[] strArr191 = {"ndash", "8211"};
        String[] strArr192 = {"mdash", "8212"};
        String[] strArr193 = {"lsquo", "8216"};
        String[] strArr194 = {"rsquo", "8217"};
        String[] strArr195 = {"sbquo", "8218"};
        String[] strArr196 = {"ldquo", "8220"};
        HTML40_ARRAY = new String[][]{strArr72, strArr73, strArr74, strArr75, strArr76, new String[]{"Epsilon", "917"}, strArr77, new String[]{"Eta", "919"}, strArr78, strArr79, strArr80, strArr81, strArr82, strArr83, strArr84, strArr85, strArr86, strArr87, strArr88, strArr89, strArr90, strArr91, strArr92, strArr93, strArr94, strArr95, new String[]{"beta", "946"}, strArr96, new String[]{"delta", "948"}, strArr97, new String[]{"zeta", "950"}, new String[]{"eta", "951"}, strArr98, strArr99, new String[]{"kappa", "954"}, strArr100, strArr101, strArr102, strArr103, strArr104, strArr105, strArr106, strArr107, strArr108, strArr109, strArr110, strArr111, strArr112, strArr113, strArr114, strArr115, strArr116, strArr117, strArr118, new String[]{"hellip", "8230"}, strArr119, new String[]{"Prime", "8243"}, strArr120, strArr121, strArr122, new String[]{"image", "8465"}, strArr123, strArr124, new String[]{"alefsym", "8501"}, strArr125, strArr126, strArr127, strArr128, strArr129, strArr130, strArr131, strArr132, strArr133, strArr134, strArr135, strArr136, strArr137, strArr138, strArr139, strArr140, strArr141, strArr142, strArr143, new String[]{"prod", "8719"}, strArr144, strArr145, strArr146, strArr147, strArr148, strArr149, strArr150, strArr151, strArr152, strArr153, new String[]{"cup", "8746"}, strArr154, strArr155, strArr156, new String[]{"cong", "8773"}, new String[]{"asymp", "8776"}, strArr157, strArr158, strArr159, strArr160, strArr161, strArr162, strArr163, strArr164, new String[]{"oplus", "8853"}, strArr165, strArr166, strArr167, strArr168, strArr169, strArr170, strArr171, strArr172, strArr173, strArr174, strArr175, strArr176, strArr177, new String[]{"diams", "9830"}, strArr178, strArr179, strArr180, strArr181, strArr182, strArr183, new String[]{"tilde", "732"}, strArr184, strArr185, strArr186, strArr187, strArr188, strArr189, strArr190, strArr191, strArr192, strArr193, strArr194, strArr195, strArr196, new String[]{"rdquo", "8221"}, new String[]{"bdquo", "8222"}, new String[]{"dagger", "8224"}, new String[]{"Dagger", "8225"}, new String[]{"permil", "8240"}, new String[]{"lsaquo", "8249"}, new String[]{"rsaquo", "8250"}, new String[]{"euro", "8364"}};
        Entities entities = new Entities();
        entities.addEntities(BASIC_ARRAY);
        entities.addEntities(APOS_ARRAY);
        XML = entities;
        Entities entities2 = new Entities();
        entities2.addEntities(BASIC_ARRAY);
        entities2.addEntities(ISO8859_1_ARRAY);
        HTML32 = entities2;
        Entities entities3 = new Entities();
        fillWithHtml40Entities(entities3);
        HTML40 = entities3;
    }

    public Entities() {
        this.map = new LookupEntityMap();
    }

    Entities(EntityMap entityMap) {
        this.map = entityMap;
    }

    private StringWriter createStringWriter(String str) {
        return new StringWriter((int) (((double) str.length()) + (((double) str.length()) * 0.1d)));
    }

    /* JADX WARNING: Removed duplicated region for block: B:26:0x0061  */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x0080  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void doUnescape(java.io.Writer r12, java.lang.String r13, int r14) throws java.io.IOException {
        /*
            r11 = this;
            r10 = 59
            r9 = 0
            r8 = 38
            r7 = 1
            r2 = -1
            r12.write(r13, r9, r14)
            int r3 = r13.length()
            r0 = r14
        L_0x000f:
            if (r0 >= r3) goto L_0x0088
            char r4 = r13.charAt(r0)
            if (r4 != r8) goto L_0x0084
            int r5 = r0 + 1
            int r1 = r13.indexOf(r10, r5)
            if (r1 != r2) goto L_0x0025
            r12.write(r4)
        L_0x0022:
            int r0 = r0 + 1
            goto L_0x000f
        L_0x0025:
            int r6 = r0 + 1
            int r6 = r13.indexOf(r8, r6)
            if (r6 == r2) goto L_0x0033
            if (r6 >= r1) goto L_0x0033
            r12.write(r4)
            goto L_0x0022
        L_0x0033:
            java.lang.String r4 = r13.substring(r5, r1)
            int r0 = r4.length()
            if (r0 <= 0) goto L_0x0089
            char r5 = r4.charAt(r9)
            r6 = 35
            if (r5 != r6) goto L_0x007b
            if (r0 <= r7) goto L_0x0089
            char r0 = r4.charAt(r7)
            switch(r0) {
                case 88: goto L_0x006c;
                case 120: goto L_0x006c;
                default: goto L_0x004e;
            }
        L_0x004e:
            r0 = 1
            java.lang.String r0 = r4.substring(r0)     // Catch:{ NumberFormatException -> 0x0078 }
            r5 = 10
            int r0 = java.lang.Integer.parseInt(r0, r5)     // Catch:{ NumberFormatException -> 0x0078 }
        L_0x0059:
            r5 = 65535(0xffff, float:9.1834E-41)
            if (r0 <= r5) goto L_0x005f
            r0 = r2
        L_0x005f:
            if (r0 != r2) goto L_0x0080
            r12.write(r8)
            r12.write(r4)
            r12.write(r10)
        L_0x006a:
            r0 = r1
            goto L_0x0022
        L_0x006c:
            r0 = 2
            java.lang.String r0 = r4.substring(r0)     // Catch:{ NumberFormatException -> 0x0078 }
            r5 = 16
            int r0 = java.lang.Integer.parseInt(r0, r5)     // Catch:{ NumberFormatException -> 0x0078 }
            goto L_0x0059
        L_0x0078:
            r0 = move-exception
            r0 = r2
            goto L_0x005f
        L_0x007b:
            int r0 = r11.entityValue(r4)
            goto L_0x005f
        L_0x0080:
            r12.write(r0)
            goto L_0x006a
        L_0x0084:
            r12.write(r4)
            goto L_0x0022
        L_0x0088:
            return
        L_0x0089:
            r0 = r2
            goto L_0x005f
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang.Entities.doUnescape(java.io.Writer, java.lang.String, int):void");
    }

    static void fillWithHtml40Entities(Entities entities) {
        entities.addEntities(BASIC_ARRAY);
        entities.addEntities(ISO8859_1_ARRAY);
        entities.addEntities(HTML40_ARRAY);
    }

    public void addEntities(String[][] strArr) {
        for (int i = 0; i < strArr.length; i++) {
            addEntity(strArr[i][0], Integer.parseInt(strArr[i][1]));
        }
    }

    public void addEntity(String str, int i) {
        this.map.add(str, i);
    }

    public String entityName(int i) {
        return this.map.name(i);
    }

    public int entityValue(String str) {
        return this.map.value(str);
    }

    public String escape(String str) {
        StringWriter createStringWriter = createStringWriter(str);
        try {
            escape(createStringWriter, str);
            return createStringWriter.toString();
        } catch (IOException e) {
            throw new UnhandledException(e);
        }
    }

    public void escape(Writer writer, String str) throws IOException {
        int length = str.length();
        for (int i = 0; i < length; i++) {
            char charAt = str.charAt(i);
            String entityName = entityName(charAt);
            if (entityName != null) {
                writer.write(38);
                writer.write(entityName);
                writer.write(59);
            } else if (charAt > 127) {
                writer.write("&#");
                writer.write(Integer.toString(charAt, 10));
                writer.write(59);
            } else {
                writer.write(charAt);
            }
        }
    }

    public String unescape(String str) {
        int indexOf = str.indexOf(38);
        if (indexOf < 0) {
            return str;
        }
        StringWriter createStringWriter = createStringWriter(str);
        try {
            doUnescape(createStringWriter, str, indexOf);
            return createStringWriter.toString();
        } catch (IOException e) {
            throw new UnhandledException(e);
        }
    }

    public void unescape(Writer writer, String str) throws IOException {
        int indexOf = str.indexOf(38);
        if (indexOf < 0) {
            writer.write(str);
        } else {
            doUnescape(writer, str, indexOf);
        }
    }
}
