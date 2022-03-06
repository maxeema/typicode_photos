import 'package:dartz/dartz.dart';

import 'failure.dart';
import 'photos_snapshot.dart';

export '../photo.entities/photo.dart';
export 'failure.dart';
export 'photos_snapshot.dart';

typedef ListPhotosResult = Either<Failure, PhotosSnapshot>;

abstract class PhotosRepository {
  const PhotosRepository();

  Future<ListPhotosResult> list({required int start, required int limit});
}
