import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class Photo with _$Photo {
  final int id;
  final String user;
  final String previewURL;
  final String largeImageURL;
  final Set<String> tags;

  const Photo({
    required this.id,
    required this.user,
    required this.previewURL,
    required this.largeImageURL,
    required this.tags,
  });
}