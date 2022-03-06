import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:typicode_photos/extensions/duration_x.dart';
import 'package:typicode_photos/presentation/actions/actions_delegate.dart';
import 'package:typicode_photos/presentation/features/photos_list/widgets/photos_list_full_photo_widget.dart';
import 'package:typicode_photos/presentation/features/photos_list/widgets/photos_list_page.dart';
import 'package:typicode_photos/presentation/features/splash/widgets/splash_page.dart';
import 'package:typicode_photos/presentation/generated/assets.gen.dart';
import 'package:typicode_photos/state/app_state_manager.dart';

import 'app_routes.dart';

const _initialLocation = AppRoutes.photosList;

@injectable
class AppRouter extends GoRouter {
  final ActionsDelegate _actionsDelegate; //
  final AppStateManager _appStateManager;

  AppRouter(this._actionsDelegate, this._appStateManager)
      : super(
          refreshListenable: Listenable.merge([
            // Declare here listenable items we want to react on
            // (it also could be streams wrapped with GoRouterRefreshStream)
            _appStateManager,
          ]),
          redirect: (state) {
            if (state.subloc != AppRoutes.splash && _appStateManager.state.initialized != true) {
              var splashLoc = AppRoutes.splash;
              if (state.subloc != '/') {
                splashLoc += '?from=${state.subloc}';
              }
              return splashLoc;
            }
            if (state.subloc == AppRoutes.splash && _appStateManager.state.initialized == true) {
              final from = state.queryParams['from'];
              return from ?? _initialLocation;
            }
            return null;
          },
          initialLocation: _initialLocation,
          routes: [
            GoRoute(
              path: AppRoutes.splash,
              pageBuilder: (context, state) {
                return MaterialPage(
                  // key: state.pageKey,
                  child: SplashPage(
                    splashImage: Assets.splash,
                    onFirstFrame: () async {
                      await 1000.ms.delay;
                      // We just emulate the initializing process with a small delay
                      _appStateManager.setInitialized(true);
                    },
                  ),
                );
              },
            ),
            GoRoute(
              path: AppRoutes.photosList,
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: PhotosListPage(bloc: context.read()),
                );
              },
              // routes: [
              //   GoRoute(
              //     path: AppRoutes.photoDetails,
              //     pageBuilder: (context, state) {
              //       return MaterialPage(
              //         key: state.pageKey,
              //         fullscreenDialog: true,
              //         // child: PhotoDetailsPage(state.extra as repository.Photo),
              //         child: PhotosListFullSizePhotoWidget(state.extra as repository.Photo),
              //       );
              //     },
              //   ),
              // ],
            ),
          ],
        ) {
    //
    _init();
  }

  late final List<StreamSubscription> _subscriptions;

  void _init() {
    _subscriptions = [
      _actionsDelegate.photoOpen.listen((photo) {
        showDialog(
          context: navigator!.context,
          builder: (context) {
            return AlertDialog(
              content: PhotosListFullSizePhotoWidget(photo),
            );
          },
        );
        // go('${AppRoutes.photosList}/${AppRoutes.photoDetails}', extra: photo);
      }),
    ];
  }

  @override
  void dispose() {
    for (var subscription in _subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }
}
