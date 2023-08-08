import 'package:flutter/material.dart';
import 'modelTodo.dart';

class TODO extends StatelessWidget {
  final ToDo todo;
  final ontap;
  final delete;
  const TODO(
      {super.key,
      required this.todo,
      required this.ontap,
      required this.delete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        onTap: () {
          ontap(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.purple,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            onPressed: () => delete(todo.id),
            icon: const Icon(Icons.delete),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
