import 'package:flutter/material.dart';
import 'package:to_do_app/constants/tasktype.dart';
import 'package:to_do_app/model/task.dart';

class CustomCardWidget extends StatefulWidget {
  const CustomCardWidget({super.key, required this.task});
  final Task task;

  @override
  State<CustomCardWidget> createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.isCompleted ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.task.type == TaskType.note
                ? Image.asset("assets/Category.png")
                : widget.task.type == TaskType.contest
                    ? Image.asset("assets/Category3.png")
                    : Image.asset("assets/Category2.png"),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        decoration: widget.task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  Text(
                    widget.task.descripton,
                    style: TextStyle(
                        decoration: widget.task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  )
                ],
              ),
            ),
            Checkbox(
                value: isChecked,
                onChanged: (val) {
                  setState(() {
                    widget.task.isCompleted = !widget.task.isCompleted;
                    isChecked = val!;
                  });
                })
          ],
        ),
      ),
    );
  }
}
