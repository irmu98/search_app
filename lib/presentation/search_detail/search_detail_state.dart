

import 'package:search_app/domain/model/photo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_detail_state.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class SearchDetailState with _$SearchDetailState {
  final Photo photo; // nullable 해도 됨.
  final bool isLoading;

  const SearchDetailState({
    this.photo = const Photo(id: 0, user: '', previewURL: '', largeImageURL: '', tags: {}),
    this.isLoading = false
  });
}