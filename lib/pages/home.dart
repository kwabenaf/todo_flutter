import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tut_todo/data/database.dart';
import 'package:tut_todo/util/todo_tile.dart';
import 'package:tut_todo/util/search_bar.dart' as CustomSearchBar;

import '../constants/colors.dart';
import '../util/dialog_box.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _mybox = Hive.box('mybox'); // Reference to Hive box
  final TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    // If this is the first time ever opening the app, create default data
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // Data already exists, load it
      db.loadData();
    }

    super.initState();
  }

  final _controller =
      TextEditingController(); // Text controller for new task input

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] =
          !db.toDoList[index][1]; // Toggle the completion status
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]); // Add a new task
      _controller.clear(); // Clear the input field
    });
    Navigator.of(context).pop(); // Close the dialog
    db.updateData();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (builder) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index); // Remove a task
    });
    db.updateData();
  }

  void _runFilter(String enteredKeyword) {
    setState(() {
      db.setSearchKeyword(enteredKeyword); // Update the search keyword
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sgGreen,
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: CustomSearchBar.SearchBar(
                onSearchChanged: _runFilter), // Custom search bar
          ),
          Expanded(
            child: ListView.builder(
              itemCount: db.filteredToDoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskName: db.filteredToDoList[index][0],
                  taskCompleted: db.filteredToDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunction: (context) => deleteTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.menu,
          color: tdBlack,
          size: 30,
        ),
        SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/tree.jpg'),
          ),
        )
      ],
    ),
    backgroundColor: sgGreen,
  );
}
