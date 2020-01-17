package com.facebook.appevents;

import android.content.Context;
import android.os.Bundle;
import com.facebook.GraphRequest;
import com.facebook.internal.AppEventsLoggerUtility;
import com.facebook.internal.AttributionIdentifiers;
import com.facebook.internal.Utility;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class SessionEventsState {
    private final int MAX_ACCUMULATED_LOG_EVENTS = 1000;
    private List<AppEvent> accumulatedEvents = new ArrayList();
    private String anonymousAppDeviceGUID;
    private AttributionIdentifiers attributionIdentifiers;
    private List<AppEvent> inFlightEvents = new ArrayList();
    private int numSkippedEventsDueToFullBuffer;

    public SessionEventsState(AttributionIdentifiers attributionIdentifiers2, String str) {
        this.attributionIdentifiers = attributionIdentifiers2;
        this.anonymousAppDeviceGUID = str;
    }

    private byte[] getStringAsByteArray(String str) {
        try {
            return str.getBytes("UTF-8");
        } catch (UnsupportedEncodingException e) {
            Utility.logd("Encoding exception: ", (Exception) e);
            return null;
        }
    }

    private void populateRequest(GraphRequest graphRequest, Context context, int i, JSONArray jSONArray, boolean z) {
        JSONObject jSONObject;
        try {
            jSONObject = AppEventsLoggerUtility.getJSONObjectForGraphAPICall(AppEventsLoggerUtility.GraphAPIActivityType.CUSTOM_APP_EVENTS, this.attributionIdentifiers, this.anonymousAppDeviceGUID, z, context);
            if (this.numSkippedEventsDueToFullBuffer > 0) {
                jSONObject.put("num_skipped_events", i);
            }
        } catch (JSONException e) {
            jSONObject = new JSONObject();
        }
        graphRequest.setGraphObject(jSONObject);
        Bundle parameters = graphRequest.getParameters();
        if (parameters == null) {
            parameters = new Bundle();
        }
        String jSONArray2 = jSONArray.toString();
        if (jSONArray2 != null) {
            parameters.putByteArray("custom_events_file", getStringAsByteArray(jSONArray2));
            graphRequest.setTag(jSONArray2);
        }
        graphRequest.setParameters(parameters);
    }

    public void accumulatePersistedEvents(List<AppEvent> list) {
        synchronized (this) {
            this.accumulatedEvents.addAll(list);
        }
    }

    public void addEvent(AppEvent appEvent) {
        synchronized (this) {
            if (this.accumulatedEvents.size() + this.inFlightEvents.size() >= 1000) {
                this.numSkippedEventsDueToFullBuffer++;
            } else {
                this.accumulatedEvents.add(appEvent);
            }
        }
    }

    public void clearInFlightAndStats(boolean z) {
        synchronized (this) {
            if (z) {
                this.accumulatedEvents.addAll(this.inFlightEvents);
            }
            this.inFlightEvents.clear();
            this.numSkippedEventsDueToFullBuffer = 0;
        }
    }

    public int getAccumulatedEventCount() {
        int size;
        synchronized (this) {
            size = this.accumulatedEvents.size();
        }
        return size;
    }

    public List<AppEvent> getEventsToPersist() {
        List<AppEvent> list;
        synchronized (this) {
            list = this.accumulatedEvents;
            this.accumulatedEvents = new ArrayList();
        }
        return list;
    }

    public int populateRequest(GraphRequest graphRequest, Context context, boolean z, boolean z2) {
        synchronized (this) {
            int i = this.numSkippedEventsDueToFullBuffer;
            this.inFlightEvents.addAll(this.accumulatedEvents);
            this.accumulatedEvents.clear();
            JSONArray jSONArray = new JSONArray();
            for (AppEvent next : this.inFlightEvents) {
                if (!next.isChecksumValid()) {
                    Utility.logd("Event with invalid checksum: %s", next.toString());
                } else if (z || !next.getIsImplicit()) {
                    jSONArray.put(next.getJSONObject());
                }
            }
            if (jSONArray.length() == 0) {
                return 0;
            }
            populateRequest(graphRequest, context, i, jSONArray, z2);
            return jSONArray.length();
        }
    }
}
