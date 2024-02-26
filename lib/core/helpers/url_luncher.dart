import 'package:my_portfolio/core/helpers/strings_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigateToUrl {
  static Future<void> urlLuncher({required Uri url}) async {
    if (await launchUrl(url)) {
      throw Exception({StringsManger.couldNotLaunch, ":$url"});
    }
  }
}
