import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_test/bloc/todo/todo_bloc.dart';
import 'package:to_do_list_test/data/models/todo.dart';
import 'package:to_do_list_test/utils/locator.dart';
import 'package:to_do_list_test/view/home_page.dart';

void main() async {
  locatorSetup();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox('todos');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: MaterialApp(
        title: 'ToDo List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            textTheme: TextTheme(
              headline6: TextStyle(color: Colors.black),
            ),
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
