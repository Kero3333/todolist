import 'package:flutter/material.dart';
import 'package:todolist/class/course.dart';
import 'package:todolist/class/sport.dart';
import 'package:todolist/class/task.dart' as task;

import '../class/work.dart';
// import 'package:todolist/widgets/my_adding_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<task.Task> taskList = [];

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
  Map<dynamic, List<task.Task>> getMapOfTaskSorted(List<task.Task> listTask) {
    Map<dynamic, List<task.Task>> listTaskPerCategory = {};
    for (var el in listTask) {
      if (!listTaskPerCategory.containsKey(el.getTheme)) {
        listTaskPerCategory[el.getTheme] = [];
      }
      listTaskPerCategory[el.getTheme]?.add(el);
    }
    return listTaskPerCategory;
  }

  Column displayTasks(List<task.Task> listTask, [int nbToDisplay = 3]) {
    Column listTasks =
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: []);
    Map<dynamic, List<task.Task>> listTaskPerCategory =
        getMapOfTaskSorted(listTask);

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

  Column _drawTasks() {
    return Column(
      children: [displayTasks(taskList, 10)],
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController myController =
      TextEditingController(text: "myController");
  List<String> dropdownValues =
      task.Theme.values.map((e) => e.toString().split('.')[1]).toList();
  String dropdownValue = task.Theme.values.first.toString().split('.')[1];

  Future _openDialog() => showDialog(
      context: context,
      builder: (context) => Center(
              child: AlertDialog(
            title: Text("Add a task"),
            content: Container(
              height: 200,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      obscureText: false,
                      decoration: const InputDecoration(
                        labelText: "name of the task",
                        border: OutlineInputBorder(),
                      ),
                      controller: myController,
                      validator: (String? value) {
                        return (value != null && value.isEmpty)
                            ? 'The name of the task cannot be empty'
                            : null;
                      },
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(right: 20, top: 10),
                              child: const Text("Category of the task :")),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(1),
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down_sharp),
                              elevation: 100,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 30),
                              underline: Container(
                                color: Colors.transparent,
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownValue = value!;
                                  print(dropdownValue);
                                });
                              },
                              items: dropdownValues
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          )
                        ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Form has been validate ${myController.text}")));
                            Navigator.of(context).pop();
                            setState(() {
                              switch (dropdownValue) {
                                case "course":
                                  taskList.add(Course(myController.text, 1));
                                  break;
                                case "sport":
                                  taskList.add(Sport(myController.text,
                                      const Duration(minutes: 60)));
                                  break;
                                case "work":
                                  taskList.add(Work(myController.text));
                                  break;
                                default:
                                  break;
                              }
                            });
                            print(dropdownValue);
                            print(myController.text);
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )));

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
          _drawTasks(),
        ],
      ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (BuildContext context) {
          //   return const MyAddingPage();
          // }));
          _openDialog();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
