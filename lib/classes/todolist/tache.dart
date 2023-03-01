// import 'dart:math';

enum Theme { course, sport, travail }

abstract class Tache {
  String? name;
  bool isChecked = false;
  Theme? theme;

  Tache(this.name, this.theme);

  @override
  String toString();
  void toChecked();
  void toUnchecked();
  get getTheme => "$theme".split('.')[1];
}

// class Course extends Tache {
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

// class Sport extends Tache {
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

// class Travail extends Tache {
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

// Map getMapOfTaskSorted(List<Tache> listTask) {
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

// void randomChecked(List<Tache> listTask) {
//   listTask.forEach((element) {
//     if (Random().nextBool()) element.toChecked();
//   });
// }

// void main(List<String> arguments) {
//   List<Tache> listeTache = [];
//   Course kinder = Course("Kinder Bueno", 2);
//   listeTache.add(kinder);
//   kinder.toChecked();
//   kinder.toUnchecked();
//   Sport triathlon = Sport("Triathlon", Duration(minutes: 40));
//   listeTache.add(triathlon);
//   listeTache.add(Course("KitKat", 5));
//   listeTache.add(Sport("Trail", Duration(hours: 2)));
//   listeTache.add(Course("Nesquik", 4));
//   listeTache.add(Course("Mars", 1));
//   listeTache.add(Course("Twix", 3));
//   listeTache.add(Sport("Marathon", Duration(hours: 6)));
//   listeTache.add(Course("Bounty", 5));

//   randomChecked(listeTache);

//   Map listeTacheParCategory = getMapOfTaskSorted(listeTache);

//   displayTasks(listeTacheParCategory, 3);
// }
