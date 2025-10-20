import 'package:flutter/material.dart';
import 'package:tasks/models/to_do_entity.dart';
import 'package:tasks/pages/to_do_detail_page.dart';

class TodoView extends StatefulWidget {
  const TodoView({
    super.key,
    required this.toDoEntity,
    required this.onToggleFavortie,
  });

  final ToDoEntity toDoEntity;
  final VoidCallback onToggleFavortie;

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ToDoDetailPage(toDoEntity: widget.toDoEntity);
            },
          ),
        );
        setState(() {
          widget.toDoEntity.isFavorite = result;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white60,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.toDoEntity.isDone = !widget.toDoEntity.isDone;
                });
              },
              child: widget.toDoEntity.isDone
                  ? Icon(Icons.check_circle)
                  : Icon(Icons.radio_button_unchecked),
            ),
            SizedBox(width: 12),
            Text(
              widget.toDoEntity.title,
              style: TextStyle(
                decoration: widget.toDoEntity.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                fontSize: 16,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.toDoEntity.isFavorite = !widget.toDoEntity.isFavorite;
                });
              },
              child: widget.toDoEntity.isFavorite
                  ? Icon(Icons.star)
                  : Icon(Icons.star_border),
            ),
          ],
        ),
      ),
    );
  }
}
