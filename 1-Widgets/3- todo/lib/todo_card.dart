import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

class TodoCard extends StatelessWidget {
  //
  final Todo todoData;

  final void Function(Todo) onTaskRemoved;

  final void Function(Todo) onTaskChecked;

  const TodoCard({
    super.key,
    required this.todoData,
    required this.onTaskChecked,
    required this.onTaskRemoved,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // height: 150,
      // width: double.infinity,
      // color: Colors.grey,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        child: Row(
          children: [
            Checkbox(
              shape: CircleBorder(),
              value: todoData.isCkeck,
              onChanged: (_) => onTaskChecked(todoData),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todoData.title,
                    style: TextStyle(
                      fontSize: 18,
                      decoration: todoData.isCkeck
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  Divider(),
                  Text(
                    todoData.date.substring(0, 19),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            IconButton.outlined(
              onPressed: () => onTaskRemoved(todoData),
              hoverColor: Colors.red.shade300,
              icon: Icon(Icons.remove_circle_outline),
            ),
          ],
        ),
      ),
    );
  }
}
