package com.pccw.android.common.widget;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class ActionBarUtils {
    public static void setHasEmbeddedTabs(Object obj, boolean z) {
        Class cls = obj.getClass();
        if ("android.support.v7.app.ActionBarImplJB".equals(cls.getName())) {
            cls = cls.getSuperclass();
        }
        if ("android.support.v7.app.ActionBarImplJBMR2".equals(cls.getName())) {
            cls = cls.getSuperclass().getSuperclass();
        }
        try {
            Field declaredField = cls.getDeclaredField("mActionBar");
            declaredField.setAccessible(true);
            obj = declaredField.get(obj);
            cls = obj.getClass();
        } catch (IllegalAccessException | IllegalArgumentException | NoSuchFieldException e) {
        }
        try {
            Method declaredMethod = cls.getDeclaredMethod("setHasEmbeddedTabs", new Class[]{Boolean.TYPE});
            declaredMethod.setAccessible(true);
            declaredMethod.invoke(obj, new Object[]{Boolean.valueOf(z)});
        } catch (IllegalAccessException | IllegalArgumentException | NoSuchMethodException | InvocationTargetException e2) {
        }
    }
}
