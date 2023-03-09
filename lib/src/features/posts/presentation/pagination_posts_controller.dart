import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import '../application/posts_service.dart';
import '../model/post.dart';

class PaginationPostsController extends PagedNotifier<int, PostDto> {
  final PostsService postsService;
  PaginationPostsController({required this.postsService})
      : super(
          load: (page, limit) async => (await postsService
                  .getPosts(queryParameters: {"PageNumber": page.toString()}))
              .items,
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
        );
}

final paginationPostsControllerProvider =
    StateNotifierProvider<PaginationPostsController, PagedState<int, PostDto>>(
        (ref) => PaginationPostsController(
            postsService: ref.watch(postsServiceProvider)));
