import 'package:flutter/material.dart';
import 'package:todolist/widgets/my_adding_page.dart';
import 'package:todolist/widgets/my_alert_dialog.dart';
import 'package:todolist/widgets/my_home_page.dart';

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
        home: const MyAlertDialog(
          title: "ok",
        ));
  }
}
