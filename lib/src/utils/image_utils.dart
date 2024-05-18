class ImageUtils {
  static const String assetsPath = 'assets/images/';

  static String getAssetImage(String name) {
    return '$assetsPath$name';
  }
}
