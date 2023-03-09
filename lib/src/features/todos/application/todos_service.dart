import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/todos_repository.dart';
import '../model/todo.dart';
part 'todos_service.g.dart';

class TodosService {
  final TodosRepositoryInterface todosRepo;
  TodosService({
    required this.todosRepo,
  });

  Future<List<TodoDto>> getTodos(
      {Map<String, dynamic>? queryParameters}) async {
    return await todosRepo.getTodos(queryParameters: queryParameters);
  }

  Future<TodoDto> getTodo(int id,
      {Map<String, dynamic>? queryParameters}) async {
    return await todosRepo.getTodo(id, queryParameters: queryParameters);
  }
}

@Riverpod(keepAlive: true)
TodosService todosService(TodosServiceRef ref) {
  final authService = TodosService(
    todosRepo: ref.watch(todosRepositoryProvider),
  );

  return authService;
}
