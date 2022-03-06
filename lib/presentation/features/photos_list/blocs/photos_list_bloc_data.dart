import 'package:equatable/equatable.dart';
import 'package:kt_dart/kt.dart';
import 'package:typicode_photos/domain/photo.repository/photos_repository.dart' as repository;

class PhotosListBlocData extends Equatable {
  PhotosListBlocData({required this.snapshots, required this.hasMore});

  final KtList<repository.PhotosSnapshot> snapshots;
  final bool hasMore;

  late final photos = KtList.from(snapshots.asList().expand((snapshot) => snapshot.photos.asList()));
  late final totalPhotos = snapshots.sumBy((snapshot) => snapshot.photos.size);

  @override
  List<Object?> get props => [hasMore, snapshots];

  PhotosListBlocData copyWith({KtList<repository.PhotosSnapshot>? snapshots, bool? hasMore}) {
    return PhotosListBlocData(
      snapshots: snapshots ?? this.snapshots,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
