import 'package:flutter/material.dart';
import 'package:tasks/core/constants/app_constants.dart';
import 'package:tasks/models/todo_entity.dart';

class TodoDetailPage extends StatefulWidget {
  final TodoEntity todoEntity;

  const TodoDetailPage({super.key, required this.todoEntity});

  @override
  State<TodoDetailPage> createState() => _TodoDetailPageState();
}

class _TodoDetailPageState extends State<TodoDetailPage> {
  late TodoEntity _currentTodo;

  @override
  void initState() {
    super.initState();
    _currentTodo = widget.todoEntity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.iconPrimary),
          onPressed: () => Navigator.pop(context, _currentTodo.isFavorite),
        ),
        actions: [
          IconButton(
            onPressed: _toggleFavorite,
            icon: Icon(
              _currentTodo.isFavorite ? Icons.star : Icons.star_border,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _currentTodo.title,
              style: const TextStyle(
                fontSize: AppFontSizes.xLarge,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.short_text_rounded,
                  size: AppIconSizes.small,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    _currentTodo.description ?? '',
                    style: const TextStyle(
                      fontSize: AppFontSizes.medium,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      _currentTodo = _currentTodo.copyWith(
        isFavorite: !_currentTodo.isFavorite,
      );
    });
  }
}
