package com.facebook;

import org.apache.commons.lang3.StringUtils;

public class FacebookGraphResponseException extends FacebookException {
    private final GraphResponse graphResponse;

    public FacebookGraphResponseException(GraphResponse graphResponse2, String str) {
        super(str);
        this.graphResponse = graphResponse2;
    }

    public final GraphResponse getGraphResponse() {
        return this.graphResponse;
    }

    public final String toString() {
        FacebookRequestError error = this.graphResponse != null ? this.graphResponse.getError() : null;
        StringBuilder append = new StringBuilder().append("{FacebookGraphResponseException: ");
        String message = getMessage();
        if (message != null) {
            append.append(message);
            append.append(StringUtils.SPACE);
        }
        if (error != null) {
            append.append("httpResponseCode: ").append(error.getRequestStatusCode()).append(", facebookErrorCode: ").append(error.getErrorCode()).append(", facebookErrorType: ").append(error.getErrorType()).append(", message: ").append(error.getErrorMessage()).append("}");
        }
        return append.toString();
    }
}
