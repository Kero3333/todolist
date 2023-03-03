import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/class/course.dart';
import 'package:todolist/class/sport.dart';
import 'package:todolist/class/task.dart' as task;
import '../class/work.dart';

class AddAlertDialog extends StatefulWidget {
  const AddAlertDialog({Key? key}) : super(key: key);
  @override
  State<AddAlertDialog> createState() => _AddAlertDialog();
}

class _AddAlertDialog extends State<AddAlertDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController myController =
      TextEditingController(text: "myController");
  List<String> dropdownValues =
      task.Theme.values.map((e) => e.toString().split('.')[1]).toList();
  String dropdownValue = task.Theme.values.first.toString().split('.')[1];
  List<task.Task> taskList = [];

  @override
  Widget build(context) {
    print("coucou");
    return Center(
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
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                    margin: const EdgeInsets.only(right: 20, top: 10),
                    child: const Text("Category of the task :")),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(1),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down_sharp),
                    elevation: 100,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 30),
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
                        .map<DropdownMenuItem<String>>((String value) {
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
                        //   isEdit = {};
                        //   for (var el in taskList) {
                        //     if (!isEdit.containsKey(el.getTheme)) {
                        //       isEdit[el.getTheme] = [];
                        //     }
                        //     isEdit[el.getTheme]?.add(false);
                        //   }
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
    ));
  }
}
