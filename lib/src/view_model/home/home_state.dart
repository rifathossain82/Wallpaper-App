// import 'package:equatable/equatable.dart';
// import 'package:wallpaper_app/src/core/enums/app_enum.dart';
// import 'package:wallpaper_app/src/model/wallpaper_model.dart';
//
// class HomeState extends Equatable {
//   const HomeState({
//     this.featuredStatus = Status.initial,
//     this.popularCollectionsStatus = Status.initial,
//     this.wallpaperStatus = Status.initial,
//     this.message = '',
//     this.photoList = const <Photo>[],
//     this.hasReachedMax = false,
//     this.pageNumber = 0,
//   });
//
//   final Status featuredStatus;
//   final Status popularCollectionsStatus;
//   final Status wallpaperStatus;
//   final String message;
//   final List<Photo> photoList;
//   final bool hasReachedMax;
//   final int pageNumber;
//
//   HomeState copyWith({
//     Status? featuredStatus,
//     Status? popularCollectionsStatus,
//     Status? wallpaperStatus,
//     String? message,
//     List<Photo>? photoList,
//     bool? hasReachedMax,
//     int? pageNumber,
//   }) {
//     return HomeState(
//       featuredStatus: featuredStatus ?? this.featuredStatus,
//       popularCollectionsStatus: popularCollectionsStatus ?? this.popularCollectionsStatus,
//       wallpaperStatus: wallpaperStatus ?? this.wallpaperStatus,
//       message: message ?? this.message,
//       photoList: photoList ?? this.photoList,
//       hasReachedMax: hasReachedMax ?? this.hasReachedMax,
//       pageNumber: pageNumber ?? this.pageNumber,
//     );
//   }
//
//   @override
//   String toString() {
//     return '''HomeState {
//       featuredStatus: $featuredStatus,
//       popularCollectionsStatus: $popularCollectionsStatus,
//       wallpaperStatus: $wallpaperStatus,
//       message: $message,
//       photoList: ${photoList.length},
//       hasReachedMax: $hasReachedMax,
//       pageNumber: $pageNumber,
//     }''';
//   }
//
//   @override
//   List<Object> get props => [
//     featuredStatus,
//     popularCollectionsStatus,
//     wallpaperStatus,
//     message,
//     photoList,
//     hasReachedMax,
//     pageNumber,
//   ];
// }
