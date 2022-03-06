import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'di.dart';
import 'presentation/const.dart';
import 'presentation/generated/l10n.dart';
import 'presentation/navigation/app_router.dart';

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = useMemoized(() => getIt<AppRouter>());
    final themeData = useMemoized(() => ThemeData.light());
    //
    return MaterialApp.router(
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
      localizationsDelegates: const [
        S.delegate,
      ],
      title: S.current.appName,
      themeMode: ThemeMode.light,
      theme: themeData.copyWith(
        colorScheme: themeData.colorScheme.copyWith(
          secondary: kAppColor,
        ),
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        // Enable scrolling on all devices (without it ListView doesn't react on pointer-scroll events)
        dragDevices: PointerDeviceKind.values.toSet(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
