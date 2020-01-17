package android.support.v7.app;

import android.annotation.TargetApi;
import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.content.res.ColorStateList;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.RequiresApi;
import android.support.annotation.RestrictTo;
import android.support.v4.app.BundleCompat;
import android.support.v4.app.NotificationBuilderWithBuilderAccessor;
import android.support.v4.app.NotificationCompat;
import android.support.v4.media.session.MediaSessionCompat;
import android.support.v4.text.BidiFormatter;
import android.support.v4.view.ViewCompat;
import android.support.v7.appcompat.R;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.TextAppearanceSpan;
import android.widget.RemoteViews;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.StringUtils;

public class NotificationCompat extends android.support.v4.app.NotificationCompat {

    private static class Api24Extender extends NotificationCompat.BuilderExtender {
        private Api24Extender() {
        }

        public Notification build(NotificationCompat.Builder builder, NotificationBuilderWithBuilderAccessor notificationBuilderWithBuilderAccessor) {
            NotificationCompat.addStyleToBuilderApi24(notificationBuilderWithBuilderAccessor, builder);
            return notificationBuilderWithBuilderAccessor.build();
        }
    }

    public static class Builder extends NotificationCompat.Builder {
        public Builder(Context context) {
            super(context);
        }

        /* access modifiers changed from: protected */
        @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
        public NotificationCompat.BuilderExtender getExtender() {
            return Build.VERSION.SDK_INT >= 24 ? new Api24Extender() : Build.VERSION.SDK_INT >= 21 ? new LollipopExtender() : Build.VERSION.SDK_INT >= 16 ? new JellybeanExtender() : Build.VERSION.SDK_INT >= 14 ? new IceCreamSandwichExtender() : super.getExtender();
        }

        /* access modifiers changed from: protected */
        @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
        public CharSequence resolveText() {
            if (this.mStyle instanceof NotificationCompat.MessagingStyle) {
                NotificationCompat.MessagingStyle messagingStyle = (NotificationCompat.MessagingStyle) this.mStyle;
                NotificationCompat.MessagingStyle.Message access$000 = NotificationCompat.findLatestIncomingMessage(messagingStyle);
                CharSequence conversationTitle = messagingStyle.getConversationTitle();
                if (access$000 != null) {
                    return conversationTitle != null ? NotificationCompat.makeMessageLine(this, messagingStyle, access$000) : access$000.getText();
                }
            }
            return super.resolveText();
        }

        /* access modifiers changed from: protected */
        @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
        public CharSequence resolveTitle() {
            if (this.mStyle instanceof NotificationCompat.MessagingStyle) {
                NotificationCompat.MessagingStyle messagingStyle = (NotificationCompat.MessagingStyle) this.mStyle;
                NotificationCompat.MessagingStyle.Message access$000 = NotificationCompat.findLatestIncomingMessage(messagingStyle);
                CharSequence conversationTitle = messagingStyle.getConversationTitle();
                if (!(conversationTitle == null && access$000 == null)) {
                    return conversationTitle != null ? conversationTitle : access$000.getSender();
                }
            }
            return super.resolveTitle();
        }
    }

    public static class DecoratedCustomViewStyle extends NotificationCompat.Style {
    }

    public static class DecoratedMediaCustomViewStyle extends MediaStyle {
    }

    private static class IceCreamSandwichExtender extends NotificationCompat.BuilderExtender {
        IceCreamSandwichExtender() {
        }

        public Notification build(NotificationCompat.Builder builder, NotificationBuilderWithBuilderAccessor notificationBuilderWithBuilderAccessor) {
            RemoteViews access$300 = NotificationCompat.addStyleGetContentViewIcs(notificationBuilderWithBuilderAccessor, builder);
            Notification build = notificationBuilderWithBuilderAccessor.build();
            if (access$300 != null) {
                build.contentView = access$300;
            } else if (builder.getContentView() != null) {
                build.contentView = builder.getContentView();
            }
            return build;
        }
    }

    private static class JellybeanExtender extends NotificationCompat.BuilderExtender {
        JellybeanExtender() {
        }

        public Notification build(NotificationCompat.Builder builder, NotificationBuilderWithBuilderAccessor notificationBuilderWithBuilderAccessor) {
            RemoteViews access$400 = NotificationCompat.addStyleGetContentViewJellybean(notificationBuilderWithBuilderAccessor, builder);
            Notification build = notificationBuilderWithBuilderAccessor.build();
            if (access$400 != null) {
                build.contentView = access$400;
            }
            NotificationCompat.addBigStyleToBuilderJellybean(build, builder);
            return build;
        }
    }

    private static class LollipopExtender extends NotificationCompat.BuilderExtender {
        LollipopExtender() {
        }

        public Notification build(NotificationCompat.Builder builder, NotificationBuilderWithBuilderAccessor notificationBuilderWithBuilderAccessor) {
            RemoteViews access$600 = NotificationCompat.addStyleGetContentViewLollipop(notificationBuilderWithBuilderAccessor, builder);
            Notification build = notificationBuilderWithBuilderAccessor.build();
            if (access$600 != null) {
                build.contentView = access$600;
            }
            NotificationCompat.addBigStyleToBuilderLollipop(build, builder);
            NotificationCompat.addHeadsUpToBuilderLollipop(build, builder);
            return build;
        }
    }

    public static class MediaStyle extends NotificationCompat.Style {
        int[] mActionsToShowInCompact = null;
        PendingIntent mCancelButtonIntent;
        boolean mShowCancelButton;
        MediaSessionCompat.Token mToken;

        public MediaStyle() {
        }

        public MediaStyle(NotificationCompat.Builder builder) {
            setBuilder(builder);
        }

        public MediaStyle setCancelButtonIntent(PendingIntent pendingIntent) {
            this.mCancelButtonIntent = pendingIntent;
            return this;
        }

        public MediaStyle setMediaSession(MediaSessionCompat.Token token) {
            this.mToken = token;
            return this;
        }

        public MediaStyle setShowActionsInCompactView(int... iArr) {
            this.mActionsToShowInCompact = iArr;
            return this;
        }

        public MediaStyle setShowCancelButton(boolean z) {
            this.mShowCancelButton = z;
            return this;
        }
    }

    /* access modifiers changed from: private */
    @TargetApi(16)
    @RequiresApi(16)
    public static void addBigStyleToBuilderJellybean(Notification notification, NotificationCompat.Builder builder) {
        if (builder.mStyle instanceof MediaStyle) {
            MediaStyle mediaStyle = (MediaStyle) builder.mStyle;
            RemoteViews bigContentView = builder.getBigContentView() != null ? builder.getBigContentView() : builder.getContentView();
            boolean z = (builder.mStyle instanceof DecoratedMediaCustomViewStyle) && bigContentView != null;
            NotificationCompatImplBase.overrideMediaBigContentView(notification, builder.mContext, builder.mContentTitle, builder.mContentText, builder.mContentInfo, builder.mNumber, builder.mLargeIcon, builder.mSubText, builder.mUseChronometer, builder.getWhenIfShowing(), builder.getPriority(), 0, builder.mActions, mediaStyle.mShowCancelButton, mediaStyle.mCancelButtonIntent, z);
            if (z) {
                NotificationCompatImplBase.buildIntoRemoteViews(builder.mContext, notification.bigContentView, bigContentView);
            }
        } else if (builder.mStyle instanceof DecoratedCustomViewStyle) {
            addDecoratedBigStyleToBuilderJellybean(notification, builder);
        }
    }

    /* access modifiers changed from: private */
    @TargetApi(21)
    @RequiresApi(21)
    public static void addBigStyleToBuilderLollipop(Notification notification, NotificationCompat.Builder builder) {
        RemoteViews bigContentView = builder.getBigContentView() != null ? builder.getBigContentView() : builder.getContentView();
        if ((builder.mStyle instanceof DecoratedMediaCustomViewStyle) && bigContentView != null) {
            NotificationCompatImplBase.overrideMediaBigContentView(notification, builder.mContext, builder.mContentTitle, builder.mContentText, builder.mContentInfo, builder.mNumber, builder.mLargeIcon, builder.mSubText, builder.mUseChronometer, builder.getWhenIfShowing(), builder.getPriority(), 0, builder.mActions, false, (PendingIntent) null, true);
            NotificationCompatImplBase.buildIntoRemoteViews(builder.mContext, notification.bigContentView, bigContentView);
            setBackgroundColor(builder.mContext, notification.bigContentView, builder.getColor());
        } else if (builder.mStyle instanceof DecoratedCustomViewStyle) {
            addDecoratedBigStyleToBuilderJellybean(notification, builder);
        }
    }

    @TargetApi(16)
    @RequiresApi(16)
    private static void addDecoratedBigStyleToBuilderJellybean(Notification notification, NotificationCompat.Builder builder) {
        RemoteViews bigContentView = builder.getBigContentView();
        if (bigContentView == null) {
            bigContentView = builder.getContentView();
        }
        if (bigContentView != null) {
            RemoteViews applyStandardTemplateWithActions = NotificationCompatImplBase.applyStandardTemplateWithActions(builder.mContext, builder.mContentTitle, builder.mContentText, builder.mContentInfo, builder.mNumber, notification.icon, builder.mLargeIcon, builder.mSubText, builder.mUseChronometer, builder.getWhenIfShowing(), builder.getPriority(), builder.getColor(), R.layout.notification_template_custom_big, false, builder.mActions);
            NotificationCompatImplBase.buildIntoRemoteViews(builder.mContext, applyStandardTemplateWithActions, bigContentView);
            notification.bigContentView = applyStandardTemplateWithActions;
        }
    }

    @TargetApi(21)
    @RequiresApi(21)
    private static void addDecoratedHeadsUpToBuilderLollipop(Notification notification, NotificationCompat.Builder builder) {
        RemoteViews headsUpContentView = builder.getHeadsUpContentView();
        RemoteViews contentView = headsUpContentView != null ? headsUpContentView : builder.getContentView();
        if (headsUpContentView != null) {
            RemoteViews applyStandardTemplateWithActions = NotificationCompatImplBase.applyStandardTemplateWithActions(builder.mContext, builder.mContentTitle, builder.mContentText, builder.mContentInfo, builder.mNumber, notification.icon, builder.mLargeIcon, builder.mSubText, builder.mUseChronometer, builder.getWhenIfShowing(), builder.getPriority(), builder.getColor(), R.layout.notification_template_custom_big, false, builder.mActions);
            NotificationCompatImplBase.buildIntoRemoteViews(builder.mContext, applyStandardTemplateWithActions, contentView);
            notification.headsUpContentView = applyStandardTemplateWithActions;
        }
    }

    /* access modifiers changed from: private */
    @TargetApi(21)
    @RequiresApi(21)
    public static void addHeadsUpToBuilderLollipop(Notification notification, NotificationCompat.Builder builder) {
        RemoteViews headsUpContentView = builder.getHeadsUpContentView() != null ? builder.getHeadsUpContentView() : builder.getContentView();
        if ((builder.mStyle instanceof DecoratedMediaCustomViewStyle) && headsUpContentView != null) {
            notification.headsUpContentView = NotificationCompatImplBase.generateMediaBigView(builder.mContext, builder.mContentTitle, builder.mContentText, builder.mContentInfo, builder.mNumber, builder.mLargeIcon, builder.mSubText, builder.mUseChronometer, builder.getWhenIfShowing(), builder.getPriority(), 0, builder.mActions, false, (PendingIntent) null, true);
            NotificationCompatImplBase.buildIntoRemoteViews(builder.mContext, notification.headsUpContentView, headsUpContentView);
            setBackgroundColor(builder.mContext, notification.headsUpContentView, builder.getColor());
        } else if (builder.mStyle instanceof DecoratedCustomViewStyle) {
            addDecoratedHeadsUpToBuilderLollipop(notification, builder);
        }
    }

    private static void addMessagingFallBackStyle(NotificationCompat.MessagingStyle messagingStyle, NotificationBuilderWithBuilderAccessor notificationBuilderWithBuilderAccessor, NotificationCompat.Builder builder) {
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        List<NotificationCompat.MessagingStyle.Message> messages = messagingStyle.getMessages();
        boolean z = messagingStyle.getConversationTitle() != null || hasMessagesWithoutSender(messagingStyle.getMessages());
        for (int size = messages.size() - 1; size >= 0; size--) {
            NotificationCompat.MessagingStyle.Message message = messages.get(size);
            CharSequence makeMessageLine = z ? makeMessageLine(builder, messagingStyle, message) : message.getText();
            if (size != messages.size() - 1) {
                spannableStringBuilder.insert(0, StringUtils.LF);
            }
            spannableStringBuilder.insert(0, makeMessageLine);
        }
        NotificationCompatImplJellybean.addBigTextStyle(notificationBuilderWithBuilderAccessor, spannableStringBuilder);
    }

    /* access modifiers changed from: private */
    @TargetApi(14)
    @RequiresApi(14)
    public static RemoteViews addStyleGetContentViewIcs(NotificationBuilderWithBuilderAccessor notificationBuilderWithBuilderAccessor, NotificationCompat.Builder builder) {
        if (builder.mStyle instanceof MediaStyle) {
            MediaStyle mediaStyle = (MediaStyle) builder.mStyle;
            boolean z = (builder.mStyle instanceof DecoratedMediaCustomViewStyle) && builder.getContentView() != null;
            RemoteViews overrideContentViewMedia = NotificationCompatImplBase.overrideContentViewMedia(notificationBuilderWithBuilderAccessor, builder.mContext, builder.mContentTitle, builder.mContentText, builder.mContentInfo, builder.mNumber, builder.mLargeIcon, builder.mSubText, builder.mUseChronometer, builder.getWhenIfShowing(), builder.getPriority(), builder.mActions, mediaStyle.mActionsToShowInCompact, mediaStyle.mShowCancelButton, mediaStyle.mCancelButtonIntent, z);
            if (z) {
                NotificationCompatImplBase.buildIntoRemoteViews(builder.mContext, overrideContentViewMedia, builder.getContentView());
                return overrideContentViewMedia;
            }
        } else if (builder.mStyle instanceof DecoratedCustomViewStyle) {
            return getDecoratedContentView(builder);
        }
        return null;
    }

    /* access modifiers changed from: private */
    @TargetApi(16)
    @RequiresApi(16)
    public static RemoteViews addStyleGetContentViewJellybean(NotificationBuilderWithBuilderAccessor notificationBuilderWithBuilderAccessor, NotificationCompat.Builder builder) {
        if (builder.mStyle instanceof NotificationCompat.MessagingStyle) {
            addMessagingFallBackStyle((NotificationCompat.MessagingStyle) builder.mStyle, notificationBuilderWithBuilderAccessor, builder);
        }
        return addStyleGetContentViewIcs(notificationBuilderWithBuilderAccessor, builder);
    }

    /* access modifiers changed from: private */
    @TargetApi(21)
    @RequiresApi(21)
    public static RemoteViews addStyleGetContentViewLollipop(NotificationBuilderWithBuilderAccessor notificationBuilderWithBuilderAccessor, NotificationCompat.Builder builder) {
        if (!(builder.mStyle instanceof MediaStyle)) {
            return builder.mStyle instanceof DecoratedCustomViewStyle ? getDecoratedContentView(builder) : addStyleGetContentViewJellybean(notificationBuilderWithBuilderAccessor, builder);
        }
        MediaStyle mediaStyle = (MediaStyle) builder.mStyle;
        NotificationCompatImpl21.addMediaStyle(notificationBuilderWithBuilderAccessor, mediaStyle.mActionsToShowInCompact, mediaStyle.mToken != null ? mediaStyle.mToken.getToken() : null);
        boolean z = builder.getContentView() != null;
        boolean z2 = z || ((Build.VERSION.SDK_INT >= 21 && Build.VERSION.SDK_INT <= 23) && builder.getBigContentView() != null);
        if (!(builder.mStyle instanceof DecoratedMediaCustomViewStyle) || !z2) {
            return null;
        }
        RemoteViews overrideContentViewMedia = NotificationCompatImplBase.overrideContentViewMedia(notificationBuilderWithBuilderAccessor, builder.mContext, builder.mContentTitle, builder.mContentText, builder.mContentInfo, builder.mNumber, builder.mLargeIcon, builder.mSubText, builder.mUseChronometer, builder.getWhenIfShowing(), builder.getPriority(), builder.mActions, mediaStyle.mActionsToShowInCompact, false, (PendingIntent) null, z);
        if (z) {
            NotificationCompatImplBase.buildIntoRemoteViews(builder.mContext, overrideContentViewMedia, builder.getContentView());
        }
        setBackgroundColor(builder.mContext, overrideContentViewMedia, builder.getColor());
        return overrideContentViewMedia;
    }

    /* access modifiers changed from: private */
    @TargetApi(24)
    @RequiresApi(24)
    public static void addStyleToBuilderApi24(NotificationBuilderWithBuilderAccessor notificationBuilderWithBuilderAccessor, NotificationCompat.Builder builder) {
        if (builder.mStyle instanceof DecoratedCustomViewStyle) {
            NotificationCompatImpl24.addDecoratedCustomViewStyle(notificationBuilderWithBuilderAccessor);
        } else if (builder.mStyle instanceof DecoratedMediaCustomViewStyle) {
            NotificationCompatImpl24.addDecoratedMediaCustomViewStyle(notificationBuilderWithBuilderAccessor);
        } else if (!(builder.mStyle instanceof NotificationCompat.MessagingStyle)) {
            addStyleGetContentViewLollipop(notificationBuilderWithBuilderAccessor, builder);
        }
    }

    /* access modifiers changed from: private */
    public static NotificationCompat.MessagingStyle.Message findLatestIncomingMessage(NotificationCompat.MessagingStyle messagingStyle) {
        List<NotificationCompat.MessagingStyle.Message> messages = messagingStyle.getMessages();
        for (int size = messages.size() - 1; size >= 0; size--) {
            NotificationCompat.MessagingStyle.Message message = messages.get(size);
            if (!TextUtils.isEmpty(message.getSender())) {
                return message;
            }
        }
        if (!messages.isEmpty()) {
            return messages.get(messages.size() - 1);
        }
        return null;
    }

    private static RemoteViews getDecoratedContentView(NotificationCompat.Builder builder) {
        if (builder.getContentView() == null) {
            return null;
        }
        RemoteViews applyStandardTemplateWithActions = NotificationCompatImplBase.applyStandardTemplateWithActions(builder.mContext, builder.mContentTitle, builder.mContentText, builder.mContentInfo, builder.mNumber, builder.mNotification.icon, builder.mLargeIcon, builder.mSubText, builder.mUseChronometer, builder.getWhenIfShowing(), builder.getPriority(), builder.getColor(), R.layout.notification_template_custom_big, false, (ArrayList<NotificationCompat.Action>) null);
        NotificationCompatImplBase.buildIntoRemoteViews(builder.mContext, applyStandardTemplateWithActions, builder.getContentView());
        return applyStandardTemplateWithActions;
    }

    public static MediaSessionCompat.Token getMediaSession(Notification notification) {
        Bundle extras = getExtras(notification);
        if (extras != null) {
            if (Build.VERSION.SDK_INT >= 21) {
                Parcelable parcelable = extras.getParcelable(android.support.v4.app.NotificationCompat.EXTRA_MEDIA_SESSION);
                if (parcelable != null) {
                    return MediaSessionCompat.Token.fromToken(parcelable);
                }
            } else {
                IBinder binder = BundleCompat.getBinder(extras, android.support.v4.app.NotificationCompat.EXTRA_MEDIA_SESSION);
                if (binder != null) {
                    Parcel obtain = Parcel.obtain();
                    obtain.writeStrongBinder(binder);
                    obtain.setDataPosition(0);
                    MediaSessionCompat.Token createFromParcel = MediaSessionCompat.Token.CREATOR.createFromParcel(obtain);
                    obtain.recycle();
                    return createFromParcel;
                }
            }
        }
        return null;
    }

    private static boolean hasMessagesWithoutSender(List<NotificationCompat.MessagingStyle.Message> list) {
        for (int size = list.size() - 1; size >= 0; size--) {
            if (list.get(size).getSender() == null) {
                return true;
            }
        }
        return false;
    }

    private static TextAppearanceSpan makeFontColorSpan(int i) {
        return new TextAppearanceSpan((String) null, 0, 0, ColorStateList.valueOf(i), (ColorStateList) null);
    }

    /* access modifiers changed from: private */
    public static CharSequence makeMessageLine(NotificationCompat.Builder builder, NotificationCompat.MessagingStyle messagingStyle, NotificationCompat.MessagingStyle.Message message) {
        BidiFormatter instance = BidiFormatter.getInstance();
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        boolean z = Build.VERSION.SDK_INT >= 21;
        int i = (z || Build.VERSION.SDK_INT <= 10) ? ViewCompat.MEASURED_STATE_MASK : -1;
        String sender = message.getSender();
        if (TextUtils.isEmpty(message.getSender())) {
            sender = messagingStyle.getUserDisplayName() == null ? "" : messagingStyle.getUserDisplayName();
            if (z && builder.getColor() != 0) {
                i = builder.getColor();
            }
        }
        CharSequence unicodeWrap = instance.unicodeWrap(sender);
        spannableStringBuilder.append(unicodeWrap);
        spannableStringBuilder.setSpan(makeFontColorSpan(i), spannableStringBuilder.length() - unicodeWrap.length(), spannableStringBuilder.length(), 33);
        spannableStringBuilder.append("  ").append(instance.unicodeWrap(message.getText() == null ? "" : message.getText()));
        return spannableStringBuilder;
    }

    private static void setBackgroundColor(Context context, RemoteViews remoteViews, int i) {
        if (i == 0) {
            i = context.getResources().getColor(R.color.notification_material_background_media_default_color);
        }
        remoteViews.setInt(R.id.status_bar_latest_event_content, "setBackgroundColor", i);
    }
}
