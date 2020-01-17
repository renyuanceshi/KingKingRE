package org.apache.commons.lang.text;

import java.util.Map;

public abstract class StrLookup {
    private static final StrLookup NONE_LOOKUP = new MapStrLookup((Map) null);
    private static final StrLookup SYSTEM_PROPERTIES_LOOKUP;

    static class MapStrLookup extends StrLookup {
        private final Map map;

        MapStrLookup(Map map2) {
            this.map = map2;
        }

        public String lookup(String str) {
            Object obj;
            if (this.map == null || (obj = this.map.get(str)) == null) {
                return null;
            }
            return obj.toString();
        }
    }

    static {
        StrLookup strLookup;
        try {
            strLookup = new MapStrLookup(System.getProperties());
        } catch (SecurityException e) {
            strLookup = NONE_LOOKUP;
        }
        SYSTEM_PROPERTIES_LOOKUP = strLookup;
    }

    protected StrLookup() {
    }

    public static StrLookup mapLookup(Map map) {
        return new MapStrLookup(map);
    }

    public static StrLookup noneLookup() {
        return NONE_LOOKUP;
    }

    public static StrLookup systemPropertiesLookup() {
        return SYSTEM_PROPERTIES_LOOKUP;
    }

    public abstract String lookup(String str);
}
