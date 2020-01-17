package com.pccw.sms.emoji;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;
import java.util.List;

public class EmojiPagerAdapter extends FragmentStatePagerAdapter {
    private List<EmojiconGridFragment> fragments;

    public EmojiPagerAdapter(FragmentManager fragmentManager, List<EmojiconGridFragment> list) {
        super(fragmentManager);
        this.fragments = list;
    }

    public int getCount() {
        return this.fragments.size();
    }

    public Fragment getItem(int i) {
        return this.fragments.get(i);
    }
}
