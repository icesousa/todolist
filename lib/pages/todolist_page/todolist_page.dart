import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/pages/homepage/homepage.dart';
import '../../widgets/CustomBottomBar.dart';
import '../../widgets/TodoListItem.dart';
import 'package:todolist/widgets/customTextForm.dart';
import 'package:string_validator/string_validator.dart' as validator;
import 'package:todolist/widgets/TodoListItem.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  Todo? deletedTodo;
  int? todoPos;
  String description = '';
  String titulo = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomBar(currentindex: 1),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).padding.top +
                    MediaQuery.of(context).padding.bottom +
                    AppBar().preferredSize.height),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Scrollbar(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Create Task',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.ubuntu(
                                  fontSize: 28,
                                  color: Color(0xff769FCE),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CustomTextForm(
                                obscureText: false,
                                controller: controller1,
                                labeltext: 'ex.: study flutter',
                                hinttext: 'insert a task',
                                maxLines: 1,
                                keyboardType: TextInputType.name,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'field cant be empty';
                                  } else if (!validator.isLength(text, 0, 50)) {
                                    return 'too much text';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 8),
                        SizedBox(height: 8),
                        CustomTextForm(
                          obscureText: false,
                          controller: controller2,
                          labeltext: 'Description',
                          hinttext: 'enter a description',
                          maxLines: 5,
                          keyboardType: TextInputType.name,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'field cant be empty';
                            }
                            if (!validator.isLength(text, 0, 200)) {
                              return 'too much text';
                            }
                            return null;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    Todo newTodo = Todo(
                                      title: controller1.text,
                                      dateTime: DateTime.now(),
                                      description: controller2.text,
                                    );

                                    todos.add(newTodo);
                                    todoController.clear();
                                    controller1.clear();
                                    controller2.clear();
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff769FCE),
                                  padding: EdgeInsets.all(0)),
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Flexible(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              for (Todo todo in todos)
                                TodoListItem(
                                  todo: todo,
                                  deletar: deletar,
                                  deletartodos: deletartodos,
                                ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                    'you have ${todos.length} pendents tasks')),
                            SizedBox(
                              width: 170,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (todos.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'No tasks to clean',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  );
                                }
                                showdialogdelete();
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff769FCE),
                                  padding: EdgeInsets.all(12)),
                              child: Text(
                                'clean all',
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff769FCE)),
                              onPressed: () {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const HomePage()),
                                  );
                                });
                              },
                              child: Text('go in'),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showdialogdelete() {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('Caution!'),
              content: Text(
                  'you\'re sure want delete everything?  ${todos.length} tasks will be deleted'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      setState(() {
                        todos.clear();
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text('SIM')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('NÃO'))
              ],
            ));
  }

  void deletar(Todo todo) {
    setState(() {
      todoPos = todos.indexOf(todo);
      deletedTodo = todo;

      todos.remove(todo);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Tarefa ${todo.title} foi deletada',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        backgroundColor: Color(0xff769FCE),
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              todos.insert(todoPos!, deletedTodo!);
            });
          },
        ),
      ),
    );
  }
}
