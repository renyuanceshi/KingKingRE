package android.support.v4.view.accessibility;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.view.accessibility.AccessibilityManager;

@TargetApi(19)
@RequiresApi(19)
class AccessibilityManagerCompatKitKat {

    interface TouchExplorationStateChangeListenerBridge {
        void onTouchExplorationStateChanged(boolean z);
    }

    public static class TouchExplorationStateChangeListenerWrapper implements AccessibilityManager.TouchExplorationStateChangeListener {
        final Object mListener;
        final TouchExplorationStateChangeListenerBridge mListenerBridge;

        public TouchExplorationStateChangeListenerWrapper(Object obj, TouchExplorationStateChangeListenerBridge touchExplorationStateChangeListenerBridge) {
            this.mListener = obj;
            this.mListenerBridge = touchExplorationStateChangeListenerBridge;
        }

        public boolean equals(Object obj) {
            if (this != obj) {
                if (obj == null || getClass() != obj.getClass()) {
                    return false;
                }
                TouchExplorationStateChangeListenerWrapper touchExplorationStateChangeListenerWrapper = (TouchExplorationStateChangeListenerWrapper) obj;
                if (this.mListener != null) {
                    return this.mListener.equals(touchExplorationStateChangeListenerWrapper.mListener);
                }
                if (touchExplorationStateChangeListenerWrapper.mListener != null) {
                    return false;
                }
            }
            return true;
        }

        public int hashCode() {
            if (this.mListener == null) {
                return 0;
            }
            return this.mListener.hashCode();
        }

        public void onTouchExplorationStateChanged(boolean z) {
            this.mListenerBridge.onTouchExplorationStateChanged(z);
        }
    }

    AccessibilityManagerCompatKitKat() {
    }

    public static boolean addTouchExplorationStateChangeListener(AccessibilityManager accessibilityManager, Object obj) {
        return accessibilityManager.addTouchExplorationStateChangeListener((AccessibilityManager.TouchExplorationStateChangeListener) obj);
    }

    public static Object newTouchExplorationStateChangeListener(final TouchExplorationStateChangeListenerBridge touchExplorationStateChangeListenerBridge) {
        return new AccessibilityManager.TouchExplorationStateChangeListener() {
            public void onTouchExplorationStateChanged(boolean z) {
                touchExplorationStateChangeListenerBridge.onTouchExplorationStateChanged(z);
            }
        };
    }

    public static boolean removeTouchExplorationStateChangeListener(AccessibilityManager accessibilityManager, Object obj) {
        return accessibilityManager.removeTouchExplorationStateChangeListener((AccessibilityManager.TouchExplorationStateChangeListener) obj);
    }
}
