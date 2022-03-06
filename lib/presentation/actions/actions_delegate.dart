import 'package:typicode_photos/domain/photo.repository/photos_repository.dart' as repository;
import 'package:rxdart/rxdart.dart';

abstract class ActionsDelegate {
  final photoOpen = PublishSubject<repository.Photo>();
}
