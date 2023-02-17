import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_tutorial/todo_item.dart';
import 'model/colors.dart';
import 'model/to_do.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDO = [];
  final _todocontroller = TextEditingController();

  @override

  void initState() {
    // TODO: implement initState
    _foundToDO = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    onChanged: (Value) => _runFilter(Value),
                    decoration: InputDecoration(
                        // contentPadding: EdgeInsets.all(0),
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                Expanded(
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 50, bottom: 20),
                          child: Text(
                            "Action Plan",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                       for (ToDo task in _foundToDO.reversed)
                          ToDoItem(
                            todo: task,
                            onToDoChanged: _handleToDoChange,
                            onDeleteItem: _deleteToDoItem,
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    margin: EdgeInsets.only(bottom: 20,left: 20,right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0,0.0),
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                      controller: _todocontroller,
                      decoration: InputDecoration(
                        hintText: "Add New TODO Item..",
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                Container(

                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToDoItem(_todocontroller.text);
                    },
                    child: Text("+", style: TextStyle(fontSize: 40),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent,
                      elevation: 10,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            size: 30,
            color: tdBlack,
          ),
          Container(
            width: 40,
            height: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "asset/profile.jpg",
                  fit: BoxFit.cover,
                )),
          )
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo){
    setState(() {
    todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id){

    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _runFilter(String enteredKeyword){

    List<ToDo> results = [];

    if(enteredKeyword.isEmpty){

      results = todosList;
    }
    else{
      results = todosList.where((item) => item.todo_text!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _foundToDO = results;
    });
  }

  void _addToDoItem(String toDo){

    setState(() {
      todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todo_text: toDo));
    });
    _todocontroller.clear();
  }
}
