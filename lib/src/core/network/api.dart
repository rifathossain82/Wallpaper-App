class Api {
  /// api config
  static const String _protocol = "https://";
  static const String _domain = "api.pexels.com/";
  static const String _apiVersion = "v1/";

  static const String _baseUrl = '$_protocol$_domain$_apiVersion';
  static const String siteUrl = '$_protocol$_domain';
  static const String apiKey = "563492ad6f91700001000001c30b0be49d5546f6bc3dc35a0bfa5c64";

  /// wallpaper
  static String get wallpaperList => '${_baseUrl}curated';
  static String get searchWallpaper => '${_baseUrl}search';
}
