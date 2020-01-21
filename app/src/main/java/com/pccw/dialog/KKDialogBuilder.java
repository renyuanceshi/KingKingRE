package com.pccw.dialog;

public class KKDialogBuilder {
    public KKDialog createDialog(EnumKKDialogType enumKKDialogType) {
        switch (enumKKDialogType) {
            case AlertKKisOffDialog:
                return new AlertKKisOffDialog();
//            case AlertNoWifiDialog:
//                return new AlertNoWifiDialog();
//            case AlertSMSConsumeDialog:
//                return new AlertSMSConsumeDialog();
            default:
                return null;
        }
    }
}
