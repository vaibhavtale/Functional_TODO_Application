import 'package:flutter/material.dart';
import 'package:getx_tutorial/model/colors.dart';

import 'model/to_do.dart';

class ToDoItem extends StatelessWidget {

  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  ToDoItem({Key? key, required this.todo, required this.onToDoChanged, required this.onDeleteItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          //print("Yeah SOMEONE Tapped...");
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          todo.todo_text.toString(),
          style: TextStyle(
              decoration: todo.isDone ? TextDecoration.lineThrough : null
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.deepOrange,
          ),
          onPressed: () {
            //print("Task Deleted");
            onDeleteItem(todo.id);
          },
        ),
      ),
    );
  }
}
