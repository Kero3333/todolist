import 'task.dart';

class Sport extends Task {
  Duration? time;

  Sport(String name, this.time) : super(name, Theme.sport);

  @override
  String toString() {
    return "$name";
  }
}
