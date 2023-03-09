import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common/constants.dart';
import '../../../core/services/cors_interceptor.dart';
import '../model/photo.dart';
part 'photos_repository.g.dart';

abstract class PhotosRepositoryInterface {
  Future<List<PhotoDto>> getPhotos({Map<String, dynamic>? queryParameters});
  Future<PhotoDto> getPhoto(int id, {Map<String, dynamic>? queryParameters});
  void dispose();
}

class PhotosRepository implements PhotosRepositoryInterface {
  final Dio client;
  PhotosRepository({
    required this.client,
  });

  @override
  Future<PhotoDto> getPhoto(int id,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final re = await client.get("photos/${id.toString()}",
          queryParameters: queryParameters);
      return PhotoDto.fromJson(re.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  @override
  Future<List<PhotoDto>> getPhotos(
      {Map<String, dynamic>? queryParameters}) async {
    final res = await client.get("photos", queryParameters: queryParameters);
    return photosFromList(res.data);
  }

  @override
  void dispose() {
    client.close();
  }
}

@Riverpod(keepAlive: true)
PhotosRepositoryInterface photosRepository(PhotosRepositoryRef ref) {
  final BaseOptions options = BaseOptions(
    connectTimeout: const Duration(milliseconds: 60000),
    receiveTimeout: const Duration(milliseconds: 30000),
    baseUrl: jsonPlaceholderAPIbaseUrl,
    extra: {"needsCors": true},
  );
  final Dio client = Dio(options);
  client.interceptors.addAll([CorsInterceptor()]);
  final repo = PhotosRepository(client: client);
  ref.onDispose(() => repo.dispose());
  return repo;
}
