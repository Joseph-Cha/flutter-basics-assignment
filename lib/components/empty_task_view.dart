import 'package:flutter/material.dart';
import 'package:tasks/models/to_do_entity.dart';
import 'package:tasks/pages/home_page.dart';

class EmptyTaskView extends StatelessWidget {
  const EmptyTaskView({
    super.key,
    required this.widget,
    required this.onAddTodo,
  });

  final HomePage widget;
  final void Function(ToDoEntity)? onAddTodo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.note_add_outlined,
                    size: 100,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '아직 할 일이 없음',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "할 일을 추가하고 ${widget.ownerName}'s Task에서\n할 일을 추적하세요.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black38),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
