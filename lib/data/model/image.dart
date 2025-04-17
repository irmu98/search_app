import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class Image with _$Image {
  final int id;
  final String user;
  final String previewURL;
  final String largeImageURL;
  final List<String> tags;

  const Image({
    required this.id,
    required this.user,
    required this.previewURL,
    required this.largeImageURL,
    required this.tags,
  });
}