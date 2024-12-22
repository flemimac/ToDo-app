class ToDo {
  String? id;
  String? todoTask;
  String? todoDesc;
  String? todoCategory;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoTask,
    required this.todoDesc,
    required this.todoCategory,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'todoTask': todoTask,
      'todoDesc': todoDesc,
      'todoCategory': todoCategory,
      'isDone': isDone ? 1 : 0,
    };
  }
}
