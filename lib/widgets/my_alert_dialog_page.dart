import 'package:flutter/material.dart';
import '../class/task.dart' as task;

class MyAlertDialogPage extends StatefulWidget {
  const MyAlertDialogPage({Key? key, required this.title}) : super(key: key);
  final title;

  @override
  State<MyAlertDialogPage> createState() => _MyAlertDialogPage();
}

class _MyAlertDialogPage extends State<MyAlertDialogPage> {
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
                              margin: const EdgeInsets.only(right: 20),
                              child: const Text("Category of the task :")),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(1),
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.keyboard_arrow_down_sharp),
                              elevation: 100,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 30),
                              // underline: Container(
                              //   height: 2,
                              //   color: Color.fromARGB(255, 0, 0, 0),
                              // ),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue = value!;
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
      appBar: AppBar(title: const Text("ok")),
      body: Center(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _openDialog(), child: Icon(Icons.add)),
    );
  }
}
