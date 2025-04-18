
import 'package:search_app/domain/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos(String value);
  Future<Photo> getPhoto(int photoId, String value);
}