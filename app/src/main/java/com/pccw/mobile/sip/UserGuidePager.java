package com.pccw.mobile.sip;

import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import org.linphone.LinphoneActivity;

public class UserGuidePager extends BaseFragmentActivity {
    private static final String TAG = "UserGuide";
    ImageView dot1;
    ImageView dot2;
    ImageView dot3;
    ImageView dot4;
    ImageView dot5;
    MyPagerAdapter mMyPagerAdapter;
    ViewPager mViewPager;

    public static class DummySectionFragment extends Fragment {
        public static final String ARG_SECTION_NUMBER = "section_number";

        public BitmapFactory.Options getBitmapOptions() {
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inPurgeable = true;
            options.inInputShareable = true;
            options.inScaled = false;
            options.inSampleSize = 1;
            options.inDensity = 0;
            return options;
        }

        public Bitmap getLocalBitmap(Context context, int i) {
            return BitmapFactory.decodeStream(context.getResources().openRawResource(i));
        }

        public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
            View inflate = layoutInflater.inflate(R.layout.userguide_content, viewGroup, false);
            int i = getArguments().getInt(ARG_SECTION_NUMBER);
            inflate.findViewById(R.id.cancelUserGuide).setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    DummySectionFragment.this.startActivity(new Intent(DummySectionFragment.this.getActivity().getApplicationContext(), LinphoneActivity.class));
                    if (!DummySectionFragment.this.getActivity().isFinishing()) {
                        DummySectionFragment.this.getActivity().finish();
                    }
                }
            });
            ImageView imageView = (ImageView) inflate.findViewById(R.id.userGuideImage);
            Bitmap bitmap = null;
            switch (i) {
                case 1:
                    bitmap = getLocalBitmap(getActivity().getApplicationContext(), R.drawable.tutor1);
                    break;
                case 2:
                    bitmap = getLocalBitmap(getActivity().getApplicationContext(), R.drawable.tutor2);
                    break;
                case 3:
                    bitmap = getLocalBitmap(getActivity().getApplicationContext(), R.drawable.tutor3);
                    break;
                case 4:
                    bitmap = getLocalBitmap(getActivity().getApplicationContext(), R.drawable.tutor4);
                    break;
                case 5:
                    bitmap = getLocalBitmap(getActivity().getApplicationContext(), R.drawable.tutor5);
                    break;
            }
            imageView.setImageBitmap(bitmap);
            return inflate;
        }
    }

    public static class MyPagerAdapter extends FragmentPagerAdapter {
        public MyPagerAdapter(FragmentManager fragmentManager) {
            super(fragmentManager);
        }

        public int getCount() {
            return 5;
        }

        public Fragment getItem(int i) {
            DummySectionFragment dummySectionFragment = new DummySectionFragment();
            Bundle bundle = new Bundle();
            bundle.putInt(DummySectionFragment.ARG_SECTION_NUMBER, i + 1);
            dummySectionFragment.setArguments(bundle);
            return dummySectionFragment;
        }

        public CharSequence getPageTitle(int i) {
            return "Section " + (i + 1);
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        getWindow().setFlags(1024, 1024);
        requestWindowFeature(1);
        setRequestedOrientation(1);
        setContentView(R.layout.userguide_pager);
        this.dot1 = (ImageView) findViewById(R.id.dot1);
        this.dot2 = (ImageView) findViewById(R.id.dot2);
        this.dot3 = (ImageView) findViewById(R.id.dot3);
        this.dot4 = (ImageView) findViewById(R.id.dot4);
        this.dot5 = (ImageView) findViewById(R.id.dot5);
        this.dot1.setImageResource(R.drawable.dot_selected);
        this.mMyPagerAdapter = new MyPagerAdapter(getSupportFragmentManager());
        this.mViewPager = (ViewPager) findViewById(R.id.pager);
        this.mViewPager.setAdapter(this.mMyPagerAdapter);
        this.mViewPager.setOnPageChangeListener(new ViewPager.SimpleOnPageChangeListener() {
            public void onPageSelected(int i) {
                UserGuidePager.this.dot1.setImageResource(R.drawable.dot_normal);
                UserGuidePager.this.dot2.setImageResource(R.drawable.dot_normal);
                UserGuidePager.this.dot3.setImageResource(R.drawable.dot_normal);
                UserGuidePager.this.dot4.setImageResource(R.drawable.dot_normal);
                UserGuidePager.this.dot5.setImageResource(R.drawable.dot_normal);
                switch (i + 1) {
                    case 1:
                        UserGuidePager.this.dot1.setImageResource(R.drawable.dot_selected);
                        return;
                    case 2:
                        UserGuidePager.this.dot2.setImageResource(R.drawable.dot_selected);
                        return;
                    case 3:
                        UserGuidePager.this.dot3.setImageResource(R.drawable.dot_selected);
                        return;
                    case 4:
                        UserGuidePager.this.dot4.setImageResource(R.drawable.dot_selected);
                        return;
                    case 5:
                        UserGuidePager.this.dot5.setImageResource(R.drawable.dot_selected);
                        return;
                    default:
                        return;
                }
            }
        });
    }
}
