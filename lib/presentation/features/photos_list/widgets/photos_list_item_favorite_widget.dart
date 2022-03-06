import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:typicode_photos/domain/photo.entities/photo.dart';
import 'package:typicode_photos/presentation/features/favorites/blocs/favorite_photos_bloc.dart';

class PhotosListItemFavoriteWidget extends HookWidget {
  const PhotosListItemFavoriteWidget({
    required this.bloc,
    required this.photoId,
    Key? key,
  }) : super(key: key);

  final PhotoId photoId;
  final FavoritePhotosBloc bloc;

  @override
  Widget build(BuildContext context) {
    final marked = useValueNotifier(bloc.isFavorite(photoId));
    useValueListenable(marked);
    return IconButton(
      icon: Icon(
        marked.value ? Icons.favorite : Icons.favorite_outline,
        color: marked.value ? Colors.pinkAccent : Colors.grey,
      ),
      onPressed: () {
        marked.value = !marked.value;
        bloc.markAsFavorite(photoId, marked.value);
      },
    );
  }
}
