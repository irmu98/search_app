import 'package:search_app/data/data_source/photo_data_source.dart';
import 'package:search_app/data/dto/photo_dto.dart';
import 'package:search_app/data/mapper/photo_mapper.dart';
import 'package:search_app/data/model/photo.dart';
import 'package:search_app/domain/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {

  final PhotoDataSource _photoDataSource;

  const PhotoRepositoryImpl({
    required PhotoDataSource photoDataSource,
  }) : _photoDataSource = photoDataSource;

  @override
  Future<List<Photo>> getPhotos() async {
    final List<PhotoDto> photoDtos = await _photoDataSource.getPhotoDtos();
    return photoDtos.map((e) => e.toPhoto()).toList();
  }
}