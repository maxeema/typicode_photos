import 'dart:collection';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:kt_dart/kt.dart';
import 'package:typicode_photos/domain/photo.entities/photo.dart';
import 'package:typicode_photos/domain/photo.services/favorite_photos_service.dart';
import 'package:rxdart/rxdart.dart';

class HiveFavoritePhotosService extends FavoritePhotosService {
  const HiveFavoritePhotosService({required this.box});

  final Box<bool> box;

  @override
  bool isFavorite(PhotoId photoId) {
    return box.get(photoId) ?? false;
  }

  @override
  Future<Option<ErrorAndStackTrace>> markFavorite(PhotoId photoId, bool favorite) async {
    try {
      await box.put(photoId, favorite);
      return none();
    } catch (error, stackTrace) {
      return some(ErrorAndStackTrace(error, stackTrace));
    }
  }

  @override
  Either<ErrorAndStackTrace, KtList<PhotoId>> listFavorites() {
    final favorites = Queue<PhotoId>();
    try {
      for (var photoId in box.keys) {
        if (box.get(photoId) ?? false) {
          favorites.add(photoId);
        }
      }
      return right(KtList.from(favorites));
    } catch (error, stackTrace) {
      return left(ErrorAndStackTrace(error, stackTrace));
    }
  }
}
