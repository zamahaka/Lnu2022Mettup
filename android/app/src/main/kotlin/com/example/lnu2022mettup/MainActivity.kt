package com.example.lnu2022mettup

import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val channelName = "lnu.2022/device_name"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channelName,
        ).setMethodCallHandler { call, result ->
            if (call.method == "getDeviceName") {
                result.success(getDeviceName())
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getDeviceName(): String {
        return Build.DEVICE
    }


}
