package com.facebook.appevents;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

class PersistedEvents implements Serializable {
    private static final long serialVersionUID = 20160629001L;
    private HashMap<AccessTokenAppIdPair, List<AppEvent>> events = new HashMap<>();

    static class SerializationProxyV1 implements Serializable {
        private static final long serialVersionUID = 20160629001L;
        private final HashMap<AccessTokenAppIdPair, List<AppEvent>> proxyEvents;

        private SerializationProxyV1(HashMap<AccessTokenAppIdPair, List<AppEvent>> hashMap) {
            this.proxyEvents = hashMap;
        }

        private Object readResolve() {
            return new PersistedEvents(this.proxyEvents);
        }
    }

    public PersistedEvents() {
    }

    public PersistedEvents(HashMap<AccessTokenAppIdPair, List<AppEvent>> hashMap) {
        this.events.putAll(hashMap);
    }

    private Object writeReplace() {
        return new SerializationProxyV1(this.events);
    }

    public void addEvents(AccessTokenAppIdPair accessTokenAppIdPair, List<AppEvent> list) {
        if (!this.events.containsKey(accessTokenAppIdPair)) {
            this.events.put(accessTokenAppIdPair, list);
        } else {
            this.events.get(accessTokenAppIdPair).addAll(list);
        }
    }

    public boolean containsKey(AccessTokenAppIdPair accessTokenAppIdPair) {
        return this.events.containsKey(accessTokenAppIdPair);
    }

    public List<AppEvent> get(AccessTokenAppIdPair accessTokenAppIdPair) {
        return this.events.get(accessTokenAppIdPair);
    }

    public Set<AccessTokenAppIdPair> keySet() {
        return this.events.keySet();
    }
}
