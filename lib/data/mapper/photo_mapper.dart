import 'package:search_app/data/dto/photo_dto.dart';
import 'package:search_app/domain/model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: (id ?? 0).toInt(),
      user: user ?? '',
      previewURL: previewURL ?? '',
      largeImageURL: largeImageURL ?? '',
      tags: tags?.split(',').map((e) => e.trim()).toList() ?? [], // 스플릿 후 공백제거
    );
  }
}