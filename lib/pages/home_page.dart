import 'package:flutter/material.dart';
import 'package:tasks/components/add_action_button.dart';
import 'package:tasks/components/add_task_bottom_sheet.dart';
import 'package:tasks/components/empty_task_view.dart';
import 'package:tasks/components/todo_view.dart';
import 'package:tasks/models/to_do_entity.dart';

class HomePage extends StatefulWidget {
  final String ownerName;
  const HomePage({super.key, required this.ownerName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoView> todoViews = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "${widget.ownerName}'s Tasks",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: todoViews.isEmpty
              ? EmptyTaskView(widget: widget, onAddTodo: addTodoView)
              : ListView(children: todoViews),
        ),
      ),
      floatingActionButton: AddActionButton(
        onPressed: () => _showAddTaskBottomSheet(context),
      ),
    );
  }

  void addTodoView(ToDoEntity todoEntity) {
    setState(() {
      todoViews.add(
        TodoView(toDoEntity: todoEntity, onToggleFavortie: onFavoriteToggle),
      );
    });
  }

  void _showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddTaskBottomSheet(onAddTodo: addTodoView),
    );
  }

  void onFavoriteToggle() {
    setState(() {});
  }
}
