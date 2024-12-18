class ToDo {
  String? id;
  String? todoTask;
  String? todoDesc;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoTask,
    required this.todoDesc,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(
        id: '01',
        todoTask: "Task 1",
        todoDesc: "Description 123",
        isDone: true,
      ),
      ToDo(
        id: '02',
        todoTask: "Task 2",
        todoDesc: "Description 32",
        isDone: true,
      ),
      ToDo(
        id: '03',
        todoTask: "Task 3",
        todoDesc: "Description 123sdas",
      ),
      ToDo(
        id: '04',
        todoTask: "Task 4",
        todoDesc: "Description asdasd",
      ),
      ToDo(
        id: '05',
        todoTask: "Task 5",
        todoDesc: "Description asdasdasdasdasdasdasdasdasdasd",
      ),
      ToDo(
        id: '06',
        todoTask: "Task 6",
        todoDesc: "123123sadasdasdasdzxczxczxcasdqwegsdfgsdfgsdfgsdfg",
      ),
      ToDo(
        id: '07',
        todoTask: "Task 7",
        todoDesc: "lolololololollolololololololololololololololololololo",
      ),
      ToDo(
        id: '08',
        todoTask: "Task 8",
        todoDesc: "Description sos",
      ),
    ];
  }
}
