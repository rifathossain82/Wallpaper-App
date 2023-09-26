import 'package:dartz/dartz.dart';
import 'package:wallpaper_app/src/core/network/api.dart';
import 'package:wallpaper_app/src/core/network/network_utils.dart';
import 'package:wallpaper_app/src/model/wallpaper_model.dart';

class WallpaperRepository {
  Future<Either<String, WallpaperModel>> fetchWallpaperList({
    required Map<String, dynamic> params,
  }) async {
    dynamic responseBody = await Network.handleResponse(
      await Network.getRequest(
        api: Api.wallpaperList,
        params: params,
      ),
    );

    if (responseBody != null) {
      return right(WallpaperModel.fromJson(responseBody));
    }

    return left('Unable To Load Wallpapers!');
  }

  Future<Either<String, WallpaperModel>> searchWallpaper({
    required Map<String, dynamic> params,
  }) async {
    dynamic responseBody = await Network.handleResponse(
      await Network.getRequest(
        api: Api.searchWallpaper,
      ),
    );

    if (responseBody != null) {
      return right(WallpaperModel.fromJson(responseBody));
    }

    return left('Unable To Search Wallpapers!');
  }
}
