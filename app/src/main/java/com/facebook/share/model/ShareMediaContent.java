package com.facebook.share.model;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.facebook.share.model.ShareContent;
import com.facebook.share.model.SharePhoto;
import com.facebook.share.model.ShareVideo;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public final class ShareMediaContent extends ShareContent<ShareMediaContent, Builder> {
    public static final Parcelable.Creator<ShareMediaContent> CREATOR = new Parcelable.Creator<ShareMediaContent>() {
        public ShareMediaContent createFromParcel(Parcel parcel) {
            return new ShareMediaContent(parcel);
        }

        public ShareMediaContent[] newArray(int i) {
            return new ShareMediaContent[i];
        }
    };
    private final List<ShareMedia> media;

    public static class Builder extends ShareContent.Builder<ShareMediaContent, Builder> {
        /* access modifiers changed from: private */
        public final List<ShareMedia> media = new ArrayList();

        public Builder addMedia(@Nullable List<ShareMedia> list) {
            if (list != null) {
                for (ShareMedia addMedium : list) {
                    addMedium(addMedium);
                }
            }
            return this;
        }

        public Builder addMedium(@Nullable ShareMedia shareMedia) {
            Object build;
            if (shareMedia != null) {
                if (shareMedia instanceof SharePhoto) {
                    build = new SharePhoto.Builder().readFrom((SharePhoto) shareMedia).build();
                } else if (shareMedia instanceof ShareVideo) {
                    build = new ShareVideo.Builder().readFrom((ShareVideo) shareMedia).build();
                } else {
                    throw new IllegalArgumentException("medium must be either a SharePhoto or ShareVideo");
                }
                this.media.add(build);
            }
            return this;
        }

        public ShareMediaContent build() {
            return new ShareMediaContent(this);
        }

        public Builder readFrom(ShareMediaContent shareMediaContent) {
            return shareMediaContent == null ? this : ((Builder) super.readFrom(shareMediaContent)).addMedia(shareMediaContent.getMedia());
        }

        public Builder setMedia(@Nullable List<ShareMedia> list) {
            this.media.clear();
            addMedia(list);
            return this;
        }
    }

    ShareMediaContent(Parcel parcel) {
        super(parcel);
        this.media = Arrays.asList((ShareMedia[]) parcel.readParcelableArray(ShareMedia.class.getClassLoader()));
    }

    private ShareMediaContent(Builder builder) {
        super((ShareContent.Builder) builder);
        this.media = Collections.unmodifiableList(builder.media);
    }

    public int describeContents() {
        return 0;
    }

    @Nullable
    public List<ShareMedia> getMedia() {
        return this.media;
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeParcelableArray((ShareMedia[]) this.media.toArray(), i);
    }
}
