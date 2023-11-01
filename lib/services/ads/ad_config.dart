import 'dart:io';

class AdConfig {
  static String appidStr =
      Platform.isIOS ? '_' : "a5aa1f9deda26d"; //'a651662d76e27e';

  static String appidkeyStr = Platform.isIOS
      ? '_'
      : "4f7b9ac17decb9babec83aac078742c7"; // 'a3e0cbafecc5975ec4db50d9348cca48c';

  static String interstitialPlacementID = Platform.isIOS
      ? '_'
      : 'IMG_16_9_APP_INSTALL#351443530736389_351443900736352'; // 'b6516637763f10';
  static String bannerPlacementID = Platform.isIOS
      ? '_'
      : 'IMG_16_9_APP_INSTALL#351443530736389_351443844069691'; // 'b651663c6e5bc9';
}
