import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.g.dart';

typedef PhotoId = int;

@JsonSerializable()
class Photo extends Equatable {
  const Photo({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  final PhotoId id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  factory Photo.fromJson(Map<String, dynamic> json) {
    return _$PhotoFromJson(json);
  }

  @override
  List<Object?> get props => [id, url];
}
