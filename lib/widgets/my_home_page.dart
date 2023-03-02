import 'package:flutter/material.dart';
import 'package:todolist/class/course.dart';
import 'package:todolist/class/sport.dart';
import 'package:todolist/class/tache.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  // to sorted the list
  Map<dynamic, List<Tache>> getMapOfTaskSorted(List<Tache> listTask) {
    Map<dynamic, List<Tache>> listTaskPerCategory = {};
    listTask.forEach((el) {
      if (!listTaskPerCategory.containsKey(el.getTheme)) {
        listTaskPerCategory[el.getTheme] = [];
      }
      listTaskPerCategory[el.getTheme]?.add(el);
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
    Map<dynamic, List<Tache>> listTaskPerCategory =
        getMapOfTaskSorted(listTask);

    listTaskPerCategory.keys.forEach((element) {
      List<Widget> listTasksChildren = [];
      for (int i = 0; i < nbToDisplay; i++) {
        if (listTaskPerCategory[element]!.length > i) {
          bool isChecked = false;
          listTasksChildren.add(Container(
            margin: const EdgeInsets.all(10.0),
            width: double.maxFinite,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: TextButton(
                onPressed: () => test2(),
                child: Row(
                  children: [
                    Checkbox(
                        value: isChecked,
                        checkColor: const Color.fromARGB(255, 255, 1, 1),
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    Text(
                      "${listTaskPerCategory[element]![i].getName}",
                      style: const TextStyle(fontSize: 20, color: Colors.black
                          // backgroundColor: Colors.cyan,
                          ),
                    ),
                  ],
                )),
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
