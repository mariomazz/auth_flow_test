import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/posts_repository.dart';
import '../model/paginated_posts.dart';
import '../model/post.dart';

class PostsService {
  final PostsRepositoryInterface repo;
  PostsService({
    required this.repo,
  });

  Future<PostDto> getPost(
    int id, {
    Map<String, dynamic>? queryParameters,
  }) async =>
      await repo.getPost(id, queryParameters: queryParameters);

  Future<PaginatedPostsDto> getPosts({
    Map<String, dynamic>? queryParameters,
  }) async =>
      await repo.getPosts(queryParameters: queryParameters);
}

final postsServiceProvider = Provider<PostsService>((ref) {
  return PostsService(repo: ref.watch(postsRepositoryProvider));
});
