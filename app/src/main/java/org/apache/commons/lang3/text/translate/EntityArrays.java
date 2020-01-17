package org.apache.commons.lang3.text.translate;

import java.lang.reflect.Array;
import org.apache.commons.lang3.StringUtils;

public class EntityArrays {
    private static final String[][] APOS_ESCAPE = {new String[]{"'", "&apos;"}};
    private static final String[][] APOS_UNESCAPE = invert(APOS_ESCAPE);
    private static final String[][] BASIC_ESCAPE;
    private static final String[][] BASIC_UNESCAPE = invert(BASIC_ESCAPE);
    private static final String[][] HTML40_EXTENDED_ESCAPE;
    private static final String[][] HTML40_EXTENDED_UNESCAPE = invert(HTML40_EXTENDED_ESCAPE);
    private static final String[][] ISO8859_1_ESCAPE;
    private static final String[][] ISO8859_1_UNESCAPE = invert(ISO8859_1_ESCAPE);
    private static final String[][] JAVA_CTRL_CHARS_ESCAPE = {new String[]{"\b", "\\b"}, new String[]{StringUtils.LF, "\\n"}, new String[]{"\t", "\\t"}, new String[]{"\f", "\\f"}, new String[]{StringUtils.CR, "\\r"}};
    private static final String[][] JAVA_CTRL_CHARS_UNESCAPE = invert(JAVA_CTRL_CHARS_ESCAPE);

    static {
        String[] strArr = {"\u00a2", "&cent;"};
        String[] strArr2 = {"\u00a3", "&pound;"};
        String[] strArr3 = {"\u00a4", "&curren;"};
        String[] strArr4 = {"\u00a5", "&yen;"};
        String[] strArr5 = {"\u00a6", "&brvbar;"};
        String[] strArr6 = {"\u00a7", "&sect;"};
        String[] strArr7 = {"\u00a8", "&uml;"};
        String[] strArr8 = {"\u00a9", "&copy;"};
        String[] strArr9 = {"\u00ab", "&laquo;"};
        String[] strArr10 = {"\u00ac", "&not;"};
        String[] strArr11 = {"\u00ad", "&shy;"};
        String[] strArr12 = {"\u00ae", "&reg;"};
        String[] strArr13 = {"\u00af", "&macr;"};
        String[] strArr14 = {"\u00b0", "&deg;"};
        String[] strArr15 = {"\u00b1", "&plusmn;"};
        String[] strArr16 = {"\u00b2", "&sup2;"};
        String[] strArr17 = {"\u00b3", "&sup3;"};
        String[] strArr18 = {"\u00b4", "&acute;"};
        String[] strArr19 = {"\u00b5", "&micro;"};
        String[] strArr20 = {"\u00b6", "&para;"};
        String[] strArr21 = {"\u00b7", "&middot;"};
        String[] strArr22 = {"\u00b8", "&cedil;"};
        String[] strArr23 = {"\u00b9", "&sup1;"};
        String[] strArr24 = {"\u00ba", "&ordm;"};
        String[] strArr25 = {"\u00bb", "&raquo;"};
        String[] strArr26 = {"\u00bc", "&frac14;"};
        String[] strArr27 = {"\u00bd", "&frac12;"};
        String[] strArr28 = {"\u00be", "&frac34;"};
        String[] strArr29 = {"\u00bf", "&iquest;"};
        String[] strArr30 = {"\u00c0", "&Agrave;"};
        String[] strArr31 = {"\u00c1", "&Aacute;"};
        String[] strArr32 = {"\u00c2", "&Acirc;"};
        String[] strArr33 = {"\u00c3", "&Atilde;"};
        String[] strArr34 = {"\u00c4", "&Auml;"};
        String[] strArr35 = {"\u00c5", "&Aring;"};
        String[] strArr36 = {"\u00c6", "&AElig;"};
        String[] strArr37 = {"\u00c7", "&Ccedil;"};
        String[] strArr38 = {"\u00c9", "&Eacute;"};
        String[] strArr39 = {"\u00ca", "&Ecirc;"};
        String[] strArr40 = {"\u00cb", "&Euml;"};
        String[] strArr41 = {"\u00cc", "&Igrave;"};
        String[] strArr42 = {"\u00cd", "&Iacute;"};
        String[] strArr43 = {"\u00ce", "&Icirc;"};
        String[] strArr44 = {"\u00cf", "&Iuml;"};
        String[] strArr45 = {"\u00d0", "&ETH;"};
        String[] strArr46 = {"\u00d1", "&Ntilde;"};
        String[] strArr47 = {"\u00d2", "&Ograve;"};
        String[] strArr48 = {"\u00d3", "&Oacute;"};
        String[] strArr49 = {"\u00d4", "&Ocirc;"};
        String[] strArr50 = {"\u00d5", "&Otilde;"};
        String[] strArr51 = {"\u00d6", "&Ouml;"};
        String[] strArr52 = {"\u00d7", "&times;"};
        String[] strArr53 = {"\u00d8", "&Oslash;"};
        String[] strArr54 = {"\u00d9", "&Ugrave;"};
        String[] strArr55 = {"\u00da", "&Uacute;"};
        String[] strArr56 = {"\u00db", "&Ucirc;"};
        String[] strArr57 = {"\u00dc", "&Uuml;"};
        String[] strArr58 = {"\u00dd", "&Yacute;"};
        String[] strArr59 = {"\u00df", "&szlig;"};
        String[] strArr60 = {"\u00e0", "&agrave;"};
        String[] strArr61 = {"\u00e1", "&aacute;"};
        String[] strArr62 = {"\u00e3", "&atilde;"};
        String[] strArr63 = {"\u00e5", "&aring;"};
        String[] strArr64 = {"\u00e6", "&aelig;"};
        String[] strArr65 = {"\u00e7", "&ccedil;"};
        String[] strArr66 = {"\u00e8", "&egrave;"};
        String[] strArr67 = {"\u00e9", "&eacute;"};
        String[] strArr68 = {"\u00ea", "&ecirc;"};
        String[] strArr69 = {"\u00eb", "&euml;"};
        String[] strArr70 = {"\u00ed", "&iacute;"};
        String[] strArr71 = {"\u00ee", "&icirc;"};
        String[] strArr72 = {"\u00ef", "&iuml;"};
        String[] strArr73 = {"\u00f0", "&eth;"};
        String[] strArr74 = {"\u00f1", "&ntilde;"};
        String[] strArr75 = {"\u00f2", "&ograve;"};
        String[] strArr76 = {"\u00f3", "&oacute;"};
        String[] strArr77 = {"\u00f4", "&ocirc;"};
        String[] strArr78 = {"\u00f6", "&ouml;"};
        String[] strArr79 = {"\u00f7", "&divide;"};
        String[] strArr80 = {"\u00f8", "&oslash;"};
        String[] strArr81 = {"\u00f9", "&ugrave;"};
        String[] strArr82 = {"\u00fa", "&uacute;"};
        String[] strArr83 = {"\u00fb", "&ucirc;"};
        ISO8859_1_ESCAPE = new String[][]{new String[]{"\u00a0", "&nbsp;"}, new String[]{"\u00a1", "&iexcl;"}, strArr, strArr2, strArr3, strArr4, strArr5, strArr6, strArr7, strArr8, new String[]{"\u00aa", "&ordf;"}, strArr9, strArr10, strArr11, strArr12, strArr13, strArr14, strArr15, strArr16, strArr17, strArr18, strArr19, strArr20, strArr21, strArr22, strArr23, strArr24, strArr25, strArr26, strArr27, strArr28, strArr29, strArr30, strArr31, strArr32, strArr33, strArr34, strArr35, strArr36, strArr37, new String[]{"\u00c8", "&Egrave;"}, strArr38, strArr39, strArr40, strArr41, strArr42, strArr43, strArr44, strArr45, strArr46, strArr47, strArr48, strArr49, strArr50, strArr51, strArr52, strArr53, strArr54, strArr55, strArr56, strArr57, strArr58, new String[]{"\u00de", "&THORN;"}, strArr59, strArr60, strArr61, new String[]{"\u00e2", "&acirc;"}, strArr62, new String[]{"\u00e4", "&auml;"}, strArr63, strArr64, strArr65, strArr66, strArr67, strArr68, strArr69, new String[]{"\u00ec", "&igrave;"}, strArr70, strArr71, strArr72, strArr73, strArr74, strArr75, strArr76, strArr77, new String[]{"\u00f5", "&otilde;"}, strArr78, strArr79, strArr80, strArr81, strArr82, strArr83, new String[]{"\u00fc", "&uuml;"}, new String[]{"\u00fd", "&yacute;"}, new String[]{"\u00fe", "&thorn;"}, new String[]{"\u00ff", "&yuml;"}};
        String[] strArr84 = {"\u0192", "&fnof;"};
        String[] strArr85 = {"\u0391", "&Alpha;"};
        String[] strArr86 = {"\u0392", "&Beta;"};
        String[] strArr87 = {"\u0393", "&Gamma;"};
        String[] strArr88 = {"\u0394", "&Delta;"};
        String[] strArr89 = {"\u0396", "&Zeta;"};
        String[] strArr90 = {"\u0397", "&Eta;"};
        String[] strArr91 = {"\u0398", "&Theta;"};
        String[] strArr92 = {"\u0399", "&Iota;"};
        String[] strArr93 = {"\u039a", "&Kappa;"};
        String[] strArr94 = {"\u039b", "&Lambda;"};
        String[] strArr95 = {"\u039c", "&Mu;"};
        String[] strArr96 = {"\u039d", "&Nu;"};
        String[] strArr97 = {"\u039f", "&Omicron;"};
        String[] strArr98 = {"\u03a0", "&Pi;"};
        String[] strArr99 = {"\u03a1", "&Rho;"};
        String[] strArr100 = {"\u03a3", "&Sigma;"};
        String[] strArr101 = {"\u03a4", "&Tau;"};
        String[] strArr102 = {"\u03a5", "&Upsilon;"};
        String[] strArr103 = {"\u03a6", "&Phi;"};
        String[] strArr104 = {"\u03a7", "&Chi;"};
        String[] strArr105 = {"\u03a8", "&Psi;"};
        String[] strArr106 = {"\u03a9", "&Omega;"};
        String[] strArr107 = {"\u03b1", "&alpha;"};
        String[] strArr108 = {"\u03b2", "&beta;"};
        String[] strArr109 = {"\u03b3", "&gamma;"};
        String[] strArr110 = {"\u03b4", "&delta;"};
        String[] strArr111 = {"\u03b5", "&epsilon;"};
        String[] strArr112 = {"\u03b6", "&zeta;"};
        String[] strArr113 = {"\u03b7", "&eta;"};
        String[] strArr114 = {"\u03b8", "&theta;"};
        String[] strArr115 = {"\u03b9", "&iota;"};
        String[] strArr116 = {"\u03ba", "&kappa;"};
        String[] strArr117 = {"\u03bb", "&lambda;"};
        String[] strArr118 = {"\u03bd", "&nu;"};
        String[] strArr119 = {"\u03bf", "&omicron;"};
        String[] strArr120 = {"\u03c0", "&pi;"};
        String[] strArr121 = {"\u03c2", "&sigmaf;"};
        String[] strArr122 = {"\u03c3", "&sigma;"};
        String[] strArr123 = {"\u03c4", "&tau;"};
        String[] strArr124 = {"\u03c5", "&upsilon;"};
        String[] strArr125 = {"\u03c6", "&phi;"};
        String[] strArr126 = {"\u03c7", "&chi;"};
        String[] strArr127 = {"\u03c8", "&psi;"};
        String[] strArr128 = {"\u03c9", "&omega;"};
        String[] strArr129 = {"\u03d1", "&thetasym;"};
        String[] strArr130 = {"\u03d2", "&upsih;"};
        String[] strArr131 = {"\u03d6", "&piv;"};
        String[] strArr132 = {"\u2022", "&bull;"};
        String[] strArr133 = {"\u2026", "&hellip;"};
        String[] strArr134 = {"\u2032", "&prime;"};
        String[] strArr135 = {"\u2033", "&Prime;"};
        String[] strArr136 = {"\u2044", "&frasl;"};
        String[] strArr137 = {"\u2118", "&weierp;"};
        String[] strArr138 = {"\u2111", "&image;"};
        String[] strArr139 = {"\u211c", "&real;"};
        String[] strArr140 = {"\u2122", "&trade;"};
        String[] strArr141 = {"\u2135", "&alefsym;"};
        String[] strArr142 = {"\u2190", "&larr;"};
        String[] strArr143 = {"\u2191", "&uarr;"};
        String[] strArr144 = {"\u2192", "&rarr;"};
        String[] strArr145 = {"\u2193", "&darr;"};
        String[] strArr146 = {"\u2194", "&harr;"};
        String[] strArr147 = {"\u21b5", "&crarr;"};
        String[] strArr148 = {"\u21d0", "&lArr;"};
        String[] strArr149 = {"\u21d1", "&uArr;"};
        String[] strArr150 = {"\u21d2", "&rArr;"};
        String[] strArr151 = {"\u21d4", "&hArr;"};
        String[] strArr152 = {"\u2200", "&forall;"};
        String[] strArr153 = {"\u2202", "&part;"};
        String[] strArr154 = {"\u2203", "&exist;"};
        String[] strArr155 = {"\u2208", "&isin;"};
        String[] strArr156 = {"\u2209", "&notin;"};
        String[] strArr157 = {"\u220b", "&ni;"};
        String[] strArr158 = {"\u220f", "&prod;"};
        String[] strArr159 = {"\u2211", "&sum;"};
        String[] strArr160 = {"\u2212", "&minus;"};
        String[] strArr161 = {"\u2217", "&lowast;"};
        String[] strArr162 = {"\u221a", "&radic;"};
        String[] strArr163 = {"\u221d", "&prop;"};
        String[] strArr164 = {"\u221e", "&infin;"};
        String[] strArr165 = {"\u2220", "&ang;"};
        String[] strArr166 = {"\u2227", "&and;"};
        String[] strArr167 = {"\u2228", "&or;"};
        String[] strArr168 = {"\u2229", "&cap;"};
        String[] strArr169 = {"\u222a", "&cup;"};
        String[] strArr170 = {"\u222b", "&int;"};
        String[] strArr171 = {"\u2234", "&there4;"};
        String[] strArr172 = {"\u223c", "&sim;"};
        String[] strArr173 = {"\u2245", "&cong;"};
        String[] strArr174 = {"\u2248", "&asymp;"};
        String[] strArr175 = {"\u2260", "&ne;"};
        String[] strArr176 = {"\u2261", "&equiv;"};
        String[] strArr177 = {"\u2264", "&le;"};
        String[] strArr178 = {"\u2265", "&ge;"};
        String[] strArr179 = {"\u2282", "&sub;"};
        String[] strArr180 = {"\u2287", "&supe;"};
        String[] strArr181 = {"\u2295", "&oplus;"};
        String[] strArr182 = {"\u22a5", "&perp;"};
        String[] strArr183 = {"\u22c5", "&sdot;"};
        String[] strArr184 = {"\u2308", "&lceil;"};
        String[] strArr185 = {"\u2309", "&rceil;"};
        String[] strArr186 = {"\u230a", "&lfloor;"};
        String[] strArr187 = {"\u230b", "&rfloor;"};
        String[] strArr188 = {"\u2329", "&lang;"};
        String[] strArr189 = {"\u232a", "&rang;"};
        String[] strArr190 = {"\u25ca", "&loz;"};
        String[] strArr191 = {"\u2660", "&spades;"};
        String[] strArr192 = {"\u2663", "&clubs;"};
        String[] strArr193 = {"\u2665", "&hearts;"};
        String[] strArr194 = {"\u2666", "&diams;"};
        String[] strArr195 = {"\u0152", "&OElig;"};
        String[] strArr196 = {"\u0153", "&oelig;"};
        String[] strArr197 = {"\u0160", "&Scaron;"};
        String[] strArr198 = {"\u02c6", "&circ;"};
        String[] strArr199 = {"\u02dc", "&tilde;"};
        String[] strArr200 = {"\u2002", "&ensp;"};
        String[] strArr201 = {"\u2003", "&emsp;"};
        String[] strArr202 = {"\u2009", "&thinsp;"};
        String[] strArr203 = {"\u200e", "&lrm;"};
        String[] strArr204 = {"\u200f", "&rlm;"};
        String[] strArr205 = {"\u2013", "&ndash;"};
        String[] strArr206 = {"\u2014", "&mdash;"};
        String[] strArr207 = {"\u2019", "&rsquo;"};
        String[] strArr208 = {"\u201c", "&ldquo;"};
        String[] strArr209 = {"\u201d", "&rdquo;"};
        String[] strArr210 = {"\u201e", "&bdquo;"};
        String[] strArr211 = {"\u2020", "&dagger;"};
        String[] strArr212 = {"\u2021", "&Dagger;"};
        String[] strArr213 = {"\u2030", "&permil;"};
        String[] strArr214 = {"\u2039", "&lsaquo;"};
        HTML40_EXTENDED_ESCAPE = new String[][]{strArr84, strArr85, strArr86, strArr87, strArr88, new String[]{"\u0395", "&Epsilon;"}, strArr89, strArr90, strArr91, strArr92, strArr93, strArr94, strArr95, strArr96, new String[]{"\u039e", "&Xi;"}, strArr97, strArr98, strArr99, strArr100, strArr101, strArr102, strArr103, strArr104, strArr105, strArr106, strArr107, strArr108, strArr109, strArr110, strArr111, strArr112, strArr113, strArr114, strArr115, strArr116, strArr117, new String[]{"\u03bc", "&mu;"}, strArr118, new String[]{"\u03be", "&xi;"}, strArr119, strArr120, new String[]{"\u03c1", "&rho;"}, strArr121, strArr122, strArr123, strArr124, strArr125, strArr126, strArr127, strArr128, strArr129, strArr130, strArr131, strArr132, strArr133, strArr134, strArr135, new String[]{"\u203e", "&oline;"}, strArr136, strArr137, strArr138, strArr139, strArr140, strArr141, strArr142, strArr143, strArr144, strArr145, strArr146, strArr147, strArr148, strArr149, strArr150, new String[]{"\u21d3", "&dArr;"}, strArr151, strArr152, strArr153, strArr154, new String[]{"\u2205", "&empty;"}, new String[]{"\u2207", "&nabla;"}, strArr155, strArr156, strArr157, strArr158, strArr159, strArr160, strArr161, strArr162, strArr163, strArr164, strArr165, strArr166, strArr167, strArr168, strArr169, strArr170, strArr171, strArr172, strArr173, strArr174, strArr175, strArr176, strArr177, strArr178, strArr179, new String[]{"\u2283", "&sup;"}, new String[]{"\u2286", "&sube;"}, strArr180, strArr181, new String[]{"\u2297", "&otimes;"}, strArr182, strArr183, strArr184, strArr185, strArr186, strArr187, strArr188, strArr189, strArr190, strArr191, strArr192, strArr193, strArr194, strArr195, strArr196, strArr197, new String[]{"\u0161", "&scaron;"}, new String[]{"\u0178", "&Yuml;"}, strArr198, strArr199, strArr200, strArr201, strArr202, new String[]{"\u200c", "&zwnj;"}, new String[]{"\u200d", "&zwj;"}, strArr203, strArr204, strArr205, strArr206, new String[]{"\u2018", "&lsquo;"}, strArr207, new String[]{"\u201a", "&sbquo;"}, strArr208, strArr209, strArr210, strArr211, strArr212, strArr213, strArr214, new String[]{"\u203a", "&rsaquo;"}, new String[]{"\u20ac", "&euro;"}};
        String[] strArr215 = {"\"", "&quot;"};
        BASIC_ESCAPE = new String[][]{strArr215, new String[]{"&", "&amp;"}, new String[]{"<", "&lt;"}, new String[]{">", "&gt;"}};
    }

    public static String[][] APOS_ESCAPE() {
        return (String[][]) APOS_ESCAPE.clone();
    }

    public static String[][] APOS_UNESCAPE() {
        return (String[][]) APOS_UNESCAPE.clone();
    }

    public static String[][] BASIC_ESCAPE() {
        return (String[][]) BASIC_ESCAPE.clone();
    }

    public static String[][] BASIC_UNESCAPE() {
        return (String[][]) BASIC_UNESCAPE.clone();
    }

    public static String[][] HTML40_EXTENDED_ESCAPE() {
        return (String[][]) HTML40_EXTENDED_ESCAPE.clone();
    }

    public static String[][] HTML40_EXTENDED_UNESCAPE() {
        return (String[][]) HTML40_EXTENDED_UNESCAPE.clone();
    }

    public static String[][] ISO8859_1_ESCAPE() {
        return (String[][]) ISO8859_1_ESCAPE.clone();
    }

    public static String[][] ISO8859_1_UNESCAPE() {
        return (String[][]) ISO8859_1_UNESCAPE.clone();
    }

    public static String[][] JAVA_CTRL_CHARS_ESCAPE() {
        return (String[][]) JAVA_CTRL_CHARS_ESCAPE.clone();
    }

    public static String[][] JAVA_CTRL_CHARS_UNESCAPE() {
        return (String[][]) JAVA_CTRL_CHARS_UNESCAPE.clone();
    }

    public static String[][] invert(String[][] strArr) {
        String[][] strArr2 = (String[][]) Array.newInstance(String.class, new int[]{strArr.length, 2});
        for (int i = 0; i < strArr.length; i++) {
            strArr2[i][0] = strArr[i][1];
            strArr2[i][1] = strArr[i][0];
        }
        return strArr2;
    }
}
