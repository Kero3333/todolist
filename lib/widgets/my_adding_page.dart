import 'package:flutter/material.dart';
import '../class/task.dart' as Task;

class MyAddingPage extends StatefulWidget {
  const MyAddingPage({Key? key}) : super(key: key);

  @override
  State<MyAddingPage> createState() => _MyAddingPage();
}

class _MyAddingPage extends State<MyAddingPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController myController =
      TextEditingController(text: "myController");
  List<String> dropdownValues =
      Task.Theme.values.map((e) => e.toString().split('.')[1]).toList();
  String dropdownValue = Task.Theme.values.first.toString().split('.')[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add a task",
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  obscureText: true,
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
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: const Text("Category of the task :")),
                  Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.keyboard_arrow_down_sharp),
                      elevation: 100,
                      style:
                          const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      underline: Container(
                        height: 2,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
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
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
