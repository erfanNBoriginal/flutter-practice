class Todo {
  //
  final String title;

  final String date;

  bool isCkeck = false;

  Todo({
    required this.title,
  }) : date = DateTime.now().toString() {
    print(date);
  }
}
