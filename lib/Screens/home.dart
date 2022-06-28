import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';
import 'package:todo_list/widgets/MyCard.dart';

class Home extends StatelessWidget {
  String? nom;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      margin: EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Entrer une tache ",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                          TextField(
                            autofocus: true,
                            onChanged: (textnew) => {nom = textnew},
                          ),
                          TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  primary: Colors.amber),
                              onPressed: () => {
                                    Provider.of<TaskData>(context,
                                            listen: false)
                                        .addTask(nom!),
                                    Navigator.pop(context)
                                  },
                              child: Text(
                                "Ajouter",
                                style: TextStyle(),
                              ))
                        ],
                      ),
                    ),
                  ))
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.amber[400],
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.playlist_add,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Todo list",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  Provider.of<TaskData>(context).tasks.length.toString(),
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                Text("  Task",
                    style: TextStyle(fontSize: 30, color: Colors.white))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child:
                      Consumer<TaskData>(builder: (context, taskData, child) {
                    return ListView.builder(
                        itemCount: taskData.tasks.length,
                        itemBuilder: (context, index) {
                          return MyCard(
                            delete: () =>
                                {taskData.deleteTask(taskData.tasks[index])},
                            text: taskData.tasks[index].text,
                            isChecked: taskData.tasks[index].checked,
                            checkboxChange: (newval) =>
                                {taskData.updateTask(taskData.tasks[index])},
                          );
                        });
                  })),
            )
          ],
        ),
      ),
    );
  }
}
