import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:typicode_photos/domain/photo.repository/photos_repository.dart';

import 'error_helper.dart';
import 'failure_details.dart';
import 'web_photos_client.dart';

typedef ListPhotosResult = Either<Failure<FailureDetails>, PhotosSnapshot>;

class WebPhotosRepository extends PhotosRepository {
  const WebPhotosRepository({required WebPhotosClient client}) //
      : _client = client;

  final WebPhotosClient _client;

  @override
  Future<ListPhotosResult> list({required int start, required int limit}) async {
    try {
      final photos = await _client.getPhotos(start: start, limit: limit);
//TODO extract the reaching the end use case into tests
// var photos = await _client.getPhotos(start: start, limit: limit);
// if (kDebugMode) {
//   if (photos.any((photo) => photo.id == 56)) {
//     photos = photos.take(3).toList();
//   }
// }
      if (photos.isEmpty) {
        return left(const Failure.emptyData());
      }
      return right(PhotosSnapshot.notEmpty(photos: KtList.from(photos), start: start, limit: limit));
    } catch (error, stackTrace) {
      if (ErrorHelper.guessIsTypeError(error)) {
        return left(Failure.dataIntegrity(error, stackTrace));
      }
      final badResponse = ErrorHelper.guessBadResponseByError(error);
      if (badResponse.isSome()) {
        final details = badResponse.fold(() => throw Never, (a) => a);
        return left(Failure.detailed(FailureDetails.badResponse(details)));
      }
      if (ErrorHelper.guessIsTimeout(error)) {
        return left(Failure.detailed(FailureDetails.timeoutError(error, stackTrace)));
      }
      if (ErrorHelper.guessIsSomeNetworkIssue(error)) {
        return left(Failure.detailed(FailureDetails.networkProblem(error, stackTrace)));
      }
      return left(Failure.unknown(error, stackTrace));
    }
  }
}
