import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';

class ConnectivityWatcher {
  ConnectivityWatcher() {
    _subs = Connectivity().onConnectivityChanged.listen(_onConnectivityChanged);
  }

  late final StreamSubscription _subs;
  var _status = ConnectivityResult.none;

  final _subject = PublishSubject<ConnectivityResult>(); //
  Stream<ConnectivityResult> get asStream => _subject; //.distinct();

  bool get hasNetwork => _status != ConnectivityResult.none;

  void _onConnectivityChanged(ConnectivityResult status) {
    _status = status;
    _subject.add(status);
  }

  @mustCallSuper
  void dispose() {
    _subs.cancel();
  }
}
