import 'package:search_app/data/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos();
}