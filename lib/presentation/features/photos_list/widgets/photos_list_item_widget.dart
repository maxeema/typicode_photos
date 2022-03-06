import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:typicode_photos/domain/photo.repository/photos_repository.dart' as repository;
import 'package:typicode_photos/presentation/const.dart';

import 'photos_list_item_body_widget.dart';
import 'photos_list_item_photo_widget.dart';

class PhotoListItemWidget extends HookWidget {
  static const _itemsHeight = kPhotoPreviewThumbnailSize;

  const PhotoListItemWidget({
    required this.photo,
    required this.onPhotoClick,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPhotoClick;
  final repository.Photo photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          InkWell(
            onTap: onPhotoClick,
            child: PhotosListItemPhotoWidget(
              photo: photo,
              imageSize: _itemsHeight,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: PhotosListItemBodyWidget(itemsHeight: _itemsHeight, photo: photo),
          ),
        ],
      ),
    );
  }
}
