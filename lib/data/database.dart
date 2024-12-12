import 'package:hive/hive.dart';

class TodoDatabase {
  List todoList = [];

  // reference to the database
  final _myBox = Hive.box('todo');

  // Create the initial data if it's the first time ever opening this app
  void createInitialData() {
    todoList = [
      ['Buy groceries', false],
      ['Go to the gym', false],
      ['Learn Flutter', false],
    ];
  }

  // Load the data from the database
  void loadData() {
    todoList = _myBox.get('TODOLIST', defaultValue: todoList);
  }

  // Update the data in the database
  void updateData() {
    _myBox.put('TODOLIST', todoList);
  }
}
