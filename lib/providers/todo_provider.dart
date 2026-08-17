import 'package:dio/dio.dart';
import 'package:todo/models/todo.dart';

class TodoProvider {
  final _http = Dio(BaseOptions(
      baseUrl: 'https://api.todoist.com/api/v1',
      headers: {'Authorization': 'Bearer 3f74cc166c6b9eb6e98419bc7c5fb0a960e52363'}));

  TodoProvider() {
    _http.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      responseHeader: true,
      requestHeader: true,
    ));
  }

  Future<List<Todo>> getAllTodos() async {
    final response = await _http.get<List>('/tasks');
    return response.data?.map((todoJson) => Todo.fromJson(todoJson)).toList() ?? [];
  }

  Future<Todo> createNewTodo({
    required String title,
    String? description,
    int? priority,
    DateTime? dueDate,
  }) async {
    final response = await _http.post(
      '/tasks',
      data: {
        'content': title,
        'description': description,
        'priority': priority,
        if (dueDate != null) 'due_datetime': dueDate.toString(),
      },
    );

    return Todo.fromJson(response.data);
  }

  Future<void> completeTodo(String id) async {
    await _http.post('/tasks/$id/close');
  }

  Future<void> deleteTodo(String id) async {
    await _http.delete('/tasks/$id');
  }
}
