import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:typicode_photos/data/connectivity/connectivity_watcher.dart';
import 'package:typicode_photos/data/hive/hive_box_id.dart';
import 'package:typicode_photos/data/hive/hive_delegate.dart';
import 'package:typicode_photos/data/photo.repository.web/web_photos_repository.dart';
import 'package:typicode_photos/data/photo.services/hive_favorite_photos_service.dart';
import 'package:typicode_photos/domain/photo.repository/photos_repository.dart';
import 'package:typicode_photos/domain/photo.services/favorite_photos_service.dart';

import 'app_actions_delegate.dart';
import 'data/photo.repository.web/web_photos_client.dart';
import 'presentation/actions/actions_delegate.dart';
import 'state/app_state_manager.dart';

@module
abstract class RegisterModule {
  @singleton
  AppStateManager get appStateManager;

  @singleton
  ActionsDelegate createActionsDelegate(AppStateManager appStateManager) => AppActionsDelegate(appStateManager);

  @singleton
  PhotosRepository get photosRepository => WebPhotosRepository(client: WebPhotosClient(Dio()));

  @singleton
  ConnectivityWatcher get connectivityWatcher;

  @singleton
  HiveInterface get hiveInterface => Hive;

  @singleton
  HiveDelegate get hiveDelegate;

  @preResolve
  @singleton
  Future<FavoritePhotosService> createFavoritePhotosService(HiveDelegate hiveDelegate) async {
    final favoritesBox = await hiveDelegate.getBox<bool>(HiveBoxId.favoritePhotos);
    return HiveFavoritePhotosService(
      box: favoritesBox,
    );
  }
}
