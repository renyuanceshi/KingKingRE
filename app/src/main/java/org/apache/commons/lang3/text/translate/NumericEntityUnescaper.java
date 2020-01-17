package org.apache.commons.lang3.text.translate;

import java.io.IOException;
import java.io.Writer;
import java.util.Arrays;
import java.util.EnumSet;

public class NumericEntityUnescaper extends CharSequenceTranslator {
    private final EnumSet<OPTION> options;

    public enum OPTION {
        semiColonRequired,
        semiColonOptional,
        errorIfNoSemiColon
    }

    public NumericEntityUnescaper(OPTION... optionArr) {
        if (optionArr.length > 0) {
            this.options = EnumSet.copyOf(Arrays.asList(optionArr));
            return;
        }
        this.options = EnumSet.copyOf(Arrays.asList(new OPTION[]{OPTION.semiColonRequired}));
    }

    public boolean isSet(OPTION option) {
        if (this.options == null) {
            return false;
        }
        return this.options.contains(option);
    }

    public int translate(CharSequence charSequence, int i, Writer writer) throws IOException {
        boolean z;
        int parseInt;
        int i2 = 1;
        int length = charSequence.length();
        if (charSequence.charAt(i) != '&' || i >= length - 2 || charSequence.charAt(i + 1) != '#') {
            return 0;
        }
        int i3 = i + 2;
        char charAt = charSequence.charAt(i3);
        if (charAt == 'x' || charAt == 'X') {
            i3++;
            if (i3 == length) {
                return 0;
            }
            z = true;
        } else {
            z = false;
        }
        int i4 = i3;
        while (i4 < length && ((charSequence.charAt(i4) >= '0' && charSequence.charAt(i4) <= '9') || ((charSequence.charAt(i4) >= 'a' && charSequence.charAt(i4) <= 'f') || (charSequence.charAt(i4) >= 'A' && charSequence.charAt(i4) <= 'F')))) {
            i4++;
        }
        boolean z2 = i4 != length && charSequence.charAt(i4) == ';';
        if (!z2) {
            if (isSet(OPTION.semiColonRequired)) {
                return 0;
            }
            if (isSet(OPTION.errorIfNoSemiColon)) {
                throw new IllegalArgumentException("Semi-colon required at end of numeric entity");
            }
        }
        if (z) {
            try {
                parseInt = Integer.parseInt(charSequence.subSequence(i3, i4).toString(), 16);
            } catch (NumberFormatException e) {
                return 0;
            }
        } else {
            parseInt = Integer.parseInt(charSequence.subSequence(i3, i4).toString(), 10);
        }
        if (parseInt > 65535) {
            char[] chars = Character.toChars(parseInt);
            writer.write(chars[0]);
            writer.write(chars[1]);
        } else {
            writer.write(parseInt);
        }
        int i5 = z ? 1 : 0;
        if (!z2) {
            i2 = 0;
        }
        return i2 + i5 + ((i4 + 2) - i3);
    }
}
