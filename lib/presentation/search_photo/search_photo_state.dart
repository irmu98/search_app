import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:search_app/domain/model/photo.dart';

part 'search_photo_state.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class SearchPhotoState with _$SearchPhotoState {
  final List<Photo> searchPhotos;

  final bool isLoading;
  final String searchString;

  const SearchPhotoState({
    this.searchPhotos = const [],
    this.isLoading = false,
    this.searchString = 'yellow+flowers',
  });
}