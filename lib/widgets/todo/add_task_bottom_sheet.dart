import 'package:flutter/material.dart';
import 'package:tasks/core/constants/app_constants.dart';
import 'package:tasks/models/todo_entity.dart';

class AddTaskBottomSheet extends StatefulWidget {
  final void Function(TodoEntity) onAddTodo;

  const AddTaskBottomSheet({super.key, required this.onAddTodo});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool _isFavorite = false;
  bool _showDescription = false;

  @override
  void initState() {
    super.initState();
    // Auto-focus on title field when bottom sheet opens
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _focusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          top: AppSpacing.sm,
          bottom: AppSpacing.sm,
          left: AppSpacing.lg,
          right: AppSpacing.lg,
        ),
        decoration: const BoxDecoration(
          color: AppColors.containerBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppBorderRadius.md),
            topRight: Radius.circular(AppBorderRadius.md),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              focusNode: _focusNode,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '새로운 할 일을 입력하세요',
                hintStyle: TextStyle(fontSize: AppFontSizes.medium),
              ),
              onSubmitted: (_) => _saveTask(),
              onChanged: (_) => setState(() {}),
            ),
            if (_showDescription)
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '세부 정보 추가',
                  hintStyle: TextStyle(fontSize: AppFontSizes.small),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showDescription = !_showDescription;
                      });
                    },
                    child: const Icon(Icons.short_text_rounded),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                    child: Icon(
                      _isFavorite ? Icons.star : Icons.star_border,
                      color:
                          _isFavorite ? AppColors.primaryAmber : AppColors.iconSecondary,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: _saveTask,
                    child: Text(
                      '저장',
                      style: TextStyle(
                        color: _isTitleFilled
                            ? AppColors.primaryBlue
                            : AppColors.iconSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool get _isTitleFilled => _titleController.text.trim().isNotEmpty;

  void _saveTask() {
    if (_isTitleFilled) {
      widget.onAddTodo(
        TodoEntity(
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim().isEmpty
              ? null
              : _descriptionController.text.trim(),
          isFavorite: _isFavorite,
        ),
      );
      Navigator.pop(context);
    }
  }
}
