import 'package:hive/hive.dart';

import 'hive_box_id.dart';

class HiveDelegate {
  const HiveDelegate(this._hive);

  final HiveInterface _hive; //

  Future<Box<T>> getBox<T>(HiveBoxId id) async {
    if (_hive.isBoxOpen(id.boxName)) {
      return _hive.box(id.boxName);
    }
    return await _hive.openBox(id.boxName);
  }
}
