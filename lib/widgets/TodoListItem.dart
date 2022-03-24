import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:todolist/models/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    Key? key,
    required this.todo,
    required this.deletar,
    required this.deletartodos,
  }) : super(key: key);

  final Todo todo;
  final Function deletar;
  final Function deletartodos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: Container(
                    height: 480,
                    width: 270,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff769FCE)),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppBar(
                              systemOverlayStyle: SystemUiOverlayStyle(),
                              backgroundColor: Color(0xff769FCE),
                              title: Text(todo.title),
                              actions: <Widget>[
                                IconButton(
                                    onPressed: () {
                                      deletar(todo);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            Text(
                              'Description: ',
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            Text(
                              ' ${todo.description}',
                              maxLines: 5,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                          ]),
                    ),
                  ),
                );
              });
        },
        child: Slidable(
          endActionPane: ActionPane(
            motion: DrawerMotion(),
            children: [
              SlidableAction(
                backgroundColor: Colors.red,
                label: 'delete',
                icon: Icons.delete,
                onPressed: (BuildContext context) {
                  deletar(todo);
                },
              ),
            ],
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.grey[200],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  DateFormat('dd/MM/yy').format(todo.dateTime),
                  style: TextStyle(fontSize: 10),
                ),
                Text(
                  todo.title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
