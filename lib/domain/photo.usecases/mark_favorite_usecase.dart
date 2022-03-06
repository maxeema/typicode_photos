import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:typicode_photos/domain/photo.repository/photos_repository.dart';
import 'package:typicode_photos/domain/photo.services/favorite_photos_service.dart';
import 'package:rxdart/rxdart.dart';

import '../usecase.dart';

class MarkFavoriteUsecaseArgs {
  const MarkFavoriteUsecaseArgs({required this.photoId, required this.marked}); //
  final PhotoId photoId;
  final bool marked;
}

@injectable
class MarkFavoriteUsecase implements Usecase<MarkFavoriteUsecaseArgs, Future<Option<ErrorAndStackTrace>>> {
  const MarkFavoriteUsecase(this.service);

  final FavoritePhotosService service;

  @override
  Future<Option<ErrorAndStackTrace>> call(MarkFavoriteUsecaseArgs args) async {
    final result = await service.markFavorite(args.photoId, args.marked);
    return result;
  }
}
