package org.apache.commons.lang.p000enum;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import org.apache.commons.lang.ClassUtils;
import org.apache.commons.lang.StringUtils;

/* renamed from: org.apache.commons.lang.enum.Enum  reason: invalid package */
public abstract class Enum implements Comparable, Serializable {
    private static final Map EMPTY_MAP = Collections.unmodifiableMap(new HashMap(0));
    private static Map cEnumClasses = new WeakHashMap();
    static Class class$org$apache$commons$lang$enum$Enum = null;
    static Class class$org$apache$commons$lang$enum$ValuedEnum = null;
    private static final long serialVersionUID = -487045951170455942L;
    private final transient int iHashCode;
    private final String iName;
    protected transient String iToString = null;

    /* renamed from: org.apache.commons.lang.enum.Enum$Entry */
    private static class Entry {
        final List list = new ArrayList(25);
        final Map map = new HashMap();
        final List unmodifiableList = Collections.unmodifiableList(this.list);
        final Map unmodifiableMap = Collections.unmodifiableMap(this.map);

        protected Entry() {
        }
    }

    protected Enum(String str) {
        init(str);
        this.iName = str;
        this.iHashCode = getEnumClass().hashCode() + 7 + (str.hashCode() * 3);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError(e.getMessage());
        }
    }

    private static Entry createEntry(Class cls) {
        Class cls2;
        Class cls3;
        Entry entry = new Entry();
        Class superclass = cls.getSuperclass();
        while (true) {
            if (superclass == null) {
                break;
            }
            if (class$org$apache$commons$lang$enum$Enum == null) {
                cls2 = class$("org.apache.commons.lang.enum.Enum");
                class$org$apache$commons$lang$enum$Enum = cls2;
            } else {
                cls2 = class$org$apache$commons$lang$enum$Enum;
            }
            if (superclass == cls2) {
                break;
            }
            if (class$org$apache$commons$lang$enum$ValuedEnum == null) {
                cls3 = class$("org.apache.commons.lang.enum.ValuedEnum");
                class$org$apache$commons$lang$enum$ValuedEnum = cls3;
            } else {
                cls3 = class$org$apache$commons$lang$enum$ValuedEnum;
            }
            if (superclass == cls3) {
                break;
            }
            Entry entry2 = (Entry) cEnumClasses.get(superclass);
            if (entry2 != null) {
                entry.list.addAll(entry2.list);
                entry.map.putAll(entry2.map);
                break;
            }
            superclass = superclass.getSuperclass();
        }
        return entry;
    }

    private static Entry getEntry(Class cls) {
        Class cls2;
        if (cls == null) {
            throw new IllegalArgumentException("The Enum Class must not be null");
        }
        if (class$org$apache$commons$lang$enum$Enum == null) {
            cls2 = class$("org.apache.commons.lang.enum.Enum");
            class$org$apache$commons$lang$enum$Enum = cls2;
        } else {
            cls2 = class$org$apache$commons$lang$enum$Enum;
        }
        if (!cls2.isAssignableFrom(cls)) {
            throw new IllegalArgumentException("The Class must be a subclass of Enum");
        }
        Entry entry = (Entry) cEnumClasses.get(cls);
        if (entry != null) {
            return entry;
        }
        try {
            Class.forName(cls.getName(), true, cls.getClassLoader());
            return (Entry) cEnumClasses.get(cls);
        } catch (Exception e) {
            return entry;
        }
    }

    protected static Enum getEnum(Class cls, String str) {
        Entry entry = getEntry(cls);
        if (entry == null) {
            return null;
        }
        return (Enum) entry.map.get(str);
    }

    protected static List getEnumList(Class cls) {
        Entry entry = getEntry(cls);
        return entry == null ? Collections.EMPTY_LIST : entry.unmodifiableList;
    }

    protected static Map getEnumMap(Class cls) {
        Entry entry = getEntry(cls);
        return entry == null ? EMPTY_MAP : entry.unmodifiableMap;
    }

    private String getNameInOtherClassLoader(Object obj) {
        try {
            return (String) obj.getClass().getMethod("getName", (Class[]) null).invoke(obj, (Object[]) null);
        } catch (IllegalAccessException | NoSuchMethodException | InvocationTargetException e) {
            throw new IllegalStateException("This should not happen");
        }
    }

    private void init(String str) {
        Class cls;
        Entry entry;
        Class<?> cls2;
        Class<?> cls3;
        if (StringUtils.isEmpty(str)) {
            throw new IllegalArgumentException("The Enum name must not be empty or null");
        }
        Class<?> enumClass = getEnumClass();
        if (enumClass == null) {
            throw new IllegalArgumentException("getEnumClass() must not be null");
        }
        boolean z = false;
        Class<? super Object> cls4 = getClass();
        while (true) {
            if (cls4 == null) {
                break;
            }
            if (class$org$apache$commons$lang$enum$Enum == null) {
                cls2 = class$("org.apache.commons.lang.enum.Enum");
                class$org$apache$commons$lang$enum$Enum = cls2;
            } else {
                cls2 = class$org$apache$commons$lang$enum$Enum;
            }
            if (cls4 == cls2) {
                break;
            }
            if (class$org$apache$commons$lang$enum$ValuedEnum == null) {
                cls3 = class$("org.apache.commons.lang.enum.ValuedEnum");
                class$org$apache$commons$lang$enum$ValuedEnum = cls3;
            } else {
                cls3 = class$org$apache$commons$lang$enum$ValuedEnum;
            }
            if (cls4 == cls3) {
                break;
            } else if (cls4 == enumClass) {
                z = true;
                break;
            } else {
                cls4 = cls4.getSuperclass();
            }
        }
        if (!z) {
            throw new IllegalArgumentException("getEnumClass() must return a superclass of this class");
        }
        if (class$org$apache$commons$lang$enum$Enum == null) {
            Class class$ = class$("org.apache.commons.lang.enum.Enum");
            class$org$apache$commons$lang$enum$Enum = class$;
            cls = class$;
        } else {
            cls = class$org$apache$commons$lang$enum$Enum;
        }
        synchronized (cls) {
            entry = (Entry) cEnumClasses.get(enumClass);
            if (entry == null) {
                entry = createEntry(enumClass);
                WeakHashMap weakHashMap = new WeakHashMap();
                weakHashMap.putAll(cEnumClasses);
                weakHashMap.put(enumClass, entry);
                cEnumClasses = weakHashMap;
            }
        }
        if (entry.map.containsKey(str)) {
            throw new IllegalArgumentException(new StringBuffer().append("The Enum name must be unique, '").append(str).append("' has already been added").toString());
        }
        entry.map.put(str, this);
        entry.list.add(this);
    }

    protected static Iterator iterator(Class cls) {
        return getEnumList(cls).iterator();
    }

    public int compareTo(Object obj) {
        if (obj == this) {
            return 0;
        }
        if (obj.getClass() == getClass()) {
            return this.iName.compareTo(((Enum) obj).iName);
        }
        if (obj.getClass().getName().equals(getClass().getName())) {
            return this.iName.compareTo(getNameInOtherClassLoader(obj));
        }
        throw new ClassCastException(new StringBuffer().append("Different enum class '").append(ClassUtils.getShortClassName((Class) obj.getClass())).append("'").toString());
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (obj.getClass() == getClass()) {
            return this.iName.equals(((Enum) obj).iName);
        }
        if (obj.getClass().getName().equals(getClass().getName())) {
            return this.iName.equals(getNameInOtherClassLoader(obj));
        }
        return false;
    }

    public Class getEnumClass() {
        return getClass();
    }

    public final String getName() {
        return this.iName;
    }

    public final int hashCode() {
        return this.iHashCode;
    }

    /* access modifiers changed from: protected */
    public Object readResolve() {
        Entry entry = (Entry) cEnumClasses.get(getEnumClass());
        if (entry == null) {
            return null;
        }
        return entry.map.get(getName());
    }

    public String toString() {
        if (this.iToString == null) {
            this.iToString = new StringBuffer().append(ClassUtils.getShortClassName(getEnumClass())).append("[").append(getName()).append("]").toString();
        }
        return this.iToString;
    }
}
