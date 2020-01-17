package org.apache.commons.lang3.text.translate;

import android.support.v7.widget.ActivityChooserView;
import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;

public class LookupTranslator extends CharSequenceTranslator {
    private final int longest;
    private final HashMap<String, CharSequence> lookupMap = new HashMap<>();
    private final int shortest;

    public LookupTranslator(CharSequence[]... charSequenceArr) {
        int i;
        int i2 = ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED;
        if (charSequenceArr != null) {
            int length = charSequenceArr.length;
            int i3 = 0;
            i = 0;
            int i4 = Integer.MAX_VALUE;
            while (i3 < length) {
                CharSequence[] charSequenceArr2 = charSequenceArr[i3];
                this.lookupMap.put(charSequenceArr2[0].toString(), charSequenceArr2[1]);
                int length2 = charSequenceArr2[0].length();
                i4 = length2 < i4 ? length2 : i4;
                if (length2 <= i) {
                    length2 = i;
                }
                i3++;
                i = length2;
            }
            i2 = i4;
        } else {
            i = 0;
        }
        this.shortest = i2;
        this.longest = i;
    }

    public int translate(CharSequence charSequence, int i, Writer writer) throws IOException {
        int i2 = this.longest;
        if (this.longest + i > charSequence.length()) {
            i2 = charSequence.length() - i;
        }
        while (true) {
            int i3 = i2;
            if (i3 < this.shortest) {
                return 0;
            }
            CharSequence charSequence2 = this.lookupMap.get(charSequence.subSequence(i, i + i3).toString());
            if (charSequence2 != null) {
                writer.write(charSequence2.toString());
                return i3;
            }
            i2 = i3 - 1;
        }
    }
}
