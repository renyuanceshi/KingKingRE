package com.google.android.gms.internal;

import com.google.android.gms.common.Scopes;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Scope;

public final class zzctf {
    public static final Api<zzctk> API = new Api<>("SignIn.API", zzajS, zzajR);
    private static Api<zzcti> zzaMc = new Api<>("SignIn.INTERNAL_API", zzbCK, zzbCJ);
    private static Api.zzf<zzctt> zzajR = new Api.zzf<>();
    public static final Api.zza<zzctt, zzctk> zzajS = new zzctg();
    private static Scope zzalV = new Scope(Scopes.PROFILE);
    private static Scope zzalW = new Scope("email");
    private static Api.zzf<zzctt> zzbCJ = new Api.zzf<>();
    private static Api.zza<zzctt, zzcti> zzbCK = new zzcth();
}
