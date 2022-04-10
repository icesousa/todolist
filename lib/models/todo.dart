//Criação da Lista, Função de deletar, guardar posição e guardar deletado para desfazer deleção.
List<Todo> todos = [];
Todo? deletedTodo;
int? todoPos;

class Todo {
  Todo(
      {required this.title, required this.dateTime, required this.description});

  String title;
  DateTime dateTime;
  String description;
}

//Functions

void deletartodos() {
  todos.clear();
}
