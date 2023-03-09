import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common/constants.dart';
import '../../../core/services/cors_interceptor.dart';
import '../model/todo.dart';
part 'todos_repository.g.dart';

abstract class TodosRepositoryInterface {
  Future<List<TodoDto>> getTodos({Map<String, dynamic>? queryParameters});
  Future<TodoDto> getTodo(int id, {Map<String, dynamic>? queryParameters});
  void dispose();
}

class TodosRepository implements TodosRepositoryInterface {
  final Dio client;
  TodosRepository({
    required this.client,
  });
  @override
  Future<TodoDto> getTodo(int id,
      {Map<String, dynamic>? queryParameters}) async {
    final re = await client.get("todos/${id.toString()}",
        queryParameters: queryParameters);
    return TodoDto.fromJson(re.data);
  }

  @override
  Future<List<TodoDto>> getTodos(
      {Map<String, dynamic>? queryParameters}) async {
    final re = await client.get("todos", queryParameters: queryParameters);
    return todosFromList(re.data);
  }

  @override
  void dispose() {
    client.close();
  }
}

@Riverpod(keepAlive: true)
TodosRepositoryInterface todosRepository(TodosRepositoryRef ref) {
  final BaseOptions options = BaseOptions(
    connectTimeout: const Duration(milliseconds: 60000),
    receiveTimeout: const Duration(milliseconds: 30000),
    baseUrl: jsonPlaceholderAPIbaseUrl,
    extra: {"needsCors": true},
  );
  final Dio client = Dio(options);
  client.interceptors.addAll([CorsInterceptor()]);
  final authRepo = TodosRepository(client: client);
  ref.onDispose(() => authRepo.dispose());
  return authRepo;
}
