import 'package:flutter/material.dart';
import 'package:to_do_app/constants/tasktype.dart';
import 'package:to_do_app/model/task.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key, required this.addNewTask});

  final void Function(Task newTask) addNewTask;

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TaskType taskType = TaskType.note;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: devicewidth,
              height: deviceHeight / 10,
              color: Colors.purple,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.white,
                      )),
                  const Expanded(
                      child: Text(
                    'Add New Task',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                  )),
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 10), child: Text('Task Title')),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    filled: true, fillColor: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Category'),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 300),
                          content: Text("Category selected")));
                      setState(() {
                        taskType = TaskType.note;
                      });
                    },
                    child: Image.asset("assets/Category.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 300),
                          content: Text("Category selected")));
                      setState(() {
                        taskType = TaskType.calendar;
                      });
                    },
                    child: Image.asset("assets/Category2.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 300),
                          content: Text("Category selected")));
                      setState(() {
                        taskType = TaskType.contest;
                      });
                    },
                    child: Image.asset("assets/Category3.png"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            const Text("Date"),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  controller: dateController,
                                  decoration: const InputDecoration(
                                      filled: true, fillColor: Colors.white),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            const Text("Time"),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                    controller: timeController,
                                    decoration: const InputDecoration(
                                        filled: true, fillColor: Colors.white)))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 10), child: Text('Descripton')),
            SizedBox(
              height: 300,
              child: TextField(
                controller: descriptionController,
                expands: true,
                maxLines: null,
                decoration: const InputDecoration(
                    filled: true, fillColor: Colors.white, isDense: true),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Task newTask = Task(
                    type: taskType,
                    title: titleController.text,
                    descripton: descriptionController.text,
                    isCompleted: false);
                widget.addNewTask(newTask);
                Navigator.pop(context);
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.purple),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))))),
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
