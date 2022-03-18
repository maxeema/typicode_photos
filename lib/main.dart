import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:typicode_photos/presentation/features/favorites/blocs/favorite_photos_bloc.dart';

import 'di.dart';
import 'my_app.dart';
import 'my_http_overrides.dart';
import 'presentation/features/photos_list/blocs/photos_list_bloc.dart';
import 'presentation/generated/l10n.dart';

// Tip: if Image.remote() failed to load & renderer images then:
// • on Mobile/Emulators try to override HttpOverrides.global
// • on Flutter Web add the "--web-renderer html" arguments

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Prepare dependencies
  final saveDir = await path.getApplicationDocumentsDirectory();
  Hive.init(saveDir.path + '/hive_db');
  await configureDependencies(environmentFilter: SimpleEnvironmentFilter(filter: (_) => true));
  // Fix a certificate issue loading https images with Image.remote()
  HttpOverrides.global = MyHttpOverrides();
  // Preload localization in advance to make it available in the MaterialApp of MyApp
  await S.load(const Locale('en'));
  // Now, run the app
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<PhotosListBloc>(create: (_) => getIt()),
      BlocProvider<FavoritePhotosBloc>(create: (_) => getIt()),
    ],
    child: const MyApp(),
  ));
}
