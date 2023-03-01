import 'tache.dart';

class Course extends Tache {
  int quantity = 0;
  Course(String name, this.quantity) : super(name, Theme.course);

  @override
  String toString() {
    return "$name ---- quantity: $quantity ----- ${isChecked ? '🗹' : '☐'}";
  }

  @override
  void toChecked() {
    isChecked = true;
  }

  @override
  void toUnchecked() {
    isChecked = false;
  }
}
