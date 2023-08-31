import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List toDoList = [];

  //reference to hive box
  final _myBox = Hive.box('mybox');

  //run this if it is the first time ever
  //opening this app
  void createInitialData() {
    toDoList = [
      ["Skate", false],
      ["Create an app", true]
    ];
  }

  //load the data from db
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update the db
  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}
