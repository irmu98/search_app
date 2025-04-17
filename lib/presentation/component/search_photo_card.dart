import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:search_app/domain/model/photo.dart';

class SearchPhotoCard extends StatelessWidget {
  final void Function(int photoId) onClick;
  final Photo photo;

  const SearchPhotoCard({
    super.key,
    required this.onClick,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick(photo.id);
      },
      child: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CachedNetworkImage(
                imageUrl: photo.previewURL,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          )),
    );
  }
}
