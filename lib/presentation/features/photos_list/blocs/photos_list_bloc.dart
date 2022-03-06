import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:typicode_photos/domain/photo.repository/photos_repository.dart' as repository;
import 'package:typicode_photos/domain/photo.usecases/list_photos_usecase.dart';
import 'package:typicode_photos/extensions/dartz_x.dart';
import 'package:typicode_photos/extensions/duration_x.dart';
import 'package:typicode_photos/presentation/actions/photo.actions/open_photo_action.dart';
import 'package:typicode_photos/presentation/const.dart';
import 'package:single_bloc/single_bloc.dart';

import 'photos_list_bloc_data.dart';

export 'package:single_bloc/single_bloc.dart';

export 'photos_list_bloc_data.dart';

typedef PhotosListBlocState = SingleBlocState<repository.Failure, PhotosListBlocData>;
typedef PhotosListBlocErrorInfo = SingleBlocErrorInfo<repository.Failure>;

const _kItemsPerPage = kListPhotosAmountPerRequest;
const _kFirstLoadDelay = Duration(milliseconds: 600);
const _kNextLoadDelay = Duration(milliseconds: 300);

@injectable
class PhotosListBloc extends SingleBloc<repository.Failure, PhotosListBlocData, void> {
  PhotosListBloc(
    this._listPhotos,
    this._openPhoto,
    // Set initial status as 'inProgress' cuz with instantly call the execute
  ) : super(SingleBlocState(SingleBlocStatus.inProgress)) {
    // Try to get data on the instantiating of the bloc
    execute(null, delay: _kFirstLoadDelay.delay);
  }

  final ListPhotosUsecase _listPhotos; //
  final OpenPhotoAction _openPhoto;

  void loadNext() => execute(null, delay: _kNextLoadDelay.delay);

  void openPhoto(repository.Photo photo) => _openPhoto(photo);

  bool get hasMore => data.value?.hasMore ?? true; //

  @override
  Future<PhotosListBlocData> action({required void args, required IsCanceled isCanceled}) async {
    final start = data.value?.totalPhotos ?? 0;
    print('action >> page, start: $start, limit: $_kItemsPerPage');
    final result = await _listPhotos(ListPhotosUsecaseArgs(start: start, limit: _kItemsPerPage));
    print('>> listener, hasData: ${data.hasValue}, hasMore: ${data.value?.hasMore}');
    // print('>> listener, _canAutoLoadNext: $_canAutoLoadNext, hasData: ${hasData}, hasMore: ${data?.hasMore}');
    if (result.isRight()) {
      // If the result is right then we assume that at least one item presented in a snapshot
      final snapshot = result.asRight();
      print('>> new snapshot photos size: ${snapshot.photos.size}');
      // Combine current data (if have) and new
      final newData = PhotosListBlocData(
        snapshots: KtList.from([...?data.value?.snapshots.asList(), snapshot]),
        hasMore: snapshot.photos.size == _kItemsPerPage,
      );
      print('>> is right, hasMore: ${newData.hasMore} (${snapshot.photos.size % _kItemsPerPage})');
      return newData;
    } else {
      final error = result.asLeft();
      // _canAutoLoadNext = false;
      // On empty data error, we just return and update the bloc's state with no more data
      return error.maybeWhen(emptyData: () {
        if (data.hasValue) {
          // If bloc already had data than just mark that has no more data available and we reached the end
          return data.value!.copyWith(
            hasMore: false,
          );
        }
        // Rethrow the error if the empty data error occurred when bloc had nothing
        throw error;
      }, orElse: () {
        // Otherwise, we rethrow the error
        throw error;
      });
    }
  }
}
