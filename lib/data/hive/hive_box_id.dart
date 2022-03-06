//

enum HiveBoxId {
  favoritePhotos,
}

extension HiveBoxIdX on HiveBoxId {
  String get boxName {
    switch (this) {
      case HiveBoxId.favoritePhotos:
        return 'favorite-photos-box';
      default:
        throw ArgumentError.value(this);
    }
  }
}
