

class ToDo {
  String? id;
  String? todo_text;
  bool isDone;

  ToDo({
    required this.id,
    required this.todo_text,
    this.isDone = false,
  });

  static List<ToDo> todoList(){

    return [
      ToDo(id: "01", todo_text: "Solve 5 Question on Leetcode."),
      ToDo(id: "02", todo_text: "Quantitative Aptitude."),
      ToDo(id: "03", todo_text: "Build Flutter Application.", isDone: true),
      ToDo(id: "04", todo_text: "English Concept."),
      ToDo(id: "05", todo_text: "Big Bang Theory."),
      ToDo(id: "06", todo_text: "Read Book, Learn NEW"),
      ToDo(id: "07", todo_text: "Do Exercise Regularly", isDone: true),

    ];
  }
}
