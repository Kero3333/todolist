import 'package:flutter/material.dart';

import 'classes/todolist/course.dart';
import 'classes/todolist/sport.dart';
import 'classes/todolist/tache.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Todolist",
        theme: ThemeData(primaryColor: Colors.amber),
        home: const HomePage(title: 'Todolist'));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  // to sorted the list
  Map getMapOfTaskSorted(List<Tache> listTask) {
    Map listTaskPerCategory = {};
    listTask.forEach((el) {
      if (!listTaskPerCategory.containsKey(el.getTheme)) {
        listTaskPerCategory[el.getTheme] = [];
      }
      listTaskPerCategory[el.getTheme].add(el);
    });
    return listTaskPerCategory;
  }

  bool boolTest = false;

  test2() {
    boolTest = boolTest ? false : true;
    print(boolTest);
  }

  Column displayTasks(List<Tache> listTask, [int nbToDisplay = 3]) {
    Column listTasks =
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: []);
    Map listTaskPerCategory = getMapOfTaskSorted(listTask);

    listTaskPerCategory.keys.forEach((element) {
      List<Widget> listTasksChildren = [];
      for (int i = 0; i < nbToDisplay; i++) {
        if (listTaskPerCategory[element].length > i) {
          listTasksChildren.add(Container(
            margin: const EdgeInsets.all(10.0),
            width: double.maxFinite,
            color: Colors.deepOrange,
            child: TextButton(
              onPressed: () => test2(),
              child: Text(
                "${listTaskPerCategory[element][i]}",
                style: const TextStyle(fontSize: 20, color: Colors.black
                    // backgroundColor: Colors.cyan,
                    ),
              ),
            ),
          ));
        }
      }
      listTasks.children.addAll([
        Text(element, style: const TextStyle(fontSize: 40)),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: listTasksChildren,
        )
      ]);
    });
    return listTasks;
  }

  Column _test() {
    List<Tache> listeTache = [];
    Course kinder = Course("Kinder Bueno", 2);
    listeTache.add(kinder);
    kinder.toChecked();
    kinder.toUnchecked();
    Sport triathlon = Sport("Triathlon", Duration(minutes: 40));
    listeTache.add(triathlon);
    listeTache.add(Course("KitKat", 5));
    listeTache.add(Sport("Trail", Duration(hours: 2)));
    listeTache.add(Course("Nesquik", 4));
    listeTache.add(Course("Mars", 1));
    listeTache.add(Course("Twix", 3));
    listeTache.add(Sport("Marathon", Duration(hours: 6)));
    listeTache.add(Course("Bounty", 5));

    return Column(
      children: [displayTasks(listeTache, 3)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todolist"),
      ),
      body: Center(
          child: (Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Liste des Tâches :",
            style: TextStyle(fontSize: 50),
          ),
          _test(),
        ],
      ))),
    );
  }
}
