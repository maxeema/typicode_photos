import 'package:injectable/injectable.dart';
import 'package:typicode_photos/domain/photo.repository/photos_repository.dart';
import 'package:typicode_photos/domain/photo.services/favorite_photos_service.dart';

import '../usecase.dart';

class IsFavoriteUsecaseArgs {
  const IsFavoriteUsecaseArgs({required this.photoId}); //
  final PhotoId photoId;
}

@injectable
class IsFavoriteUsecase extends Usecase<IsFavoriteUsecaseArgs, bool> {
  const IsFavoriteUsecase(this.service);

  final FavoritePhotosService service;

  @override
  bool call(IsFavoriteUsecaseArgs args) {
    return service.isFavorite(args.photoId);
  }
}
