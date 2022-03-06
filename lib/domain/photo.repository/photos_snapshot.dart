import 'package:equatable/equatable.dart';
import 'package:kt_dart/kt.dart';

import '../photo.entities/photo.dart';

class PhotosSnapshot extends Equatable {
  const PhotosSnapshot._({required this.photos, required this.start, required this.limit});

  final KtList<Photo> photos;
  final int start; // an offset from the data beginning
  final int limit; // just a max limit of the data at once

  @override
  List<Object?> get props => [photos, start, limit];

  // The only factory that has the obvious meaning
  //  and we should create a new instance with at least one element
  factory PhotosSnapshot.notEmpty({required KtList<Photo> photos, required int start, required int limit}) {
    assert(photos.isNotEmpty());
    return PhotosSnapshot._(photos: photos, start: start, limit: limit);
  }
}
