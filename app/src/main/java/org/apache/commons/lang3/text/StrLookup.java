package org.apache.commons.lang3.text;

import java.util.Map;

public abstract class StrLookup<V> {
    private static final StrLookup<String> NONE_LOOKUP = new MapStrLookup((Map) null);
    private static final StrLookup<String> SYSTEM_PROPERTIES_LOOKUP;

    static class MapStrLookup<V> extends StrLookup<V> {
        private final Map<String, V> map;

        MapStrLookup(Map<String, V> map2) {
            this.map = map2;
        }

        public String lookup(String str) {
            V v;
            if (this.map == null || (v = this.map.get(str)) == null) {
                return null;
            }
            return v.toString();
        }
    }

    static {
        StrLookup<String> strLookup;
        try {
            strLookup = new MapStrLookup<>(System.getProperties());
        } catch (SecurityException e) {
            strLookup = NONE_LOOKUP;
        }
        SYSTEM_PROPERTIES_LOOKUP = strLookup;
    }

    protected StrLookup() {
    }

    public static <V> StrLookup<V> mapLookup(Map<String, V> map) {
        return new MapStrLookup(map);
    }

    public static StrLookup<?> noneLookup() {
        return NONE_LOOKUP;
    }

    public static StrLookup<String> systemPropertiesLookup() {
        return SYSTEM_PROPERTIES_LOOKUP;
    }

    public abstract String lookup(String str);
}
