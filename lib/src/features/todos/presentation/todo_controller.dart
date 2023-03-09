import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../application/todos_service.dart';
import '../model/todo.dart';
part 'todo_controller.g.dart';

@riverpod
class TodoController extends _$TodoController {
  @override
  FutureOr<TodoDto> build(int id) async {
    final todosService = ref.read(todosServiceProvider);
    return await todosService.getTodo(id);
  }
}
