import 'package:search_app/data/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<List<PhotoDto>> getPhotoDtos(String value);
}