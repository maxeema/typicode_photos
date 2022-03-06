import 'package:flutter/material.dart';
import 'package:typicode_photos/domain/photo.repository/photos_repository.dart' as repository;
import 'package:typicode_photos/presentation/generated/assets.gen.dart';

class PhotosListFullSizePhotoWidget extends StatelessWidget {
  const PhotosListFullSizePhotoWidget(
    this.photo, {
    Key? key,
  }) : super(key: key);

  final repository.Photo photo;

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: Assets.splash.path,
      image: photo.url,
      imageErrorBuilder: (_, __, ___) {
        return Assets.splash.image();
      },
      fit: BoxFit.fitWidth,
    );
  }
}
