import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor {
  dev,
  live,
}
  
class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Dev';
      case Flavor.live:
        return 'Live';
      default:
        return 'title';
    }
  }

    static String get baseUrl {
      
    switch (appFlavor) {
      case Flavor.dev:
        return dotenv.get('BASEURL_DEV', fallback: 'Default fallback value');
      case Flavor.live:
        return dotenv.get('BASEURL_LIVE', fallback: 'Default fallback value');
      default:
        return 'title';
    }
  }
}

