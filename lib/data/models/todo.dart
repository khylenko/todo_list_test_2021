import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String value;

  Todo(this.id, this.value);

  @override
  List<Object?> get props => [id, value];
}
