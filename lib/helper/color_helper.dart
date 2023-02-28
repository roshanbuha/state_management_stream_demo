import 'package:rxdart/rxdart.dart';

class TodoHelper {
  ///Singletone
  static final TodoHelper _instance = TodoHelper._internal();

  factory TodoHelper() => _instance;

  TodoHelper._internal();

  final todoListStream = BehaviorSubject<int>.seeded(0);

  void incrementCount() {
    todoListStream.add(todoListStream.value + 1);
  }

  // void addTodo(TodoModel model) {
  //   List<TodoModel> todoList = todoListStream.value;
  //   todoList.add(model);
  //
  //   todoListStream.sink.add(todoList);
  // }
}
