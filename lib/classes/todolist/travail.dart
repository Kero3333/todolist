import 'tache.dart';

class Travail extends Tache {
  Travail(String name) : super(name, Theme.travail);

  @override
  String toString() {
    return "$name ---- ${isChecked ? '🗹' : '☐'}";
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
