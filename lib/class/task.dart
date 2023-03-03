// import 'dart:math';

enum Theme { course, sport, work }

abstract class Task {
  String? name;
  bool isChecked = false;
  Theme? theme;

  Task(this.name, this.theme);

  @override
  String toString();
  get getTheme => "$theme".split('.')[1];
  get getName => "$name";
  set setName(String value) => name = value;
  set setChecked(bool value) => isChecked = value;
}

// class Course extends Task {
//   int quantity = 0;
//   Course(String name, this.quantity) : super(name, Theme.course);

//   @override
//   String toString() {
//     return "$name ---- quantity: $quantity ----- ${isChecked ? '🗹' : '☐'}";
//   }

//   @override
//   void toChecked() {
//     isChecked = true;
//   }

//   @override
//   void toUnchecked() {
//     isChecked = false;
//   }
// }

// class Sport extends Task {
//   Duration? time;

//   Sport(String name, this.time) : super(name, Theme.sport);

//   @override
//   String toString() {
//     return "$name ---- ${time?.inSeconds} ---- ${isChecked ? '🗹' : '☐'}";
//   }

//   @override
//   void toChecked() {
//     isChecked = true;
//   }

//   @override
//   void toUnchecked() {
//     isChecked = false;
//   }
// }

// class Travail extends Task {
//   Travail(String name) : super(name, Theme.travail);

//   @override
//   String toString() {
//     return "$name ---- ${isChecked ? '🗹' : '☐'}";
//   }

//   @override
//   void toChecked() {
//     isChecked = true;
//   }

//   @override
//   void toUnchecked() {
//     isChecked = false;
//   }
// }

// Map getMapOfTaskSorted(List<Task> listTask) {
//   Map listeTaskPerCategory = {};
//   listTask.forEach((el) {
//     if (!listeTaskPerCategory.containsKey(el.getTheme)) {
//       listeTaskPerCategory[el.getTheme] = [];
//     }
//     listeTaskPerCategory[el.getTheme].add(el);
//   });
//   return listeTaskPerCategory;
// }

// void displayTasks(Map listeTaskPerCategory, [int nbToDisplay = 3]) {
//   listeTaskPerCategory.keys.forEach((element) {
//     for (int i = 0; i < nbToDisplay; i++) {
//       if (i == 0) print("$element : \n");
//       if (listeTaskPerCategory[element].length > i)
//         print(listeTaskPerCategory[element][i]);
//       if (i == nbToDisplay - 1) print("______________________\n");
//     }
//   });
// }

// void randomChecked(List<Task> listTask) {
//   listTask.forEach((element) {
//     if (Random().nextBool()) element.toChecked();
//   });
// }

// void main(List<String> arguments) {
//   List<Task> listeTask = [];
//   Course kinder = Course("Kinder Bueno", 2);
//   listeTask.add(kinder);
//   kinder.toChecked();
//   kinder.toUnchecked();
//   Sport triathlon = Sport("Triathlon", Duration(minutes: 40));
//   listeTask.add(triathlon);
//   listeTask.add(Course("KitKat", 5));
//   listeTask.add(Sport("Trail", Duration(hours: 2)));
//   listeTask.add(Course("Nesquik", 4));
//   listeTask.add(Course("Mars", 1));
//   listeTask.add(Course("Twix", 3));
//   listeTask.add(Sport("Marathon", Duration(hours: 6)));
//   listeTask.add(Course("Bounty", 5));

//   randomChecked(listeTask);

//   Map listeTaskParCategory = getMapOfTaskSorted(listeTask);

//   displayTasks(listeTaskParCategory, 3);
// }
