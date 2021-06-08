import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_test/bloc/todo/todo_bloc.dart';

class TodosList extends StatelessWidget {
  final GlobalKey<AnimatedListState> animatedKkey;
  final Function(int) setLength;
  final ScrollController scrollController;
  const TodosList({
    Key? key,
    required this.animatedKkey,
    required this.setLength,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodosLoaded) {
          setLength(state.todos.length);
          return AnimatedList(
            key: animatedKkey,
            controller: scrollController,
            initialItemCount: state.todos.length,
            reverse: true,
            shrinkWrap: true,
            itemBuilder: (context, index, animation) {
              return ScaleTransition(
                key: Key(state.todos[index].id.toString()),
                scale: animation,
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: index == 0 ? 8.0 : 0,
                    top: 8.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    title: Text(
                      state.todos[index].value,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 32,
                      ),
                      onPressed: () {
                        context.read<TodoBloc>().add(RemoveTodo(index));
                        animatedKkey.currentState?.removeItem(
                            index, (context, animation) => Container());
                      },
                    ),
                  ),
                ),
              );
            },
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('No todos yet'), Text('press "+" to add')],
          ),
        );
      },
    );
  }
}
