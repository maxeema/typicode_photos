import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:typicode_photos/domain/photo.entities/photo.dart';

part 'app_state.freezed.dart';

@freezed
class AppStateInfo with _$AppStateInfo {
  const factory AppStateInfo({
    bool? initialized,
    PhotoId? lastPhotoId,
  }) = _AppStateInfo;
}
