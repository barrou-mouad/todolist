import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/Screens/home.dart';
import 'package:todo_list/models/task_data.dart';

void main() => runApp(TodoList());

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
        create: (context) => TaskData(),
        child: MaterialApp(
          home: Home(),
        ));
  }
}
