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
  Map getMapOfTaskSorted(List<Tache> listTask) {
    Map listeTaskPerCategory = {};
    listTask.forEach((el) {
      if (!listeTaskPerCategory.containsKey(el.getTheme)) {
        listeTaskPerCategory[el.getTheme] = [];
      }
      listeTaskPerCategory[el.getTheme].add(el);
    });
    return listeTaskPerCategory;
  }

  Column displayTasks(List<Tache> listTask, [int nbToDisplay = 3]) {
    Column listTasks =
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: []);
    Map listeTaskPerCategory = getMapOfTaskSorted(listTask);

    listeTaskPerCategory.keys.forEach((element) {
      List<Widget> listTasksChildren = [];
      for (int i = 0; i < nbToDisplay; i++) {
        if (listeTaskPerCategory[element].length > i) {
          listTasksChildren.add(Text(
            "${listeTaskPerCategory[element][i]}",
            style: const TextStyle(fontSize: 20),
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
      children: [displayTasks(listeTache, 5)],
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Liste de Tâches :",
            style: TextStyle(fontSize: 50),
          ),
          _test()
        ],
      ))),
    );
  }
}
