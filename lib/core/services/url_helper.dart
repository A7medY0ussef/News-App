import 'package:url_launcher/url_launcher.dart';

abstract final class UrlHelper {
  static Future<bool> openUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return false;
    try {
      return await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    } catch (e) {
      return false;
    }
  }
}
