package org.apache.commons.lang.text;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

public class StrSubstitutor {
    public static final char DEFAULT_ESCAPE = '$';
    public static final StrMatcher DEFAULT_PREFIX = StrMatcher.stringMatcher("${");
    public static final StrMatcher DEFAULT_SUFFIX = StrMatcher.stringMatcher("}");
    private char escapeChar;
    private StrMatcher prefixMatcher;
    private StrMatcher suffixMatcher;
    private StrLookup variableResolver;

    public StrSubstitutor() {
        this((StrLookup) null, DEFAULT_PREFIX, DEFAULT_SUFFIX, '$');
    }

    public StrSubstitutor(Map map) {
        this(StrLookup.mapLookup(map), DEFAULT_PREFIX, DEFAULT_SUFFIX, '$');
    }

    public StrSubstitutor(Map map, String str, String str2) {
        this(StrLookup.mapLookup(map), str, str2, '$');
    }

    public StrSubstitutor(Map map, String str, String str2, char c) {
        this(StrLookup.mapLookup(map), str, str2, c);
    }

    public StrSubstitutor(StrLookup strLookup) {
        this(strLookup, DEFAULT_PREFIX, DEFAULT_SUFFIX, '$');
    }

    public StrSubstitutor(StrLookup strLookup, String str, String str2, char c) {
        setVariableResolver(strLookup);
        setVariablePrefix(str);
        setVariableSuffix(str2);
        setEscapeChar(c);
    }

    public StrSubstitutor(StrLookup strLookup, StrMatcher strMatcher, StrMatcher strMatcher2, char c) {
        setVariableResolver(strLookup);
        setVariablePrefixMatcher(strMatcher);
        setVariableSuffixMatcher(strMatcher2);
        setEscapeChar(c);
    }

    private void checkCyclicSubstitution(String str, List list) {
        if (list.contains(str)) {
            StrBuilder strBuilder = new StrBuilder(256);
            strBuilder.append("Infinite loop in property interpolation of ");
            strBuilder.append(list.remove(0));
            strBuilder.append(": ");
            strBuilder.appendWithSeparators((Collection) list, "->");
            throw new IllegalStateException(strBuilder.toString());
        }
    }

    public static String replace(Object obj, Map map) {
        return new StrSubstitutor(map).replace(obj);
    }

    public static String replace(Object obj, Map map, String str, String str2) {
        return new StrSubstitutor(map, str, str2).replace(obj);
    }

    public static String replaceSystemProperties(Object obj) {
        return new StrSubstitutor(StrLookup.systemPropertiesLookup()).replace(obj);
    }

    private int substitute(StrBuilder strBuilder, int i, int i2, List list) {
        StrMatcher variablePrefixMatcher = getVariablePrefixMatcher();
        StrMatcher variableSuffixMatcher = getVariableSuffixMatcher();
        char escapeChar2 = getEscapeChar();
        boolean z = list == null;
        boolean z2 = false;
        int i3 = 0;
        char[] cArr = strBuilder.buffer;
        int i4 = i + i2;
        List list2 = list;
        int i5 = i;
        while (i5 < i4) {
            int isMatch = variablePrefixMatcher.isMatch(cArr, i5, i, i4);
            if (isMatch == 0) {
                i5++;
            } else if (i5 <= i || cArr[i5 - 1] != escapeChar2) {
                int i6 = i5 + isMatch;
                while (true) {
                    if (i6 >= i4) {
                        i5 = i6;
                        break;
                    }
                    int isMatch2 = variableSuffixMatcher.isMatch(cArr, i6, i, i4);
                    if (isMatch2 == 0) {
                        i6++;
                    } else {
                        String str = new String(cArr, i5 + isMatch, (i6 - i5) - isMatch);
                        int i7 = i6 + isMatch2;
                        if (list2 == null) {
                            list2 = new ArrayList();
                            list2.add(new String(cArr, i, i2));
                        }
                        checkCyclicSubstitution(str, list2);
                        list2.add(str);
                        String resolveVariable = resolveVariable(str, strBuilder, i5, i7);
                        if (resolveVariable != null) {
                            int length = resolveVariable.length();
                            strBuilder.replace(i5, i7, resolveVariable);
                            z2 = true;
                            int substitute = (length - (i7 - i5)) + substitute(strBuilder, i5, length, list2);
                            i7 += substitute;
                            i4 += substitute;
                            i3 += substitute;
                            cArr = strBuilder.buffer;
                        }
                        list2.remove(list2.size() - 1);
                        i5 = i7;
                    }
                }
            } else {
                strBuilder.deleteCharAt(i5 - 1);
                cArr = strBuilder.buffer;
                i3--;
                z2 = true;
                i4--;
            }
        }
        return z ? z2 ? 1 : 0 : i3;
    }

    public char getEscapeChar() {
        return this.escapeChar;
    }

    public StrMatcher getVariablePrefixMatcher() {
        return this.prefixMatcher;
    }

    public StrLookup getVariableResolver() {
        return this.variableResolver;
    }

    public StrMatcher getVariableSuffixMatcher() {
        return this.suffixMatcher;
    }

    public String replace(Object obj) {
        if (obj == null) {
            return null;
        }
        StrBuilder append = new StrBuilder().append(obj);
        substitute(append, 0, append.length());
        return append.toString();
    }

    public String replace(String str) {
        if (str == null) {
            return null;
        }
        StrBuilder strBuilder = new StrBuilder(str);
        return substitute(strBuilder, 0, str.length()) ? strBuilder.toString() : str;
    }

    public String replace(String str, int i, int i2) {
        if (str == null) {
            return null;
        }
        StrBuilder append = new StrBuilder(i2).append(str, i, i2);
        return !substitute(append, 0, i2) ? str.substring(i, i + i2) : append.toString();
    }

    public String replace(StringBuffer stringBuffer) {
        if (stringBuffer == null) {
            return null;
        }
        StrBuilder append = new StrBuilder(stringBuffer.length()).append(stringBuffer);
        substitute(append, 0, append.length());
        return append.toString();
    }

    public String replace(StringBuffer stringBuffer, int i, int i2) {
        if (stringBuffer == null) {
            return null;
        }
        StrBuilder append = new StrBuilder(i2).append(stringBuffer, i, i2);
        substitute(append, 0, i2);
        return append.toString();
    }

    public String replace(StrBuilder strBuilder) {
        if (strBuilder == null) {
            return null;
        }
        StrBuilder append = new StrBuilder(strBuilder.length()).append(strBuilder);
        substitute(append, 0, append.length());
        return append.toString();
    }

    public String replace(StrBuilder strBuilder, int i, int i2) {
        if (strBuilder == null) {
            return null;
        }
        StrBuilder append = new StrBuilder(i2).append(strBuilder, i, i2);
        substitute(append, 0, i2);
        return append.toString();
    }

    public String replace(char[] cArr) {
        if (cArr == null) {
            return null;
        }
        StrBuilder append = new StrBuilder(cArr.length).append(cArr);
        substitute(append, 0, cArr.length);
        return append.toString();
    }

    public String replace(char[] cArr, int i, int i2) {
        if (cArr == null) {
            return null;
        }
        StrBuilder append = new StrBuilder(i2).append(cArr, i, i2);
        substitute(append, 0, i2);
        return append.toString();
    }

    public boolean replaceIn(StringBuffer stringBuffer) {
        if (stringBuffer == null) {
            return false;
        }
        return replaceIn(stringBuffer, 0, stringBuffer.length());
    }

    public boolean replaceIn(StringBuffer stringBuffer, int i, int i2) {
        if (stringBuffer == null) {
            return false;
        }
        StrBuilder append = new StrBuilder(i2).append(stringBuffer, i, i2);
        if (!substitute(append, 0, i2)) {
            return false;
        }
        stringBuffer.replace(i, i + i2, append.toString());
        return true;
    }

    public boolean replaceIn(StrBuilder strBuilder) {
        if (strBuilder == null) {
            return false;
        }
        return substitute(strBuilder, 0, strBuilder.length());
    }

    public boolean replaceIn(StrBuilder strBuilder, int i, int i2) {
        if (strBuilder == null) {
            return false;
        }
        return substitute(strBuilder, i, i2);
    }

    /* access modifiers changed from: protected */
    public String resolveVariable(String str, StrBuilder strBuilder, int i, int i2) {
        StrLookup variableResolver2 = getVariableResolver();
        if (variableResolver2 == null) {
            return null;
        }
        return variableResolver2.lookup(str);
    }

    public void setEscapeChar(char c) {
        this.escapeChar = (char) c;
    }

    public StrSubstitutor setVariablePrefix(char c) {
        return setVariablePrefixMatcher(StrMatcher.charMatcher(c));
    }

    public StrSubstitutor setVariablePrefix(String str) {
        if (str != null) {
            return setVariablePrefixMatcher(StrMatcher.stringMatcher(str));
        }
        throw new IllegalArgumentException("Variable prefix must not be null!");
    }

    public StrSubstitutor setVariablePrefixMatcher(StrMatcher strMatcher) {
        if (strMatcher == null) {
            throw new IllegalArgumentException("Variable prefix matcher must not be null!");
        }
        this.prefixMatcher = strMatcher;
        return this;
    }

    public void setVariableResolver(StrLookup strLookup) {
        this.variableResolver = strLookup;
    }

    public StrSubstitutor setVariableSuffix(char c) {
        return setVariableSuffixMatcher(StrMatcher.charMatcher(c));
    }

    public StrSubstitutor setVariableSuffix(String str) {
        if (str != null) {
            return setVariableSuffixMatcher(StrMatcher.stringMatcher(str));
        }
        throw new IllegalArgumentException("Variable suffix must not be null!");
    }

    public StrSubstitutor setVariableSuffixMatcher(StrMatcher strMatcher) {
        if (strMatcher == null) {
            throw new IllegalArgumentException("Variable suffix matcher must not be null!");
        }
        this.suffixMatcher = strMatcher;
        return this;
    }

    /* access modifiers changed from: protected */
    public boolean substitute(StrBuilder strBuilder, int i, int i2) {
        return substitute(strBuilder, i, i2, (List) null) > 0;
    }
}
