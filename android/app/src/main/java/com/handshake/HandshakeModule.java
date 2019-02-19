package com.handshake;

import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Promise;

import handshake.Handshake;

public class HandshakeModule extends ReactContextBaseJavaModule
{
    public HandshakeModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }
    @Override
    public String getName() {
        return "RNHandshakeChat";
    }
    @ReactMethod
    public void Version(String dummy, Promise promise) {
        promise.resolve(Handshake.Version);
    }

    @ReactMethod
    public void NewGenesisProfile(String password, Promise promise) {
        try {
            Handshake.newGenesisProfile(password);
            promise.resolve("success");
        } catch (Exception e) {
            promise.reject(e);
        }
    }
    @ReactMethod
    public void NewDefaultSession(String password, Promise promise) {
        try {
            handshake.Session session = Handshake.newDefaultSession(password);
            promise.resolve(session);
        } catch (Exception e) {
            promise.reject(e);
        }
    }
}