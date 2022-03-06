import 'package:injectable/injectable.dart';
import 'package:typicode_photos/domain/photo.repository/photos_repository.dart';

import '../usecase.dart';

class ListPhotosUsecaseArgs {
  const ListPhotosUsecaseArgs({required this.start, required this.limit}); //
  final int start, limit;
}

@injectable
class ListPhotosUsecase implements Usecase<ListPhotosUsecaseArgs, Future<ListPhotosResult>> {
  const ListPhotosUsecase(this.repository);

  final PhotosRepository repository;

  @override
  Future<ListPhotosResult> call(ListPhotosUsecaseArgs args) async {
    final result = await repository.list(start: args.start, limit: args.limit);
    return result;
  }
}
