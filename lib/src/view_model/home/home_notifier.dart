import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaper_app/src/core/enums/app_enum.dart';
import 'package:wallpaper_app/src/core/helpers/logger.dart';
import 'package:wallpaper_app/src/core/services/snackbar_services.dart';
import 'package:wallpaper_app/src/core/utils/color.dart';
import 'package:wallpaper_app/src/model/featured_model.dart';
import 'package:wallpaper_app/src/repository/wallpaper_repository.dart';
import 'package:wallpaper_app/src/view_model/home/home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  final Ref ref;
  final WallpaperRepository repository;

  HomeNotifier({
    required this.ref,
    required this.repository,
  }) : super(const HomeState());

  Future<void> getFeaturedList() async {
    try {
      HomeState newState = state;
      newState = state.copyWith(
        featuredStatus: Status.loading,
        featuredList: [],
      );

      List<FeaturedModel> featuredList = const [
        FeaturedModel(
          name: 'Nature',
          image: 'https://images.pexels.com/photos/17676464/pexels-photo-17676464/free-photo-of-a-house-on-a-hill-between-trees-in-the-countryside.jpeg?auto=compress&cs=tinysrgb&w=1600',
        ),
        FeaturedModel(
          name: 'Love',
          image: 'https://images.pexels.com/photos/2494701/pexels-photo-2494701.jpeg?auto=compress&cs=tinysrgb&w=1600',
        ),
        FeaturedModel(
          name: 'Travel',
          image: 'https://images.pexels.com/photos/12205909/pexels-photo-12205909.jpeg?auto=compress&cs=tinysrgb&w=1600',
        ),
        FeaturedModel(
          name: 'Adventure',
          image: 'https://images.pexels.com/photos/3250362/pexels-photo-3250362.jpeg?auto=compress&cs=tinysrgb&w=1600',
        ),
        FeaturedModel(
          name: 'Summer',
          image: 'https://images.pexels.com/photos/2647973/pexels-photo-2647973.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        ),
        FeaturedModel(
          name: 'Art',
          image: 'https://images.pexels.com/photos/1266808/pexels-photo-1266808.jpeg?auto=compress&cs=tinysrgb&w=1600',
        ),
        FeaturedModel(
          name: 'Gaming',
          image: 'https://images.pexels.com/photos/3165335/pexels-photo-3165335.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        ),
        FeaturedModel(
          name: 'Dark',
          image: 'https://images.pexels.com/photos/2603464/pexels-photo-2603464.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        ),
        FeaturedModel(
          name: 'Smoke',
          image: 'https://images.pexels.com/photos/2574013/pexels-photo-2574013.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        ),
      ];

      newState = newState.copyWith(
        featuredList: featuredList,
        featuredStatus: Status.success,
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
        featuredStatus: Status.failure,
      );
    }
  }

  Future<void> getPopularCollectionsList() async {}

  Future<void> getWallpaperList({bool reload = false}) async {
    try {
      HomeState newState = state;

      if (reload) {
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
