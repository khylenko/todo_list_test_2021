import 'package:get_it/get_it.dart';
import 'package:to_do_list_test/data/repo/todo_repo.dart';

final locator = GetIt.instance;

void locatorSetup() {
  // REPO
  locator.registerLazySingleton<TodoRepo>(() => TodoRepo());
}
