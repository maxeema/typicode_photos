import 'package:flutter/material.dart';
import 'package:typicode_photos/domain/photo.repository/photos_repository.dart' as repository;
import 'package:typicode_photos/presentation/generated/assets.gen.dart';

class PhotosListItemPhotoWidget extends StatelessWidget {
  const PhotosListItemPhotoWidget({
    Key? key,
    required this.photo,
    required this.imageSize,
  }) : super(key: key);

  final repository.Photo photo;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageSize,
      height: imageSize,
      child: FadeInImage.assetNetwork(
        placeholder: Assets.splash.path,
        image: photo.thumbnailUrl,
        imageErrorBuilder: (_, __, ___) {
          return Assets.splash.image();
        },
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
