import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaper_app/src/core/enums/app_enum.dart';
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

  Future<void> getWallpaperList({bool reload = false}) async {
    try {
      HomeState newState = state;

      if(reload){
        newState = state.copyWith(
          wallpaperStatus: Status.loading,
          pageNumber: 0,
          photoList: [],
          hasReachedMax: false,
        );
      }

      final int pageNumber = newState.pageNumber + 1;

      final Map<String, dynamic> params = {
        'page': '$pageNumber',
        'per_page': '21',
      };

      final result = await repository.fetchWallpaperList(params: params);
      result.fold(
            (l) {
          SnackBarService.showSnackBar(
            message: l,
            bgColor: failedColor,
          );

          /// Update state with failure status
          newState = newState.copyWith(
            message: l,
            wallpaperStatus: Status.failure,
          );
        },
            (r) {
          /// Update state with success status and received data
          newState = newState.copyWith(
            photoList: [...newState.photoList, ...r.photos ?? []],
            wallpaperStatus: Status.success,
            hasReachedMax: r.nextPage == null,
            pageNumber: pageNumber,
          );
        },
      );

      /// Apply the new state only once, after all operations are completed
      state = newState;
    } catch (e, stackTrace) {
      Log.error('$e', stackTrace: stackTrace);

      SnackBarService.showSnackBar(
        message: '$e',
        bgColor: failedColor,
      );

      /// Update state with failure status in case of an exception
      state = state.copyWith(
        message: '$e',
        wallpaperStatus: Status.failure,
      );
    }
  }
}
