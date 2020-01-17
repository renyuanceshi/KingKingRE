package com.pccw.sms.emoji;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.GridView;
import com.pccw.mobile.sip02.R;
import com.pccw.sms.bean.Emojicon;
import com.pccw.sms.emoji.type.People;

public class EmojiconGridFragment extends Fragment implements AdapterView.OnItemClickListener {
    private Emojicon[] mData;
    private OnEmojiconClickedListener mOnEmojiconClickedListener;

    public interface OnEmojiconClickedListener {
        void onEmojiconClicked(Emojicon emojicon);
    }

    /* JADX WARNING: type inference failed for: r3v0, types: [com.pccw.sms.bean.Emojicon[], java.io.Serializable] */
    /* JADX WARNING: Unknown variable types count: 1 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static com.pccw.sms.emoji.EmojiconGridFragment newInstance(com.pccw.sms.bean.Emojicon[] r3) {
        /*
            com.pccw.sms.emoji.EmojiconGridFragment r0 = new com.pccw.sms.emoji.EmojiconGridFragment
            r0.<init>()
            android.os.Bundle r1 = new android.os.Bundle
            r1.<init>()
            java.lang.String r2 = "emojicons"
            r1.putSerializable(r2, r3)
            r0.setArguments(r1)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.pccw.sms.emoji.EmojiconGridFragment.newInstance(com.pccw.sms.bean.Emojicon[]):com.pccw.sms.emoji.EmojiconGridFragment");
    }

    public void onAttach(Activity activity) {
        super.onAttach(activity);
        if (activity instanceof OnEmojiconClickedListener) {
            this.mOnEmojiconClickedListener = (OnEmojiconClickedListener) activity;
            return;
        }
        throw new IllegalArgumentException(activity + " must implement interface " + OnEmojiconClickedListener.class.getSimpleName());
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.emoji_grid, viewGroup, false);
    }

    public void onDetach() {
        this.mOnEmojiconClickedListener = null;
        super.onDetach();
    }

    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        if (this.mOnEmojiconClickedListener != null) {
            this.mOnEmojiconClickedListener.onEmojiconClicked((Emojicon) adapterView.getItemAtPosition(i));
        }
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.pccw.sms.bean.Emojicon[], java.io.Serializable] */
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putSerializable("emojicons", this.mData);
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        GridView gridView = (GridView) view.findViewById(R.id.Emoji_GridView);
        this.mData = getArguments() == null ? People.DATA : (Emojicon[]) getArguments().getSerializable("emojicons");
        gridView.setAdapter(new EmojiAdapter(view.getContext(), this.mData));
        gridView.setOnItemClickListener(this);
    }
}
