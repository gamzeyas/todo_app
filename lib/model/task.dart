import 'package:to_do_app/constants/tasktype.dart';

class Task {
  Task(
      {required this.type,
      required this.title,
      required this.descripton,
      required this.isCompleted});
  final TaskType type;
  final String title;
  final String descripton;
  bool isCompleted;
}
