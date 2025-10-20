import 'package:flutter/material.dart';
import 'package:tasks/models/to_do_entity.dart';

class ToDoDetailPage extends StatefulWidget {
  const ToDoDetailPage({super.key, required this.toDoEntity});

  final ToDoEntity toDoEntity;

  @override
  State<ToDoDetailPage> createState() => _ToDoDetailPageState();
}

class _ToDoDetailPageState extends State<ToDoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context, widget.toDoEntity.isFavorite);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.toDoEntity.isFavorite = !widget.toDoEntity.isFavorite;
              });
            },
            icon: widget.toDoEntity.isFavorite
                ? Icon(Icons.star)
                : Icon(Icons.star_border),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.toDoEntity.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.short_text_rounded, size: 24),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.toDoEntity.description ?? '',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
