import 'package:flutter/material.dart';
import 'package:tasks/core/constants/app_constants.dart';
import 'package:tasks/widgets/common/add_action_button.dart';
import 'package:tasks/widgets/todo/add_task_bottom_sheet.dart';
import 'package:tasks/widgets/common/empty_task_view.dart';
import 'package:tasks/widgets/todo/todo_view.dart';
import 'package:tasks/models/todo_entity.dart';

class HomePage extends StatefulWidget {
  final String ownerName;

  const HomePage({super.key, required this.ownerName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TodoEntity> _todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text(
          "${widget.ownerName}'s Tasks",
          style: const TextStyle(
            fontSize: AppFontSizes.xLarge,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: AppColors.borderLight,
            height: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: _todos.isEmpty
            ? EmptyTaskView(ownerName: widget.ownerName)
            : ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.md),
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  return TodoView(
                    todoEntity: _todos[index],
                    onToggleDone: () => _toggleTodoDone(index),
                    onToggleFavorite: () => _toggleTodoFavorite(index),
                  );
                },
              ),
      ),
      floatingActionButton: AddActionButton(
        onPressed: _showAddTaskBottomSheet,
      ),
    );
  }

  void _addTodo(TodoEntity todo) {
    setState(() {
      _todos.add(todo);
    });
  }

  void _toggleTodoDone(int index) {
    setState(() {
      _todos[index] = _todos[index].copyWith(
        isDone: !_todos[index].isDone,
      );
    });
  }

  void _toggleTodoFavorite(int index) {
    setState(() {
      _todos[index] = _todos[index].copyWith(
        isFavorite: !_todos[index].isFavorite,
      );
    });
  }

  void _showAddTaskBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddTaskBottomSheet(onAddTodo: _addTodo),
    );
  }
}
