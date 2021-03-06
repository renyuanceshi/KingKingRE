package android.support.v4.widget;

import android.os.Build;
import android.support.v4.view.GravityCompat;
import android.support.v4.view.ViewCompat;
import android.view.View;
import android.widget.PopupWindow;
import java.lang.reflect.Method;

public final class PopupWindowCompat {
    static final PopupWindowImpl IMPL;

    static class Api21PopupWindowImpl extends KitKatPopupWindowImpl {
        Api21PopupWindowImpl() {
        }

        public boolean getOverlapAnchor(PopupWindow popupWindow) {
            return PopupWindowCompatApi21.getOverlapAnchor(popupWindow);
        }

        public void setOverlapAnchor(PopupWindow popupWindow, boolean z) {
            PopupWindowCompatApi21.setOverlapAnchor(popupWindow, z);
        }
    }

    static class Api23PopupWindowImpl extends Api21PopupWindowImpl {
        Api23PopupWindowImpl() {
        }

        public boolean getOverlapAnchor(PopupWindow popupWindow) {
            return PopupWindowCompatApi23.getOverlapAnchor(popupWindow);
        }

        public int getWindowLayoutType(PopupWindow popupWindow) {
            return PopupWindowCompatApi23.getWindowLayoutType(popupWindow);
        }

        public void setOverlapAnchor(PopupWindow popupWindow, boolean z) {
            PopupWindowCompatApi23.setOverlapAnchor(popupWindow, z);
        }

        public void setWindowLayoutType(PopupWindow popupWindow, int i) {
            PopupWindowCompatApi23.setWindowLayoutType(popupWindow, i);
        }
    }

    static class BasePopupWindowImpl implements PopupWindowImpl {
        private static Method sGetWindowLayoutTypeMethod;
        private static boolean sGetWindowLayoutTypeMethodAttempted;
        private static Method sSetWindowLayoutTypeMethod;
        private static boolean sSetWindowLayoutTypeMethodAttempted;

        BasePopupWindowImpl() {
        }

        public boolean getOverlapAnchor(PopupWindow popupWindow) {
            return false;
        }

        public int getWindowLayoutType(PopupWindow popupWindow) {
            if (!sGetWindowLayoutTypeMethodAttempted) {
                try {
                    sGetWindowLayoutTypeMethod = PopupWindow.class.getDeclaredMethod("getWindowLayoutType", new Class[0]);
                    sGetWindowLayoutTypeMethod.setAccessible(true);
                } catch (Exception e) {
                }
                sGetWindowLayoutTypeMethodAttempted = true;
            }
            if (sGetWindowLayoutTypeMethod != null) {
                try {
                    return ((Integer) sGetWindowLayoutTypeMethod.invoke(popupWindow, new Object[0])).intValue();
                } catch (Exception e2) {
                }
            }
            return 0;
        }

        public void setOverlapAnchor(PopupWindow popupWindow, boolean z) {
        }

        public void setWindowLayoutType(PopupWindow popupWindow, int i) {
            if (!sSetWindowLayoutTypeMethodAttempted) {
                Class<PopupWindow> cls = PopupWindow.class;
                try {
                    sSetWindowLayoutTypeMethod = cls.getDeclaredMethod("setWindowLayoutType", new Class[]{Integer.TYPE});
                    sSetWindowLayoutTypeMethod.setAccessible(true);
                } catch (Exception e) {
                }
                sSetWindowLayoutTypeMethodAttempted = true;
            }
            if (sSetWindowLayoutTypeMethod != null) {
                try {
                    sSetWindowLayoutTypeMethod.invoke(popupWindow, new Object[]{Integer.valueOf(i)});
                } catch (Exception e2) {
                }
            }
        }

        public void showAsDropDown(PopupWindow popupWindow, View view, int i, int i2, int i3) {
            if ((GravityCompat.getAbsoluteGravity(i3, ViewCompat.getLayoutDirection(view)) & 7) == 5) {
                i -= popupWindow.getWidth() - view.getWidth();
            }
            popupWindow.showAsDropDown(view, i, i2);
        }
    }

    static class KitKatPopupWindowImpl extends BasePopupWindowImpl {
        KitKatPopupWindowImpl() {
        }

        public void showAsDropDown(PopupWindow popupWindow, View view, int i, int i2, int i3) {
            PopupWindowCompatKitKat.showAsDropDown(popupWindow, view, i, i2, i3);
        }
    }

    interface PopupWindowImpl {
        boolean getOverlapAnchor(PopupWindow popupWindow);

        int getWindowLayoutType(PopupWindow popupWindow);

        void setOverlapAnchor(PopupWindow popupWindow, boolean z);

        void setWindowLayoutType(PopupWindow popupWindow, int i);

        void showAsDropDown(PopupWindow popupWindow, View view, int i, int i2, int i3);
    }

    static {
        int i = Build.VERSION.SDK_INT;
        if (i >= 23) {
            IMPL = new Api23PopupWindowImpl();
        } else if (i >= 21) {
            IMPL = new Api21PopupWindowImpl();
        } else if (i >= 19) {
            IMPL = new KitKatPopupWindowImpl();
        } else {
            IMPL = new BasePopupWindowImpl();
        }
    }

    private PopupWindowCompat() {
    }

    public static boolean getOverlapAnchor(PopupWindow popupWindow) {
        return IMPL.getOverlapAnchor(popupWindow);
    }

    public static int getWindowLayoutType(PopupWindow popupWindow) {
        return IMPL.getWindowLayoutType(popupWindow);
    }

    public static void setOverlapAnchor(PopupWindow popupWindow, boolean z) {
        IMPL.setOverlapAnchor(popupWindow, z);
    }

    public static void setWindowLayoutType(PopupWindow popupWindow, int i) {
        IMPL.setWindowLayoutType(popupWindow, i);
    }

    public static void showAsDropDown(PopupWindow popupWindow, View view, int i, int i2, int i3) {
        IMPL.showAsDropDown(popupWindow, view, i, i2, i3);
    }
}
