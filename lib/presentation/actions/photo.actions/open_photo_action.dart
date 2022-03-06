import 'package:injectable/injectable.dart';
import 'package:typicode_photos/domain/photo.repository/photos_repository.dart' as repository;

import '../action.dart';
import '../actions_delegate.dart';

@injectable
class OpenPhotoAction implements Action {
  const OpenPhotoAction(
    this.delegate,
  );

  final ActionsDelegate delegate;

  @override
  void call(covariant repository.Photo photo) => delegate.photoOpen.add(photo);
}
