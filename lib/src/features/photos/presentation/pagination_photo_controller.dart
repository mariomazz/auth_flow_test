import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import '../application/photos_service.dart';
import '../model/photo.dart';

class PaginationPhotosController extends PagedNotifier<int, PhotoDto> {
  final PhotosService postsService;
  PaginationPhotosController({required this.postsService})
      : super(
          load: (page, limit) async => (await postsService
              .getPhotos(queryParameters: {"PageNumber": page.toString()})),
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
        );
}

final paginationPhotosControllerProvider = StateNotifierProvider<
        PaginationPhotosController, PagedState<int, PhotoDto>>(
    (ref) => PaginationPhotosController(
        postsService: ref.watch(photosServiceProvider)));
