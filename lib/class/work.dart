import 'task.dart';

class Work extends Task {
  Work(String name) : super(name, Theme.work);

  @override
  String toString() {
    return "$name ---- ${isChecked ? '🗹' : '☐'}";
  }
}
