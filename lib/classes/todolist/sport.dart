import 'tache.dart';

class Sport extends Tache {
  Duration? time;

  Sport(String name, this.time) : super(name, Theme.sport);

  @override
  String toString() {
    return "$name ---- ${time?.inSeconds} ---- ${isChecked ? '🗹' : '☐'}";
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
