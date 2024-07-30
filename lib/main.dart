// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:tooo_do_app/cards.dart';
import 'package:tooo_do_app/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Todo_app(),
    );
  }
}

class Todo_app extends StatefulWidget {
  const Todo_app({super.key});

  @override
  State<Todo_app> createState() => _Todo_appState();
}

//class for task(todo)
class Task {
  String Tittle;
  bool statues;
  Task({required this.Tittle, required this.statues});
}

class _Todo_appState extends State<Todo_app> {
  //list of todos
  List alltaskes = [];

//to delete task when click on "delete" icon
  delete(int clicktask) {
    setState(() {
      alltaskes.remove(alltaskes[clicktask]);
    });
  }

//to delete all taskes when clicking on icon in appar
  deleteall() {
    setState(() {
      alltaskes.removeRange(0, alltaskes.length);
    });
  }

//to change the statues of todo (complete or not completed)
  changeTask(int task) {
    setState(() {
      alltaskes[task].statues = !alltaskes[task].statues;
    });
  }

//to add new task when clicking on add in floating action button
  addnewTask() {
    setState(() {
      alltaskes.add(
        Task(Tittle: myController.text, statues: false),
      );
    });
  }

//create controller to get the text inside textfield in the dialog widget
  final myController = TextEditingController();

//to calculate the completed task
  completedTaskes() {
    int completedTaskes = 0;

    alltaskes.forEach((element) {
      if (element.statues) {
        completedTaskes++;
      }
    });
    return completedTaskes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Container(
                  padding: EdgeInsets.all(22),
                  height: 200,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        maxLength: 20,
                        decoration:
                            InputDecoration(labelText: ("Add new Task")),
                      ),
                      TextButton(
                          onPressed: () {
                            addnewTask();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(fontSize: 22),
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 84, 75, 75),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Color.fromARGB(255, 188, 178, 178),
        title: Text(
          "TO DO APP",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 28, 28, 27)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                deleteall();
              },
              icon: Icon(
                Icons.delete_forever,
                size: 40,
              ))
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            counter(
              alltodos: alltaskes.length,
              completed: completedTaskes(),
            ),
            Container(
              height: 520,
              color: Color.fromARGB(255, 211, 202, 202),
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: alltaskes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return (todocard(
                      //i will pass all information of these todocard in the widge
                      vartittle: alltaskes[index].Tittle,
                      doneOrnot: alltaskes[index].statues,
                      changeTask: changeTask,
                      index: index,
                      delete: delete,
                    ));
                  }),
            )

            //todocard(),
          ],
        ),
      ),
    );
  }
}
