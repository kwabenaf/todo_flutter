import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List toDoList = [];
  String _searchKeyword = ''; // New private field for search keyword

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

// Method to set the search keyword
  void setSearchKeyword(String keyword) {
    _searchKeyword = keyword;
  }

  // Method to get the filtered todo list based on search keyword
  List<dynamic> get filteredToDoList {
    if (_searchKeyword.isEmpty) {
      return toDoList;
    } else {
      return toDoList.where((task) {
        return task[0].toLowerCase().contains(_searchKeyword.toLowerCase());
      }).toList();
    }
  }
}
