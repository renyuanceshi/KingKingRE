package com.pccw.mobile.fragment;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.share.internal.ShareConstants;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.util.SSIDUtil;
import com.pccw.pref.SSIDList;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AutoLoginListFragment extends DialogFragment {
    private static final String TAG = "AutoLogin";
    private static AutoLoginListFragment instance;
    private ImageButton addSSIDBtn;
    private RelativeLayout addSSIDLayout;
    private View containView;
    /* access modifiers changed from: private */
    public TextView currentSSIDText;
    List<String> forbidATLoginSSIDList = Arrays.asList(new String[]{"PCCW1x"});
    final int[] ids = {2131624138};
    private ListView list;
    private BroadcastReceiver mBroadcastReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            AutoLoginListFragment.this.receivedBroadcast(intent);
        }
    };
    final String[] mapKey = {"ssid"};
    private mySimpleAdapter simpleAdapter;

    private class mySimpleAdapter extends SimpleAdapter {
        Context context;
        /* access modifiers changed from: private */
        public List<? extends Map<String, ?>> data;
        String[] from;
        int resource;
        int[] to;

        private class UserHolder {
            TextView recordedSSID;
            ImageButton removeSSIDButton;

            private UserHolder() {
            }
        }

        public mySimpleAdapter(Context context2, List<? extends Map<String, ?>> list, int i, String[] strArr, int[] iArr) {
            super(context2, list, i, strArr, iArr);
            this.resource = i;
            this.data = list;
            this.from = strArr;
            this.to = iArr;
            this.context = context2;
        }

        public View getView(final int i, View view, ViewGroup viewGroup) {
            UserHolder userHolder;
            if (view == null) {
                view = ((Activity) this.context).getLayoutInflater().inflate(this.resource, viewGroup, false);
                userHolder = new UserHolder();
                userHolder.removeSSIDButton = (ImageButton) view.findViewById(R.id.remove_ssid_button);
                userHolder.recordedSSID = (TextView) view.findViewById(R.id.record_ssid);
                view.setTag(userHolder);
            } else {
                userHolder = (UserHolder) view.getTag();
            }
            userHolder.recordedSSID.setText((String) ((Map) this.data.get(i)).get(this.from[0]));
            userHolder.removeSSIDButton.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    String str = (String) ((Map) mySimpleAdapter.this.data.get(i)).get(mySimpleAdapter.this.from[0]);
                    switch (SSIDList.removeSSID(mySimpleAdapter.this.context, str)) {
                        case -2:
                            return;
                        default:
                            AutoLoginListFragment.this.updateList();
                            Toast.makeText(mySimpleAdapter.this.context, String.format(AutoLoginListFragment.this.getString(R.string.add_ssid_list_removed), new Object[]{str}), 0).show();
                            return;
                    }
                }
            });
            return view;
        }
    }

    private ArrayList<HashMap<String, Object>> getData(Context context) {
        ArrayList<HashMap<String, Object>> arrayList = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            HashMap hashMap = new HashMap();
            if (!SSIDList.getSSID(context, i).equals("")) {
                hashMap.put("ssid", SSIDList.getSSID(context, i));
                arrayList.add(hashMap);
            }
        }
        return arrayList;
    }

    public static AutoLoginListFragment getInstance() {
        if (instance != null) {
            return instance;
        }
        return null;
    }

    private boolean isForbidAutoLoginSSID(String str) {
        return this.forbidATLoginSSIDList.contains(str);
    }

    public static AutoLoginListFragment newInstance(int i) {
        AutoLoginListFragment autoLoginListFragment = new AutoLoginListFragment();
        Bundle bundle = new Bundle();
        bundle.putInt(ShareConstants.WEB_DIALOG_PARAM_TITLE, i);
        autoLoginListFragment.setArguments(bundle);
        return autoLoginListFragment;
    }

    /* access modifiers changed from: private */
    public void receivedBroadcast(Intent intent) {
        NetworkInfo networkInfo = (NetworkInfo) intent.getParcelableExtra("networkInfo");
        if (networkInfo.getType() != 1) {
            return;
        }
        if (networkInfo.getState().equals(NetworkInfo.State.CONNECTED)) {
            updateCurrentSSIDField(SSIDUtil.getCurrentSSID(getActivity()));
        } else if (networkInfo.getState().equals(NetworkInfo.State.DISCONNECTED)) {
            updateCurrentSSIDField("");
        }
    }

    /* access modifiers changed from: private */
    public void updateList() {
        this.simpleAdapter = new mySimpleAdapter(getActivity(), getData(getActivity()), R.layout.auto_login_ssid_item, this.mapKey, this.ids);
        this.list.setAdapter(this.simpleAdapter);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    public Dialog onCreateDialog(Bundle bundle) {
        instance = this;
        this.containView = getActivity().getLayoutInflater().inflate(R.layout.auto_login_ssid_dialog, (ViewGroup) null);
        this.list = (ListView) this.containView.findViewById(R.id.auto_login_ssid_list);
        this.currentSSIDText = (TextView) this.containView.findViewById(R.id.current_ssid);
        this.addSSIDBtn = (ImageButton) this.containView.findViewById(R.id.add_ssid_button);
        this.addSSIDLayout = (RelativeLayout) this.containView.findViewById(R.id.add_ssid_layout);
        updateAddSSIDLayout("");
        updateList();
        this.addSSIDBtn.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                AlertDialog.Builder builder = new AlertDialog.Builder(AutoLoginListFragment.this.getActivity());
                builder.setTitle(AutoLoginListFragment.this.getActivity().getString(R.string.app_name));
                builder.setIcon(R.drawable.ic_logo);
                builder.setMessage(String.format(AutoLoginListFragment.this.getString(R.string.auto_login_dialog_confirm_dialog_message), new Object[]{AutoLoginListFragment.this.currentSSIDText.getText().toString()}));
                builder.setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        String charSequence = AutoLoginListFragment.this.currentSSIDText.getText().toString();
                        if (charSequence.equals("")) {
                            Toast.makeText(AutoLoginListFragment.this.getActivity(), "No SSID", 0).show();
                            return;
                        }
                        switch (SSIDList.addSSID(AutoLoginListFragment.this.getActivity(), charSequence)) {
                            case -3:
                                Toast.makeText(AutoLoginListFragment.this.getActivity(), AutoLoginListFragment.this.getString(R.string.add_ssid_list_full), 0).show();
                                return;
                            case -1:
                                Toast.makeText(AutoLoginListFragment.this.getActivity(), AutoLoginListFragment.this.getString(R.string.add_ssid_list_already_exist), 0).show();
                                return;
                            case 0:
                                Toast.makeText(AutoLoginListFragment.this.getActivity(), String.format(AutoLoginListFragment.this.getString(R.string.add_ssid_list_success), new Object[]{charSequence}), 0).show();
                                AutoLoginListFragment.this.updateList();
                                MobileSipService.getInstance().changeToAutoLoginSession();
                                return;
                            default:
                                return;
                        }
                    }
                });
                builder.setNegativeButton(android.R.string.cancel, (DialogInterface.OnClickListener) null);
                builder.create().show();
            }
        });
        return new AlertDialog.Builder(getActivity()).setTitle(R.string.auto_login_dialog_title).setNegativeButton(R.string.cancel, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
            }
        }).setView(this.containView).create();
    }

    public void onPause() {
        getActivity().unregisterReceiver(this.mBroadcastReceiver);
        super.onPause();
    }

    public void onResume() {
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
        getActivity().registerReceiver(this.mBroadcastReceiver, intentFilter);
        super.onResume();
    }

    public void updateAddSSIDLayout(String str) {
        if (MobileSipService.getInstance().loginStatus != 0 || str.equals("") || isForbidAutoLoginSSID(str)) {
            this.addSSIDLayout.setVisibility(View.GONE);
        } else {
            this.addSSIDLayout.setVisibility(View.VISIBLE);
        }
    }

    public void updateCurrentSSIDField(String str) {
        this.currentSSIDText.setText(str);
        updateAddSSIDLayout(str);
    }
}
