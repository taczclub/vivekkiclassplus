package com.taczclub.vivekkiclassplus

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.os.PersistableBundle
import androidx.annotation.NonNull
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import androidx.core.content.ContextCompat.getSystemService
import android.view.WindowManager.LayoutParams;

class MainActivity: FlutterActivity() {
    init {
        instance = this
    }

    companion object {
        private var instance: MainActivity? = null

        fun applicationContext() : Context {
            return instance!!.applicationContext
        }
    }

    private val CHANNEL = "com.taczclub.vivekkiclassplus"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "shareOnWhatsapp") {
                val path = call.argument<String>("path")
                val msg = call.argument<String>("msg")
                val res = shareOnwhatsapp(path, msg)
                result.success(res)
            }
        }
       getWindow().addFlags(LayoutParams.FLAG_SECURE);
    }

    fun shareOnwhatsapp(path: String?, msg: String?): Boolean {
        val context = applicationContext()
        val imageUri = FileProvider.getUriForFile(context, "com.taczclub.vivekkiclassplus.provider", File(path))
        val shareIntent = Intent()
        shareIntent.action = Intent.ACTION_SEND
        shareIntent.setPackage("com.whatsapp")
        shareIntent.putExtra(Intent.EXTRA_TEXT, msg)
        shareIntent.putExtra(Intent.EXTRA_STREAM, imageUri)


        shareIntent.type = "image/*"
        shareIntent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        return try {
            startActivity(shareIntent)
            true
        } catch (ex: android.content.ActivityNotFoundException) {
            false
//            Toasty.error(this@VideoActivity.getApplicationContext(), resources.getString(R.string.whatsapp_not_installed), Toast.LENGTH_SHORT, true).show()
        }
    }
}
