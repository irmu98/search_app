import 'package:search_app/data/data_source/photo_data_source.dart';
import 'package:search_app/data/dto/photo_dto.dart';
import 'package:search_app/data/mapper/photo_mapper.dart';
import 'package:search_app/domain/model/photo.dart';
import 'package:search_app/domain/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {

  final PhotoDataSource _photoDataSource;

  const PhotoRepositoryImpl({
    required PhotoDataSource photoDataSource,
  }) : _photoDataSource = photoDataSource;

  @override
  Future<List<Photo>> getPhotos(String value) async {
    final List<PhotoDto> photoDtos = await _photoDataSource.getPhotoDtos(value);
    return photoDtos.map((e) => e.toPhoto()).toList();
  }

  @override
  Future<Photo> getPhoto(int photoId, String value) async {
    final List<Photo> photos = await getPhotos(value);
    return photos.firstWhere((photo) => photo.id == photoId);
  }
}