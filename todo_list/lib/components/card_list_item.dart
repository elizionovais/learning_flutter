import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/todo.dart';

class ListTodoItem extends StatelessWidget {
  const ListTodoItem({
    Key? key,
    required this.item,
    required this.remove,
  }) : super(key: key);

  final Todo item;
  final Function(Todo) remove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
          actionPane: const SlidableDrawerActionPane(),
          secondaryActions: [
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () {
                remove(item);
              },
            )
          ],
          child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.grey[200]),
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    DateFormat('dd/MM/yyyy - HH:mm').format(item.date),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    item.title,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 21, 241, 194),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ))),
    );
  }
}
