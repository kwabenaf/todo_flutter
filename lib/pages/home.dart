import 'package:flutter/material.dart';
import 'package:tut_todo/util/todo_tile.dart';

import '../constants/colors.dart';
import '../util/dialog_box.dart';
//import '../model/todo.dart';
//import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //text controller
  final _controller = TextEditingController();

  // list of todo tasks
  List toDoList = [
    ["oh hell nah", false],
    ["did it work?", false],
  ];

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //save new task
  void saveNewTask() {
    setState(() {
      toDoList.add((_controller.text, false));
    });
    Navigator.of(context).pop();
  }

  //creating a new task
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sgGreen,
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
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
























/*
class _HomeState extends State<Home> {
  //reference to hive box
  final _mybox = Hive.openBox('mybox');
  TodoDatabase db = TodoDatabase();
/*
  final todosList = ToDo.todoList();
  List<ToDo> _foundTodos = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundTodos = todosList;
    super.initState();
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sgGreen,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: const Text(
                          'Thought List',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      /*for (ToDo todo in _foundTodos.reversed)
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),*/
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5,),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  /*child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                        hintText: 'Add a new task',
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {
                        _addToDoItem(_todoController.text);
                      },
                    )*/
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    //_addToDoItem(_todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tdpurp,
                    minimumSize: const Size(60, 60),
                    elevation: 10,
                  ),
                  child: const Text(
                    '+',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

/*
  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String todo) {
    final trimmedTodo = todo.trim();
    if (trimmedTodo.isNotEmpty) {
      setState(() {
        todosList.add(
          ToDo(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            todoText: trimmedTodo,
          ),
        );
      });

      _todoController.clear();
    }
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundTodos = results;
    });
  }

*/

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        //onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search Task',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
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
}
*/