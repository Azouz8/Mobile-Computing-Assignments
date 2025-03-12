import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_1_app/todo_cubit/todo_cubit.dart';
import 'package:lab_1_app/todo_cubit/todo_states.dart';
import 'custom_add_button.dart';
import 'custom_text_form_field.dart';
import 'no_todos_widget.dart';
import 'todo_list_view_item.dart';

class HomeViewBody extends StatelessWidget {
  HomeViewBody({super.key});
  final todoController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoStates>(
      builder: (context, state) {
        var cubit = TodoCubit.get(context);
        return SafeArea(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: CustomScrollView(
                physics: NeverScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Text(
                      "ToDo",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16)),
                  SliverToBoxAdapter(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Expanded(
                          flex: 3,
                          child: CustomTextFormField(
                            controller: todoController,
                            label: "What To Do?!",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This Field Must not be Empty!";
                              }
                              return null;
                            },
                            prefixIcon: Icon(Icons.task),
                          ),
                        ),
                        Expanded(
                          child: CustomAddButton(
                            formKey: formKey,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.addTodo(todo: todoController.text);
                                todoController.clear();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16)),
                  SliverFillRemaining(
                    child: cubit.todoList.isEmpty
                        ? NoTodosWidget()
                        : ListView.separated(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => ToDoListViewItem(
                              todo: cubit.todoList[index],
                              onChanged: (p0) {
                                cubit.removeTodo(index: index);
                              },
                            ),
                            itemCount: cubit.todoList.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    SizedBox(height: 8),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


