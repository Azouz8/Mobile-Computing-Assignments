import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_1_app/todo_cubit/todo_cubit.dart';
import 'package:lab_1_app/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => TodoCubit(),
        child: Scaffold(body: HomeViewBody()));
  }
}
