import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List toDoList = [];
  String _searchKeyword = ''; // New private field for search keyword

  // Reference to Hive box
  final _myBox = Hive.box('mybox');

  // Initialize the toDoList with default data
  void createInitialData() {
    toDoList = [
      ["Skate", false],
      ["Create an app", true]
    ];
  }

  // Load data from the database (Hive box)
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // Update data in the database (Hive box)
  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }

  // Method to set the search keyword for filtering
  void setSearchKeyword(String keyword) {
    _searchKeyword = keyword;
  }

  // Method to get the filtered todo list based on the search keyword
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
