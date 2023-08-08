import 'package:flutter/material.dart';
import 'todolists.dart';
import 'modelTodo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final todolist = ToDo.todolist();
  final _todocontroller = TextEditingController();

  void _todoState(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void todoDelete(String id) {
   
   
    setState(() {
       todolist.removeWhere((item) => item.id == id);
      
    });
  }

  void _addToDO(String toDo) {
   setState(() {
      todolist.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(), 
        todoText: toDo));
   });
        _todocontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.menu),
            Text('TODO APP2'),
            CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Icon(Icons.person),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.grey[300],
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(Icons.search),
                      label: Text('Search'),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      const Text(
                        'TODO LIST',
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      for (ToDo todo in todolist)
                        TODO(
                          todo: todo,
                          ontap: _todoState,
                          delete: todoDelete,
                        )
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.all(20),
                    child:  TextField(
                      controller: _todocontroller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                        hintText: 'Add a New Task todo',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.purpleAccent,
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.fromLTRB(5, 5, 20, 5),
                  child: ElevatedButton(
                      onPressed: () {
                        _addToDO(_todocontroller.text);
                      },
                      child: const Text(
                        '+',
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
