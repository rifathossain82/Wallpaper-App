import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaper_app/src/core/enums/app_enum.dart';
import 'package:wallpaper_app/src/core/helpers/helper_methods.dart';
import 'package:wallpaper_app/src/core/helpers/logger.dart';
import 'package:wallpaper_app/src/core/services/snackbar_services.dart';
import 'package:wallpaper_app/src/core/utils/color.dart';
import 'package:wallpaper_app/src/repository/wallpaper_repository.dart';
import 'package:wallpaper_app/src/view_model/home/home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  final Ref ref;
  final WallpaperRepository repository;

  HomeNotifier({
    required this.ref,
    required this.repository,
  }) : super(const HomeState());

  Future<void> getFeaturedList() async {}

  Future<void> getPopularCollectionsList() async {}

  Future<void> getWallpaperList() async {
    try {
      final int pageNumber = state.pageNumber + 1;

      final Map<String, dynamic> params = {
        'page': '$pageNumber',
        'per_page': '30',
      };

      final result = await repository.fetchWallpaperList(params: params);
      result.fold(
        (l) {
          SnackBarService.showSnackBar(
            message: l,
            bgColor: failedColor,
          );

          state = state.copyWith(
            message: l,
            wallpaperStatus: Status.failure,
          );

          return state;
        },
        (r) {
          state = state.copyWith(
            photoList: [...state.photoList, ...r.photos ?? []],
            wallpaperStatus: Status.success,
            hasReachedMax: r.nextPage == null,
            pageNumber: pageNumber,
          );
          return state;
        },
      );
    } catch (e, stackTrace) {
      Log.error(
        '$e',
        stackTrace: stackTrace,
      );

      SnackBarService.showSnackBar(
        message: '$e',
        bgColor: failedColor,
      );

      state = state.copyWith(
        message: '$e',
        wallpaperStatus: Status.failure,
      );
    }
  }
}
