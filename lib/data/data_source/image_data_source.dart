import 'package:search_app/data/dto/image_dto.dart';

abstract interface class ImageDataSource {
  Future<List<ImageDto>> getImageDtos();
}