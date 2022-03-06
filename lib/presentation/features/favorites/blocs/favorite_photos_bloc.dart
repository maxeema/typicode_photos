import 'package:injectable/injectable.dart';
import 'package:typicode_photos/domain/photo.entities/photo.dart';
import 'package:typicode_photos/domain/photo.usecases/is_favorite_usecase.dart';
import 'package:typicode_photos/domain/photo.usecases/mark_favorite_usecase.dart';
import 'package:single_bloc/single_bloc.dart';

export 'package:single_bloc/single_bloc.dart';

class FavoritePhotosBlocArgs {
  const FavoritePhotosBlocArgs({required this.photoId, required this.marked});

  final PhotoId photoId;
  final bool marked;
}

// The bloc just check and mark Photos as favorite
//  without keeping state because it is kept by the backed service/repo
@injectable
class FavoritePhotosBloc extends SingleBloc<void, void, FavoritePhotosBlocArgs> {
  FavoritePhotosBloc(
    this._markFavorite,
    this._isFavorite,
  );

  final MarkFavoriteUsecase _markFavorite;
  final IsFavoriteUsecase _isFavorite;

  void markAsFavorite(PhotoId photoId, bool marked) {
    execute(FavoritePhotosBlocArgs(photoId: photoId, marked: marked));
  }

  bool isFavorite(PhotoId photoId) {
    return _isFavorite(IsFavoriteUsecaseArgs(photoId: photoId));
  }

  @override
  Future<void> action({covariant FavoritePhotosBlocArgs? args, required IsCanceled isCanceled}) async {
    args!;
    final result = await _markFavorite(MarkFavoriteUsecaseArgs(photoId: args.photoId, marked: args.marked));
    if (result.isSome()) {
      //TODO Will we handle unsuccessful results? We could at least log them with crashlytics.
      final error = result.foldRight(null, (a, _) => a);
      print('[Error] could not mark/unmark favorite photo id ${args.photoId} : ${args.marked}, $error');
    }
  }
}
