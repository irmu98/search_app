import 'package:search_app/data/model/image.dart';

abstract interface class ImageRepository {
  Future<List<Image>> getImages();
}