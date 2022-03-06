import 'package:flutter/material.dart';
import 'package:typicode_photos/domain/photo.repository/photos_repository.dart' as repository;
import 'package:typicode_photos/presentation/features/favorites/blocs/favorite_photos_bloc.dart';
import 'package:provider/provider.dart';

import 'photos_list_item_favorite_widget.dart';

class PhotosListItemBodyWidget extends StatelessWidget {
  const PhotosListItemBodyWidget({
    Key? key,
    required this.itemsHeight,
    required this.photo,
  }) : super(key: key);

  final double itemsHeight;
  final repository.Photo photo;

  @override
  Widget build(BuildContext context) {
    final title = photo.title.replaceRange(0, 1, photo.title.substring(0, 1).toUpperCase());
    return SizedBox(
      height: itemsHeight,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Album ${photo.albumId}. Photo ${photo.id}',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              PhotosListItemFavoriteWidget(
                photoId: photo.id,
                bloc: context.read<FavoritePhotosBloc>(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
