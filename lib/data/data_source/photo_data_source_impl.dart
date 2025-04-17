import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:search_app/data/data_source/photo_data_source.dart';
import 'package:search_app/data/dto/photo_dto.dart';

class PhotoDataSourceImpl implements PhotoDataSource {

  final String url = 'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=yellow+flowers&image_type=photo';

  @override
  Future<List<PhotoDto>> getPhotoDtos() async {
    final response = await http.get(Uri.parse(url));
    final json = await jsonDecode(utf8.decode(response.bodyBytes));
    final List<dynamic> photoList = json['hits'];
    return photoList.map((e) => PhotoDto.fromJson(e)).toList();
  }
}
//
// void main() async {
//   final ImageDataSource imageDataSource = ImageDataSourceImpl();
//   final List<ImageDto> dtos = await imageDataSource.getImageDtos();
//   print(dtos);
// }