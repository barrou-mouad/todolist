class Task {
  String text;
  bool checked;
  Task({required this.text, this.checked = false});
  void changeCheck() {
    checked = !checked;
  }
}
