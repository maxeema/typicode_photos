import 'package:flutter/cupertino.dart';
import 'package:typicode_photos/domain/photo.entities/photo.dart';

import 'app_state.dart';

class AppStateManager extends ValueNotifier<AppStateInfo> {
  AppStateManager() : super(const AppStateInfo()) {
    addListener(() => print('App state changed: $value'));
  }

  AppStateInfo get state => value;

  void setInitialized(bool initialized) => value = value.copyWith(initialized: initialized);

  void setLastPhoto(PhotoId photoId) => value = value.copyWith(lastPhotoId: photoId);
}
