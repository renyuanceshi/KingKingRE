package com.facebook;

import com.facebook.internal.Logger;
import com.facebook.internal.Utility;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

public class GraphResponse {
    private static final String BODY_KEY = "body";
    private static final String CODE_KEY = "code";
    public static final String NON_JSON_RESPONSE_PROPERTY = "FACEBOOK_NON_JSON_RESULT";
    private static final String RESPONSE_LOG_TAG = "Response";
    public static final String SUCCESS_KEY = "success";
    private final HttpURLConnection connection;
    private final FacebookRequestError error;
    private final JSONObject graphObject;
    private final JSONArray graphObjectArray;
    private final String rawResponse;
    private final GraphRequest request;

    public enum PagingDirection {
        NEXT,
        PREVIOUS
    }

    GraphResponse(GraphRequest graphRequest, HttpURLConnection httpURLConnection, FacebookRequestError facebookRequestError) {
        this(graphRequest, httpURLConnection, (String) null, (JSONObject) null, (JSONArray) null, facebookRequestError);
    }

    GraphResponse(GraphRequest graphRequest, HttpURLConnection httpURLConnection, String str, JSONArray jSONArray) {
        this(graphRequest, httpURLConnection, str, (JSONObject) null, jSONArray, (FacebookRequestError) null);
    }

    GraphResponse(GraphRequest graphRequest, HttpURLConnection httpURLConnection, String str, JSONObject jSONObject) {
        this(graphRequest, httpURLConnection, str, jSONObject, (JSONArray) null, (FacebookRequestError) null);
    }

    GraphResponse(GraphRequest graphRequest, HttpURLConnection httpURLConnection, String str, JSONObject jSONObject, JSONArray jSONArray, FacebookRequestError facebookRequestError) {
        this.request = graphRequest;
        this.connection = httpURLConnection;
        this.rawResponse = str;
        this.graphObject = jSONObject;
        this.graphObjectArray = jSONArray;
        this.error = facebookRequestError;
    }

    static List<GraphResponse> constructErrorResponses(List<GraphRequest> list, HttpURLConnection httpURLConnection, FacebookException facebookException) {
        int size = list.size();
        ArrayList arrayList = new ArrayList(size);
        for (int i = 0; i < size; i++) {
            arrayList.add(new GraphResponse(list.get(i), httpURLConnection, new FacebookRequestError(httpURLConnection, (Exception) facebookException)));
        }
        return arrayList;
    }

    private static GraphResponse createResponseFromObject(GraphRequest graphRequest, HttpURLConnection httpURLConnection, Object obj, Object obj2) throws JSONException {
        if (obj instanceof JSONObject) {
            JSONObject jSONObject = (JSONObject) obj;
            FacebookRequestError checkResponseAndCreateError = FacebookRequestError.checkResponseAndCreateError(jSONObject, obj2, httpURLConnection);
            if (checkResponseAndCreateError != null) {
                if (checkResponseAndCreateError.getErrorCode() == 190 && Utility.isCurrentAccessToken(graphRequest.getAccessToken())) {
                    AccessToken.setCurrentAccessToken((AccessToken) null);
                }
                return new GraphResponse(graphRequest, httpURLConnection, checkResponseAndCreateError);
            }
            Object stringPropertyAsJSON = Utility.getStringPropertyAsJSON(jSONObject, BODY_KEY, NON_JSON_RESPONSE_PROPERTY);
            if (stringPropertyAsJSON instanceof JSONObject) {
                return new GraphResponse(graphRequest, httpURLConnection, stringPropertyAsJSON.toString(), (JSONObject) stringPropertyAsJSON);
            }
            if (stringPropertyAsJSON instanceof JSONArray) {
                return new GraphResponse(graphRequest, httpURLConnection, stringPropertyAsJSON.toString(), (JSONArray) stringPropertyAsJSON);
            }
            obj = JSONObject.NULL;
        }
        if (obj == JSONObject.NULL) {
            return new GraphResponse(graphRequest, httpURLConnection, obj.toString(), (JSONObject) null);
        }
        throw new FacebookException("Got unexpected object type in response, class: " + obj.getClass().getSimpleName());
    }

    private static List<GraphResponse> createResponsesFromObject(HttpURLConnection httpURLConnection, List<GraphRequest> list, Object obj) throws FacebookException, JSONException {
        JSONArray jSONArray;
        int size = list.size();
        ArrayList arrayList = new ArrayList(size);
        if (size == 1) {
            GraphRequest graphRequest = list.get(0);
            try {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put(BODY_KEY, obj);
                jSONObject.put(CODE_KEY, httpURLConnection != null ? httpURLConnection.getResponseCode() : 200);
                JSONArray jSONArray2 = new JSONArray();
                jSONArray2.put(jSONObject);
                jSONArray = jSONArray2;
            } catch (JSONException e) {
                arrayList.add(new GraphResponse(graphRequest, httpURLConnection, new FacebookRequestError(httpURLConnection, (Exception) e)));
                jSONArray = obj;
            } catch (IOException e2) {
                arrayList.add(new GraphResponse(graphRequest, httpURLConnection, new FacebookRequestError(httpURLConnection, (Exception) e2)));
                jSONArray = obj;
            }
        } else {
            jSONArray = obj;
        }
        if (!(jSONArray instanceof JSONArray) || ((JSONArray) jSONArray).length() != size) {
            throw new FacebookException("Unexpected number of results");
        }
        JSONArray jSONArray3 = (JSONArray) jSONArray;
        for (int i = 0; i < jSONArray3.length(); i++) {
            GraphRequest graphRequest2 = list.get(i);
            try {
                arrayList.add(createResponseFromObject(graphRequest2, httpURLConnection, jSONArray3.get(i), obj));
            } catch (JSONException e3) {
                arrayList.add(new GraphResponse(graphRequest2, httpURLConnection, new FacebookRequestError(httpURLConnection, (Exception) e3)));
            } catch (FacebookException e4) {
                arrayList.add(new GraphResponse(graphRequest2, httpURLConnection, new FacebookRequestError(httpURLConnection, (Exception) e4)));
            }
        }
        return arrayList;
    }

    static List<GraphResponse> createResponsesFromStream(InputStream inputStream, HttpURLConnection httpURLConnection, GraphRequestBatch graphRequestBatch) throws FacebookException, JSONException, IOException {
        String readStreamToString = Utility.readStreamToString(inputStream);
        Logger.log(LoggingBehavior.INCLUDE_RAW_RESPONSES, RESPONSE_LOG_TAG, "Response (raw)\n  Size: %d\n  Response:\n%s\n", Integer.valueOf(readStreamToString.length()), readStreamToString);
        return createResponsesFromString(readStreamToString, httpURLConnection, graphRequestBatch);
    }

    static List<GraphResponse> createResponsesFromString(String str, HttpURLConnection httpURLConnection, GraphRequestBatch graphRequestBatch) throws FacebookException, JSONException, IOException {
        List<GraphResponse> createResponsesFromObject = createResponsesFromObject(httpURLConnection, graphRequestBatch, new JSONTokener(str).nextValue());
        Logger.log(LoggingBehavior.REQUESTS, RESPONSE_LOG_TAG, "Response\n  Id: %s\n  Size: %d\n  Responses:\n%s\n", graphRequestBatch.getId(), Integer.valueOf(str.length()), createResponsesFromObject);
        return createResponsesFromObject;
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:17:0x0036=Splitter:B:17:0x0036, B:12:0x001d=Splitter:B:12:0x001d} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    static java.util.List<com.facebook.GraphResponse> fromHttpConnection(java.net.HttpURLConnection r7, com.facebook.GraphRequestBatch r8) {
        /*
            r2 = 0
            int r0 = r7.getResponseCode()     // Catch:{ FacebookException -> 0x001b, Exception -> 0x0034 }
            r1 = 400(0x190, float:5.6E-43)
            if (r0 < r1) goto L_0x0016
            java.io.InputStream r0 = r7.getErrorStream()     // Catch:{ FacebookException -> 0x001b, Exception -> 0x0034 }
        L_0x000d:
            java.util.List r1 = createResponsesFromStream(r0, r7, r8)     // Catch:{ FacebookException -> 0x005e, Exception -> 0x005b, all -> 0x0058 }
            com.facebook.internal.Utility.closeQuietly(r0)
            r0 = r1
        L_0x0015:
            return r0
        L_0x0016:
            java.io.InputStream r0 = r7.getInputStream()     // Catch:{ FacebookException -> 0x001b, Exception -> 0x0034 }
            goto L_0x000d
        L_0x001b:
            r0 = move-exception
            r1 = r0
        L_0x001d:
            com.facebook.LoggingBehavior r0 = com.facebook.LoggingBehavior.REQUESTS     // Catch:{ all -> 0x0052 }
            java.lang.String r3 = "Response"
            java.lang.String r4 = "Response <Error>: %s"
            r5 = 1
            java.lang.Object[] r5 = new java.lang.Object[r5]     // Catch:{ all -> 0x0052 }
            r6 = 0
            r5[r6] = r1     // Catch:{ all -> 0x0052 }
            com.facebook.internal.Logger.log((com.facebook.LoggingBehavior) r0, (java.lang.String) r3, (java.lang.String) r4, (java.lang.Object[]) r5)     // Catch:{ all -> 0x0052 }
            java.util.List r0 = constructErrorResponses(r8, r7, r1)     // Catch:{ all -> 0x0052 }
            com.facebook.internal.Utility.closeQuietly(r2)
            goto L_0x0015
        L_0x0034:
            r0 = move-exception
            r1 = r0
        L_0x0036:
            com.facebook.LoggingBehavior r0 = com.facebook.LoggingBehavior.REQUESTS     // Catch:{ all -> 0x0052 }
            java.lang.String r3 = "Response"
            java.lang.String r4 = "Response <Error>: %s"
            r5 = 1
            java.lang.Object[] r5 = new java.lang.Object[r5]     // Catch:{ all -> 0x0052 }
            r6 = 0
            r5[r6] = r1     // Catch:{ all -> 0x0052 }
            com.facebook.internal.Logger.log((com.facebook.LoggingBehavior) r0, (java.lang.String) r3, (java.lang.String) r4, (java.lang.Object[]) r5)     // Catch:{ all -> 0x0052 }
            com.facebook.FacebookException r0 = new com.facebook.FacebookException     // Catch:{ all -> 0x0052 }
            r0.<init>((java.lang.Throwable) r1)     // Catch:{ all -> 0x0052 }
            java.util.List r0 = constructErrorResponses(r8, r7, r0)     // Catch:{ all -> 0x0052 }
            com.facebook.internal.Utility.closeQuietly(r2)
            goto L_0x0015
        L_0x0052:
            r0 = move-exception
            r1 = r0
        L_0x0054:
            com.facebook.internal.Utility.closeQuietly(r2)
            throw r1
        L_0x0058:
            r1 = move-exception
            r2 = r0
            goto L_0x0054
        L_0x005b:
            r1 = move-exception
            r2 = r0
            goto L_0x0036
        L_0x005e:
            r1 = move-exception
            r2 = r0
            goto L_0x001d
        */
        throw new UnsupportedOperationException("Method not decompiled: com.facebook.GraphResponse.fromHttpConnection(java.net.HttpURLConnection, com.facebook.GraphRequestBatch):java.util.List");
    }

    public final HttpURLConnection getConnection() {
        return this.connection;
    }

    public final FacebookRequestError getError() {
        return this.error;
    }

    public final JSONArray getJSONArray() {
        return this.graphObjectArray;
    }

    public final JSONObject getJSONObject() {
        return this.graphObject;
    }

    public String getRawResponse() {
        return this.rawResponse;
    }

    public GraphRequest getRequest() {
        return this.request;
    }

    public GraphRequest getRequestForPagedResults(PagingDirection pagingDirection) {
        JSONObject optJSONObject;
        String optString = (this.graphObject == null || (optJSONObject = this.graphObject.optJSONObject("paging")) == null) ? null : pagingDirection == PagingDirection.NEXT ? optJSONObject.optString("next") : optJSONObject.optString("previous");
        if (Utility.isNullOrEmpty(optString)) {
            return null;
        }
        if (optString != null && optString.equals(this.request.getUrlForSingleRequest())) {
            return null;
        }
        try {
            return new GraphRequest(this.request.getAccessToken(), new URL(optString));
        } catch (MalformedURLException e) {
            return null;
        }
    }

    public String toString() {
        String str;
        try {
            str = String.format(Locale.US, "%d", new Object[]{Integer.valueOf(this.connection != null ? this.connection.getResponseCode() : 200)});
        } catch (IOException e) {
            str = "unknown";
        }
        return "{Response: " + " responseCode: " + str + ", graphObject: " + this.graphObject + ", error: " + this.error + "}";
    }
}
