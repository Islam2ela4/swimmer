package com.inspireui.fluxstore

import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.OnLifecycleEvent
import androidx.lifecycle.ProcessLifecycleOwner
import io.appgain.sdk.controller.Appgain
import io.flutter.app.FlutterApplication

class FlutterTestApp : FlutterApplication(), LifecycleObserver {
    override fun onCreate() {
        super.onCreate()
        ProcessLifecycleOwner.get().getLifecycle().addObserver(this)
    }
    @OnLifecycleEvent(Lifecycle.Event.ON_STOP)
    fun onAppBackgrounded() {
        Appgain.onAppBackgrounded()
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_START)
    fun onAppForegrounded() {
        Appgain.onAppForegrounded()
    }
}