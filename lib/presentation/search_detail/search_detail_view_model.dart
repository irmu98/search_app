import 'package:flutter/material.dart';
import 'package:search_app/domain/model/photo.dart';
import 'package:search_app/domain/repository/photo_repository.dart';
import 'package:search_app/presentation/search_detail/search_detail_state.dart';

class SearchDetailViewModel with ChangeNotifier {
  final PhotoRepository _photoRepository;
  final int _photoId;
  final String _value;

  SearchDetailState _state = const SearchDetailState();

  SearchDetailState get state => _state;

  SearchDetailViewModel({
    required PhotoRepository photoRepository,
    required int photoId,
    required String value,
  }) : _photoRepository = photoRepository,
       _photoId = photoId,
       _value = value {
    _state = state.copyWith(isLoading: true);
  }

  void fetchData() async {
    _state = state.copyWith(
      photo: await _photoRepository.getPhoto(_photoId, _value),
    );
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}
