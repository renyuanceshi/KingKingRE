package com.pccw.sms.service;

import android.content.Context;
import com.pccw.database.dao.UserInfoDAOImpl;
import com.pccw.database.entity.UserInfo;

public class ProfileService {
    protected Context context;
    protected UserInfoDAOImpl userInfoImpl;

    public ProfileService(Context context2) {
        this.context = context2;
        this.userInfoImpl = new UserInfoDAOImpl(context2);
    }

    public UserInfoDAOImpl.ContactDetail getContactProfile(String str) {
        return this.userInfoImpl.findUserContactDetail(str);
    }

    public UserInfo getOwnerProfile(String str) {
        return this.userInfoImpl.findOwnerProfile(str);
    }

    public UserInfo getProfile(String str) {
        return this.userInfoImpl.findUserProfile(str);
    }

    public void updateProfile(UserInfo userInfo) {
        if (this.userInfoImpl.find(userInfo.getUserName()) != null) {
            this.userInfoImpl.update(userInfo);
        } else {
            this.userInfoImpl.add(userInfo);
        }
    }
}
