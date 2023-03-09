import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/photos_repository.dart';
import '../model/photo.dart';
part 'photos_service.g.dart';

class PhotosService {
  final PhotosRepositoryInterface todosRepo;
  PhotosService({
    required this.todosRepo,
  });

  Future<List<PhotoDto>> getPhotos(
      {Map<String, dynamic>? queryParameters}) async {
    return await todosRepo.getPhotos(queryParameters: queryParameters);
  }

  Future<PhotoDto> getPhoto(int id,
      {Map<String, dynamic>? queryParameters}) async {
    return await todosRepo.getPhoto(id, queryParameters: queryParameters);
  }
}

@Riverpod(keepAlive: true)
PhotosService photosService(PhotosServiceRef ref) {
  final service = PhotosService(todosRepo: ref.watch(photosRepositoryProvider));

  return service;
}
