import 'package:search_app/data/dto/image_dto.dart';
import 'package:search_app/data/model/image.dart';

extension ImageMapper on ImageDto {
  Image toImage() {
    return Image(
      id: (id ?? 0).toInt(),
      user: user ?? '',
      previewURL: previewURL ?? '',
      largeImageURL: largeImageURL ?? '',
      tags: tags?.split(',').map((e) => e.trim()).toList() ?? [], // 스플릿 후 공백제거
    );
  }
}