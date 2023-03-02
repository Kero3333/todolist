import 'task.dart';

class Course extends Task {
  int quantity = 0;
  Course(String name, this.quantity) : super(name, Theme.course);

  @override
  String toString() {
    return "$name";
  }

  get getQuantity => quantity;
}
