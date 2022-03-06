import 'package:dio/dio.dart' hide Headers;
import 'package:typicode_photos/domain/photo.entities/photo.dart';
import 'package:retrofit/retrofit.dart';

part 'web_photos_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class WebPhotosClient {
  factory WebPhotosClient(Dio dio, {String baseUrl}) = _WebPhotosClient;

  @GET("photos/")
  Future<List<Photo>> getPhotos({@Query("_start") required int start, @Query("_limit") required int limit});
}
