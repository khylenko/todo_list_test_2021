import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_test/bloc/todo/todo_bloc.dart';
import 'package:to_do_list_test/view/local_widgets/custom_input.dart';
import 'package:to_do_list_test/view/local_widgets/todos_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final animatedKkey = GlobalKey<AnimatedListState>();
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  int length = 0;

  @override
  void initState() {
    context.read<TodoBloc>().add(LoadTodos());
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void setLength(int value) => length = value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TODOS'),
          bottom: CustomInput(
            controller: _controller,
            animatedKkey: animatedKkey,
            length: length,
            scrollController: _scrollController,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TodosList(
            animatedKkey: animatedKkey,
            setLength: setLength,
            scrollController: _scrollController,
          ),
        ),
      ),
    );
  }
}
