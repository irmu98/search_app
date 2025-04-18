import 'package:flutter/material.dart';
import 'package:search_app/core/di/di_setup.dart';
import 'package:search_app/domain/model/photo.dart';
import 'package:search_app/domain/repository/photo_repository.dart';
import 'package:search_app/domain/use_case/search_by_search_widget.dart';
import 'package:search_app/presentation/search_photo/search_photo_state.dart';

SearchPhotoState _state = const SearchPhotoState();

class SearchPhotoViewModel with ChangeNotifier {
  final PhotoRepository _photoRepository;
  final SearchBySearchWidget _searchBySearchWidget;

  SearchPhotoState get state => _state;

  SearchPhotoViewModel({
    required PhotoRepository photoRepository,
    required SearchBySearchWidget searchBySearchWidget,
  }) : _photoRepository = photoRepository,
       _searchBySearchWidget = searchBySearchWidget {
    _state = state.copyWith(isLoading: true);
  }

  void fetchPhotos() async {
    final List<Photo> photos = await _photoRepository.getPhotos(state.searchString);
    _state = state.copyWith(searchPhotos: photos);
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }

  void searchBySearchWidget() async {
    final List<Photo> searchPhotos = await _searchBySearchWidget.execute(state.searchString);
    _state = state.copyWith(searchPhotos: searchPhotos);
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }

  void updateSearchString(String value) async {
    _state = state.copyWith(searchString: value);
    notifyListeners();
  }
}
