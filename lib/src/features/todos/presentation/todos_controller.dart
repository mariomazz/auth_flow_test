import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../application/todos_service.dart';
import '../model/todo.dart';
part 'todos_controller.g.dart';

@riverpod
class TodosController extends _$TodosController {
  Future<void> didFilterChange({bool ascending = true}) async {
    final todosService = ref.read(todosServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => todosService.getTodos(queryParameters: {"Ascending": ascending}));
  }

  @override
  FutureOr<List<TodoDto>> build() async {
    final todosService = ref.read(todosServiceProvider);
    return await todosService.getTodos(queryParameters: {"Ascending": true});
  }
}
