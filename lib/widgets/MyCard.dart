import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  String text;
  void Function(bool?) checkboxChange;
  void Function() delete;
  bool? isChecked = false;

  MyCard(
      {required this.text,
      this.isChecked,
      required this.checkboxChange,
      required this.delete});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListTile(
        onLongPress: delete,
        title: Text(
          text,
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              decoration:
                  isChecked == true ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: checkboxChange,
        ),
      ),
    );
  }
}
