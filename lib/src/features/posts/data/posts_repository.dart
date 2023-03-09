import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/constants.dart';
import '../../../core/services/cors_interceptor.dart';
import '../model/paginated_posts.dart';
import '../model/post.dart';

abstract class PostsRepositoryInterface {
  Future<PaginatedPostsDto> getPosts({Map<String, dynamic>? queryParameters});
  Future<PostDto> getPost(int id, {Map<String, dynamic>? queryParameters});
  void dispose();
}

class PostsRepository implements PostsRepositoryInterface {
  final Dio client;
  PostsRepository({
    required this.client,
  });

  @override
  void dispose() {
    client.close();
  }

  @override
  Future<PostDto> getPost(int id,
      {Map<String, dynamic>? queryParameters}) async {
    final re = await client.get("posts/${id.toString()}",
        queryParameters: queryParameters);
    return PostDto.fromJson(re.data);
  }

  @override
  Future<PaginatedPostsDto> getPosts(
      {Map<String, dynamic>? queryParameters}) async {
    final re = await client.get("posts", queryParameters: queryParameters);
    return PaginatedPostsDto.fromJson({
      "totalCount": (re.data as List).length,
      "items": re.data,
    });
  }
}

final postsRepositoryProvider = Provider<PostsRepositoryInterface>((ref) {
  final baseOptions = BaseOptions(
    baseUrl: jsonPlaceholderAPIbaseUrl,
    connectTimeout: const Duration(milliseconds: 60000),
    receiveTimeout: const Duration(milliseconds: 30000),
    extra: {"needsCors": true},
  );
  final Dio client = Dio(baseOptions);
  client.interceptors.addAll([CorsInterceptor()]);
  final repo = PostsRepository(client: client);
  ref.onDispose(() => repo.dispose());
  return repo;
});
