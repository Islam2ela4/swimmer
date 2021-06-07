package com.inspireui.fluxstore

import android.content.Context
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.content.pm.PackageManager.*
import android.os.Bundle
import android.util.Base64
import android.util.Log
import android.widget.Toast
import androidx.annotation.NonNull
import com.google.android.gms.common.GoogleApiAvailability
import com.google.gson.Gson
import io.appgain.sdk.controller.Appgain
import io.appgain.sdk.interfaces.AppgainDataCallback
import io.appgain.sdk.model.BaseResponse
import io.appgain.sdk.model.deferredlinking.DeferredDeepLinkingResponse
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.security.MessageDigest
import java.security.NoSuchAlgorithmException

const val PACKAGE_NAME = "com.appgain.nabolia"
const val IS_GMS_AVAILABLE = "isGmsAvailable"
const val GMS_CHECK_METHOD_CHANNEL = "$PACKAGE_NAME/$IS_GMS_AVAILABLE"


class MainActivity : FlutterActivity() {

    private val CHANNEL = "com.Appgain.io/AppgainSDK"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
//        printHahKey()
    }

    private fun printHahKey() {
        try {
            val info: PackageInfo = packageManager.getPackageInfo("com.swimmingstore.app", GET_SIGNATURES)
            for (signature in info.signatures) {
                val md: MessageDigest = MessageDigest.getInstance("SHA").also {
                    it.update(signature.toByteArray())
                }
//                Toast.makeText(this, "", Toast.LENGTH_SHORT).show()
                Log.d("KeyHash", Base64.encodeToString(md.digest(), Base64.DEFAULT))
            }
        } catch (e: NameNotFoundException) {
        } catch (e: NoSuchAlgorithmException) {
        }
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when(call.method){
                "logEvent" -> {
                    val action: String = call.argument<String>("type")?:""
                    val event: String = call.argument<String>("action")?:""
                    val extras: HashMap<String, String> = call.argument<HashMap<String, String>>("extras")?: hashMapOf()
                    val bundle = Bundle()
                    for(key in extras.keys.toList()) {
                        bundle.putString(key, extras.get(key))
                    }
                    Appgain.logEvent(action, event, bundle, object : AppgainDataCallback<Void> {
                        override fun onFailure(failure: BaseResponse?) {
                            result.error("failure", "failure", Gson().toJson(failure))
                        }

                        override fun onSuccess(data: Void?) {
                            result.success("successfully")
                        }
                    })
                }
                "initSDK" -> {
                    val apiKey= "07dc24d692778b94a7e36af66d9f4228d90d4235617f4b4f2bd42d339d32da19"
                    val appId= "609a6ec3e04986000ba61a3e"
                    Appgain.enableLog()
                    Appgain.initialize(this, appId, apiKey, true,
                            object : AppgainDataCallback<Void> {
                                override fun onFailure(failure: BaseResponse?) {
                                    Log.d("Appgain",failure.toString())
                                    result.error("", "", Gson().toJson(failure))

                                }

                                override fun onSuccess(data: Void?) {
                                    Log.d("Appgain","initSDK Done ")
                                    result.success("done successfully")
                                }
                            }
                    )
                }
                "getUserID" -> {
                    val userId = Appgain.getUserId()
                    result.success(userId)
                }
                "matchLink" -> {
                    Appgain.matchLink(object : AppgainDataCallback<DeferredDeepLinkingResponse> {
                        override fun onSuccess(data: DeferredDeepLinkingResponse?) {
                            if (data != null) {
                                result.success("matchLink successfully")
                            }
                        }

                        override fun onFailure(failure: BaseResponse?) {
                            result.error("", "", Gson().toJson(failure))
                        }

                    })
                }
                "fireAutomatorWithPersonalization" -> {
                    val triggerPoint: String = call.argument<String>("triggerPointName")?:""
                    val personalizationData: HashMap<String, String> = call.argument<HashMap<String, String>>("personalizationMap")?: hashMapOf()
                    Appgain.fireAutomator(triggerPoint, personalizationData, object : AppgainDataCallback<Void> {
                        override fun onSuccess(data: Void?) {
                            result.success(null)
                        }

                        override fun onFailure(failure: BaseResponse?) {
                            result.error("", "", Gson().toJson(failure))
                        }

                    })
                }
                "fireAutomator" -> {
                    val triggerPoint: String = call.argument<String>("triggerPointName")?:""
                    Appgain.fireAutomator(triggerPoint, HashMap<String, String>(), object : AppgainDataCallback<Void> {
                        override fun onSuccess(data: Void?) {
                            result.success(null)
                        }

                        override fun onFailure(failure: BaseResponse?) {
                            result.error("", "", Gson().toJson(failure))
                        }

                    })
                }
                "cancelfireAutomator" -> {
                    val trigger_point: String = call.argument<String>("triggerPointName")?:""
                    Appgain.cancelAutomator(trigger_point, object : AppgainDataCallback<Void> {
                        override fun onSuccess(data: Void?) {
                            result.success(null)
                        }

                        override fun onFailure(failure: BaseResponse?) {
                            result.error("", "", Gson().toJson(failure))
                        }

                    })
                }
                "setuserId" -> {
                    val userId: String = call.argument<String>("userId")?:""
                    Appgain.updateUserId(userId, object : AppgainDataCallback<String> {
                        override fun onSuccess(data: String?) {
                            result.success(data)
                        }

                        override fun onFailure(failure: BaseResponse?) {
                            result.error("", "", Gson().toJson(failure))
                        }

                    })
                }
                "addPurchase" -> {
                    val productName: String = call.argument<String>("productName")?:""
                    val amount: Double = call.argument<Double>("amount")?:0.0
                    val currency: String = call.argument<String>("curruncy")?:""
                    Appgain.logPurchase(productName, amount.toFloat(), currency, object : AppgainDataCallback<Void> {
                        override fun onSuccess(data: Void?) {
                            result.success(null)
                        }

                        override fun onFailure(failure: BaseResponse?) {
                            result.error("", "", Gson().toJson(failure))
                        }
                    })
                }
                "enableReciveNotification" -> {
                    val enable: Boolean = call.argument<Boolean>("enable")?:true
                    val channel: String = call.argument<String>("type")?:""
                    Appgain.enableNotifications(enable, channel, object : AppgainDataCallback<Void> {
                        override fun onSuccess(data: Void?) {
                            result.success(null)
                        }

                        override fun onFailure(failure: BaseResponse?) {
                            result.error("", "", Gson().toJson(failure))
                        }
                    })
                }
                "addNotificationChannel" -> {
                    val channel: String = call.argument<String>("notificationType")?:""
                    val data: String = call.argument<String>("item")?:""
                    Appgain.createNotificationChannel(channel, data, object : AppgainDataCallback<Void> {
                        override fun onSuccess(data: Void?) {
                            result.success("done done")
                        }

                        override fun onFailure(failure: BaseResponse?) {
                            result.error("", "", Gson().toJson(failure))
                        }
                    })
                }
                "updateUser" -> {
                    val userData = call.argument<HashMap<String, String>>("userData")?: hashMapOf()
                    Appgain.updateUserData(userData, object : AppgainDataCallback<Void> {
                        override fun onSuccess(data: Void?) {
                            result.success(null)
                        }

                        override fun onFailure(failure: BaseResponse?) {
                            result.error("", "", Gson().toJson(failure))
                        }
                    })
                }
                IS_GMS_AVAILABLE -> {
                    result.success(isGmsAvailable())
                }

                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun isGmsAvailable(): Boolean {
        return try {
            val context: Context = this@MainActivity.context
            val result: Int = GoogleApiAvailability.getInstance().isGooglePlayServicesAvailable(context)
            result == com.google.android.gms.common.ConnectionResult.SUCCESS
        } catch (_: Exception) {
            // Ignore errors. No GMS available as default.
            false
        }
    }

}