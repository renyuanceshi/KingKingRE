package com.pccw.sms.emoji;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import com.pccw.mobile.sip02.R;
import com.pccw.sms.bean.Emojicon;

class EmojiAdapter extends ArrayAdapter<Emojicon> {

    class ViewHolder {
        TextView icon;

        ViewHolder() {
        }
    }

    public EmojiAdapter(Context context, Emojicon[] emojiconArr) {
        super(context, R.layout.emoji_item, emojiconArr);
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        if (view == null) {
            view = View.inflate(getContext(), R.layout.emoji_item, (ViewGroup) null);
            ViewHolder viewHolder = new ViewHolder();
            viewHolder.icon = (TextView) view.findViewById(R.id.emojicon_icon);
            view.setTag(viewHolder);
        }
        ((ViewHolder) view.getTag()).icon.setText(((Emojicon) getItem(i)).getEmoji());
        return view;
    }
}
