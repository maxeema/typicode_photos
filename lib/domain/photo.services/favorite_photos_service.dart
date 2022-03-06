import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';

import '../photo.entities/photo.dart';

abstract class FavoritePhotosService {
  const FavoritePhotosService();

  bool isFavorite(PhotoId photoId); //
  Future<Option<ErrorAndStackTrace>> markFavorite(PhotoId photoId, bool favorite); //
  Either<ErrorAndStackTrace, KtList<int>> listFavorites(); //
}
