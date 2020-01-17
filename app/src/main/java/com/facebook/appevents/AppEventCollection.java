package com.facebook.appevents;

import android.content.Context;
import com.facebook.FacebookSdk;
import com.facebook.internal.AttributionIdentifiers;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

class AppEventCollection {
    private final HashMap<AccessTokenAppIdPair, SessionEventsState> stateMap = new HashMap<>();

    private SessionEventsState getSessionEventsState(AccessTokenAppIdPair accessTokenAppIdPair) {
        SessionEventsState sessionEventsState;
        synchronized (this) {
            sessionEventsState = this.stateMap.get(accessTokenAppIdPair);
            if (sessionEventsState == null) {
                Context applicationContext = FacebookSdk.getApplicationContext();
                sessionEventsState = new SessionEventsState(AttributionIdentifiers.getAttributionIdentifiers(applicationContext), AppEventsLogger.getAnonymousAppDeviceGUID(applicationContext));
            }
            this.stateMap.put(accessTokenAppIdPair, sessionEventsState);
        }
        return sessionEventsState;
    }

    public void addEvent(AccessTokenAppIdPair accessTokenAppIdPair, AppEvent appEvent) {
        synchronized (this) {
            getSessionEventsState(accessTokenAppIdPair).addEvent(appEvent);
        }
    }

    public void addPersistedEvents(PersistedEvents persistedEvents) {
        synchronized (this) {
            if (persistedEvents != null) {
                for (AccessTokenAppIdPair next : persistedEvents.keySet()) {
                    SessionEventsState sessionEventsState = getSessionEventsState(next);
                    for (AppEvent addEvent : persistedEvents.get(next)) {
                        sessionEventsState.addEvent(addEvent);
                    }
                }
            }
        }
    }

    public SessionEventsState get(AccessTokenAppIdPair accessTokenAppIdPair) {
        SessionEventsState sessionEventsState;
        synchronized (this) {
            sessionEventsState = this.stateMap.get(accessTokenAppIdPair);
        }
        return sessionEventsState;
    }

    public int getEventCount() {
        int i;
        synchronized (this) {
            int i2 = 0;
            Iterator<SessionEventsState> it = this.stateMap.values().iterator();
            while (true) {
                i = i2;
                if (it.hasNext()) {
                    i2 = it.next().getAccumulatedEventCount() + i;
                }
            }
        }
        return i;
    }

    public Set<AccessTokenAppIdPair> keySet() {
        Set<AccessTokenAppIdPair> keySet;
        synchronized (this) {
            keySet = this.stateMap.keySet();
        }
        return keySet;
    }
}
