import 'package:search_app/data/data_source/image_data_source.dart';
import 'package:search_app/data/dto/image_dto.dart';
import 'package:search_app/data/mapper/image_mapper.dart';
import 'package:search_app/data/model/image.dart';
import 'package:search_app/domain/repository/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {

  final ImageDataSource _imageDataSource;

  const ImageRepositoryImpl({
    required ImageDataSource imageDataSource,
  }) : _imageDataSource = imageDataSource;

  @override
  Future<List<Image>> getImages() async {
    final List<ImageDto> imageDtos = await _imageDataSource.getImageDtos();
    return imageDtos.map((e) => e.toImage()).toList();
  }
}