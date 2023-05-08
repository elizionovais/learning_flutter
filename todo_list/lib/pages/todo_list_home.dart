import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/repositories/list_repository.dart';

import '../components/card_list_item.dart';

class TodoListHomePage extends StatefulWidget {
  const TodoListHomePage({super.key});

  @override
  State<TodoListHomePage> createState() => _TodoListHomePageState();
}

class _TodoListHomePageState extends State<TodoListHomePage> {
  final TextEditingController newlist = TextEditingController();
  final ListRepository repository = ListRepository();
  List<Todo> todos = [];
  Todo? delteditem;
  int? itempos;
  String? errorText;

  @override
  void initState() {
    super.initState();
    repository.getLists().then((value) {
      setState(() {
        todos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Card(
          margin: const EdgeInsets.all(8),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text('Lista de Tarefas',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: newlist,
                          decoration: const InputDecoration(
                            label: Text('Adicionar Tarefa'),
                            hintText: 'Digite uma tarefa',
                            border: OutlineInputBorder(),
                            // errorText: errorText,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 21, 241, 194),
                                width: 2,
                              ),
                            ),
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 21, 241, 194),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SizedBox(
                          height: 58,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 21, 241, 194)),
                            ),
                            child: const Icon(Icons.add),
                            onPressed: () {
                              String text = newlist.text;
                              if (text.isEmpty) {
                                setState(() {
                                  errorText = 'O título não pode ser vazio!';
                                });
                                return;
                              }
                              setState(() {
                                Todo item = Todo(title: text, date: DateTime.now());
                                todos.add(item);
                                errorText = null;
                              });
                              newlist.clear();
                              repository.saveList(todos);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Flexible(
                    child: ListView(
                      children: [
                        for (Todo todo in todos)
                          ListTodoItem(
                            item: todo,
                            remove: deletetodo,
                          )
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(flex: 2, child: Text('Voce tem ${todos.length} tarefas pendentes')),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 21, 241, 194)),
                          ),
                          onPressed: deletedialog,
                          child: const Text('Limpar tudo'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void deletetodo(Todo todo) {
    delteditem = todo;
    itempos = todos.indexOf(todo);
    setState(() {
      todos.remove(todo);
    });
    repository.saveList(todos);

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tarefa ${todo.title} removida'),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: const Color.fromARGB(255, 21, 241, 194),
          onPressed: () {
            setState(() {
              todos.insert(itempos!, delteditem!);
            });
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void deletedialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Limpar Tarefas'),
          content: const Text('Deseja realmente deletar todas as tarefa?'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 21, 241, 194),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                deleteall();
              },
              child: const Text('Limpar'),
            ),
          ],
        );
      },
    );
  }

  void deleteall() {
    setState(() {
      todos.clear();
    });
    repository.saveList(todos);
  }
}
