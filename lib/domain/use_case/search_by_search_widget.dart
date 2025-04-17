import 'package:search_app/domain/model/photo.dart';
import 'package:search_app/domain/repository/photo_repository.dart';

class SearchBySearchWidget {
  final PhotoRepository _photoRepository;

  const SearchBySearchWidget({required PhotoRepository photoRepository})
    : _photoRepository = photoRepository;

  Future<List<Photo>> execute(String value) async {
    final photos = await _photoRepository.getPhotos();
    return photos
        .where(
          (photo) =>
              photo.user.contains(value.toLowerCase()) ||
              photo.tags.any((tag) => tag.contains(value.toLowerCase())),
        )
        .toList();
  }
}
