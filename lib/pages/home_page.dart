import 'package:flutter/material.dart';
import 'package:to_do_app/constants/tasktype.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/pages/add_new_task.dart';
import 'package:to_do_app/widgets/custom_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//List<String> todo = ['Study Lessons', 'Run 5K', 'Go to party'];
//List<String> completed = ['Game meetup', 'Take out trash'];

List<Task> todo = [
  Task(
      type: TaskType.calendar,
      title: "Study Lessons",
      descripton: "Study completed",
      isCompleted: false),
  Task(
      type: TaskType.note,
      title: "Run 5K",
      descripton: "Run 5 kilometers",
      isCompleted: false),
  Task(
      type: TaskType.contest,
      title: "Go to party",
      descripton: "Atten to party",
      isCompleted: false),
];

List<Task> completed = [
  Task(
      type: TaskType.contest,
      title: "Game meetup",
      descripton: "Went to meet",
      isCompleted: false),
  Task(
      type: TaskType.note,
      title: "Take out trash",
      descripton: "Trash thrown away ",
      isCompleted: false)
];

class _HomePageState extends State<HomePage> {
  bool isChecked = false;
  void addNewTask(Task newTask) {
    setState(() {
      todo.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Column(children: [
          Container(
            width: devicewidth,
            height: deviceHeight / 3,
            color: Colors.purple,
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "11 May, 2024",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    "My To Do List",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: SingleChildScrollView(
                  child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: todo.length,
                itemBuilder: (context, index) {
                  return CustomCardWidget(
                    task: todo[index],
                  );
                },
              )),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Completed",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: completed.length,
              itemBuilder: (context, index) {
                return CustomCardWidget(
                  task: completed[index],
                );
              },
            ),
          )),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    AddNewTask(addNewTask: (newTask) => addNewTask(newTask)),
              ));
            },
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromRGBO(156, 39, 176, 1)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))))),
            child: const Text(
              'Add New Task',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
