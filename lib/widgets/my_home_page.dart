import 'package:flutter/material.dart';
import 'package:todolist/class/course.dart';
import 'package:todolist/class/sport.dart';
import 'package:todolist/class/task.dart';
import 'package:todolist/widgets/my_adding_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<Task> taskList = [];

  @override
  void initState() {
    Course kinder = Course("Kinder Bueno", 2);
    taskList.add(kinder);
    Sport triathlon = Sport("Triathlon", Duration(minutes: 40));
    taskList.add(triathlon);
    taskList.add(Course("KitKat", 5));
    taskList.add(Sport("Trail", Duration(hours: 2)));
    taskList.add(Course("Nesquik", 4));
    taskList.add(Course("Mars", 1));
    taskList.add(Course("Twix", 3));
    taskList.add(Sport("Marathon", Duration(hours: 6)));
    taskList.add(Course("Bounty", 5));
    super.initState();
  }

  // to sorted the list
  Map<dynamic, List<Task>> getMapOfTaskSorted(List<Task> listTask) {
    Map<dynamic, List<Task>> listTaskPerCategory = {};
    for (var el in listTask) {
      if (!listTaskPerCategory.containsKey(el.getTheme)) {
        listTaskPerCategory[el.getTheme] = [];
      }
      listTaskPerCategory[el.getTheme]?.add(el);
    }
    return listTaskPerCategory;
  }

  bool boolTest = false;

  test2() {
    boolTest = boolTest ? false : true;
    print(boolTest);
  }

  Column displayTasks(List<Task> listTask, [int nbToDisplay = 3]) {
    Column listTasks =
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: []);
    Map<dynamic, List<Task>> listTaskPerCategory = getMapOfTaskSorted(listTask);

    for (var element in listTaskPerCategory.keys) {
      List<Widget> listTasksChildren = [];
      for (int i = 0; i < nbToDisplay; i++) {
        if (listTaskPerCategory[element]!.length > i) {
          listTasksChildren.add(Container(
            margin: const EdgeInsets.all(10.0),
            width: double.maxFinite,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                    value: listTaskPerCategory[element]![i].isChecked,
                    checkColor: Color.fromARGB(255, 255, 255, 255),
                    onChanged: (bool? value) {
                      setState(() {
                        listTaskPerCategory[element]![i].setChecked =
                            listTaskPerCategory[element]![i].isChecked
                                ? false
                                : true;
                      });
                    }),
                Text(
                  "${listTaskPerCategory[element]![i].getName}",
                  style: const TextStyle(fontSize: 20, color: Colors.black
                      // backgroundColor: Colors.cyan,
                      ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, size: 20, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      taskList.removeWhere((itemTask) {
                        print(listTaskPerCategory[element]![i]);
                        print(itemTask);
                        return listTaskPerCategory[element]![i] == itemTask;
                      });
                      print(taskList);
                    });
                  },
                ),
              ],
            ),
          ));
        }
      }
      List categoryName = element.toString().split('');
      String firstLetterCategoryName = categoryName[0].toString().toUpperCase();
      categoryName.removeAt(0);
      listTasks.children.addAll([
        Container(
            // color: Colors.white,
            margin: const EdgeInsets.only(
                bottom: 20.0, top: 20.0, right: 10, left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    blurStyle: BlurStyle.outer)
              ],
            ),
            child: (Column(
              //   children: [
              //   Text(
              //     "$firstLetterCategoryName${categoryName.join()}",
              //     style: const TextStyle(
              //         fontSize: 40, decoration: TextDecoration.underline),
              //   ),
              //   Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: listTasksChildren,
              //   )
              // ]

              children: <Widget>[
                ExpansionTile(
                  title: Text("$firstLetterCategoryName${categoryName.join()}"),
                  // subtitle: Text('Trailing expansion arrow icon'),
                  children: listTasksChildren,
                ),
              ],
            )))
      ]);
    }
    return listTasks;
  }

  Column _test() {
    return Column(
      children: [displayTasks(taskList, 10)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To-do list",
        ),
        centerTitle: true,
      ),
      body: Center(
          child: (Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _test(),
        ],
      ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return const MyAddingPage();
          }));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
