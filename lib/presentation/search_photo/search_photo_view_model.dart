import 'package:flutter/material.dart';
import 'package:search_app/data/model/photo.dart';
import 'package:search_app/domain/repository/photo_repository.dart';
import 'package:search_app/presentation/search_photo/search_photo_state.dart';

class SearchPhotoViewModel with ChangeNotifier {
  final PhotoRepository _photoRepository;

  SearchPhotoState _state = const SearchPhotoState();
  SearchPhotoState get state => _state;

  SearchPhotoViewModel({
    required PhotoRepository photoRepository,
  }) : _photoRepository = photoRepository {
    _state = state.copyWith(isLoading: true);
  }

  void fetchPhotos() async {
    final List<Photo> photos = await _photoRepository.getPhotos();
    _state = state.copyWith(photos: photos, searchPhotos: photos);
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}