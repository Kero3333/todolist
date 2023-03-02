import 'task.dart';

class Travail extends Task {
  Travail(String name) : super(name, Theme.travail);

  @override
  String toString() {
    return "$name ---- ${isChecked ? '🗹' : '☐'}";
  }
}
