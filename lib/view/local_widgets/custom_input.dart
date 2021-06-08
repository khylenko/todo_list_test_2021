import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_test/bloc/todo/todo_bloc.dart';

class CustomInput extends StatelessWidget with PreferredSizeWidget {
  const CustomInput({
    Key? key,
    required TextEditingController controller,
    required this.animatedKkey,
    required this.length,
    required this.scrollController,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final GlobalKey<AnimatedListState> animatedKkey;
  final int length;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 8.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ),
          SizedBox(
            width: 16.0,
          ),
          TextButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  animatedKkey.currentState?.insertItem(length);
                  context.read<TodoBloc>().add(AddTodo(_controller.text));
                  _controller.clear();
                  scrollController.animateTo(
                    scrollController.offset + 150,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
                }
              },
              child: Icon(
                Icons.add,
                size: 36,
                color: _controller.text.isNotEmpty ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
