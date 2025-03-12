import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_1_app/todo_cubit/todo_states.dart';

class TodoCubit extends Cubit<TodoStates> {
  TodoCubit() : super(TodoInitial());
  static TodoCubit get(context) => BlocProvider.of(context);

  List<String> todoList = [];

  addTodo({required String todo}) {
    todoList.add(todo);
    emit(TodoAddSuccess());
  }
  removeTodo({required int index}) {
    todoList.removeAt(index);
    emit(TodoRemoveSuccess());
  }
}
