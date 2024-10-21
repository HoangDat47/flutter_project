import android.content.Intent
import android.net.Uri
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "flutterapp.tutorialspoint.com/browser"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "openBrowser" -> {
                    val url: String? = call.argument("url")
                    url?.let {
                        openBrowser(result, it)
                    } ?: result.error("INVALID_URL", "URL cannot be null", null)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun openBrowser(result: MethodChannel.Result, url: String) {
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
        startActivity(intent)
        result.success(null)  // Trả về thành công sau khi mở trình duyệt
    }
}
