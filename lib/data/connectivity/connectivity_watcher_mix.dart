import 'package:typicode_photos/di.dart';

import 'connectivity_watcher.dart';

mixin ConnectivityWatcherMix {
  late final ConnectivityWatcher connectivity = getIt<ConnectivityWatcher>();
}
