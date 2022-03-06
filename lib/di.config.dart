// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import 'data/connectivity/connectivity_watcher.dart' as _i4;
import 'data/hive/hive_delegate.dart' as _i9;
import 'di_module.dart' as _i17;
import 'domain/photo.repository/photos_repository.dart' as _i6;
import 'domain/photo.services/favorite_photos_service.dart' as _i13;
import 'domain/photo.usecases/is_favorite_usecase.dart' as _i14;
import 'domain/photo.usecases/list_photos_usecase.dart' as _i10;
import 'domain/photo.usecases/mark_favorite_usecase.dart' as _i15;
import 'presentation/actions/actions_delegate.dart' as _i7;
import 'presentation/actions/photo.actions/open_photo_action.dart' as _i11;
import 'presentation/features/favorites/blocs/favorite_photos_bloc.dart'
    as _i16;
import 'presentation/features/photos_list/blocs/photos_list_bloc.dart' as _i12;
import 'presentation/navigation/app_router.dart' as _i8;
import 'state/app_state_manager.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule(get);
  gh.singleton<_i3.AppStateManager>(registerModule.appStateManager);
  gh.singleton<_i4.ConnectivityWatcher>(registerModule.connectivityWatcher);
  gh.singleton<_i5.HiveInterface>(registerModule.hiveInterface);
  gh.singleton<_i6.PhotosRepository>(registerModule.photosRepository);
  gh.singleton<_i7.ActionsDelegate>(
      registerModule.createActionsDelegate(get<_i3.AppStateManager>()));
  gh.factory<_i8.AppRouter>(() =>
      _i8.AppRouter(get<_i7.ActionsDelegate>(), get<_i3.AppStateManager>()));
  gh.singleton<_i9.HiveDelegate>(registerModule.hiveDelegate);
  gh.factory<_i10.ListPhotosUsecase>(
      () => _i10.ListPhotosUsecase(get<_i6.PhotosRepository>()));
  gh.factory<_i11.OpenPhotoAction>(
      () => _i11.OpenPhotoAction(get<_i7.ActionsDelegate>()));
  gh.factory<_i12.PhotosListBloc>(() => _i12.PhotosListBloc(
      get<_i10.ListPhotosUsecase>(), get<_i11.OpenPhotoAction>()));
  await gh.singletonAsync<_i13.FavoritePhotosService>(
      () => registerModule.createFavoritePhotosService(get<_i9.HiveDelegate>()),
      preResolve: true);
  gh.factory<_i14.IsFavoriteUsecase>(
      () => _i14.IsFavoriteUsecase(get<_i13.FavoritePhotosService>()));
  gh.factory<_i15.MarkFavoriteUsecase>(
      () => _i15.MarkFavoriteUsecase(get<_i13.FavoritePhotosService>()));
  gh.factory<_i16.FavoritePhotosBloc>(() => _i16.FavoritePhotosBloc(
      get<_i15.MarkFavoriteUsecase>(), get<_i14.IsFavoriteUsecase>()));
  return get;
}

class _$RegisterModule extends _i17.RegisterModule {
  _$RegisterModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i3.AppStateManager get appStateManager => _i3.AppStateManager();
  @override
  _i4.ConnectivityWatcher get connectivityWatcher => _i4.ConnectivityWatcher();
  @override
  _i9.HiveDelegate get hiveDelegate =>
      _i9.HiveDelegate(_getIt<_i5.HiveInterface>());
}
