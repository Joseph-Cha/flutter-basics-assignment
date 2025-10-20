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
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  bool _isFavorite = false;
  bool _showDescription = false;

  @override
  void initState() {
    super.initState();
    // Auto-focus on title field when bottom sheet opens
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _titleFocusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _titleFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppBorderRadius.xl),
            topRight: Radius.circular(AppBorderRadius.xl),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowDark,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: AppSpacing.sm),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(AppBorderRadius.sm),
              ),
            ),

            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.md,
                AppSpacing.lg,
                AppSpacing.xs,
              ),
              child: Row(
                children: [
                  const Text(
                    '새로운 할 일',
                    style: TextStyle(
                      fontSize: AppFontSizes.large,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close_rounded),
                    color: AppColors.iconInactive,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),

            const Divider(height: 1, color: AppColors.borderLight),

            // Content
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                children: [
                  // Title input
                  TextField(
                    controller: _titleController,
                    focusNode: _titleFocusNode,
                    style: const TextStyle(
                      fontSize: AppFontSizes.medium,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: '할 일 제목',
                      hintStyle: TextStyle(
                        fontSize: AppFontSizes.medium,
                        color: AppColors.textDisabled,
                      ),
                      filled: true,
                      fillColor: AppColors.surfaceVariant,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppBorderRadius.md),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.md,
                      ),
                      prefixIcon: Icon(
                        Icons.check_circle_outline_rounded,
                        color: AppColors.iconInactive,
                        size: AppIconSizes.medium,
                      ),
                    ),
                    textInputAction: _showDescription
                        ? TextInputAction.next
                        : TextInputAction.done,
                    onSubmitted: (_) {
                      if (_showDescription) {
                        _descriptionFocusNode.requestFocus();
                      } else {
                        _saveTask();
                      }
                    },
                    onChanged: (_) => setState(() {}),
                  ),

                  // Description input (conditional)
                  if (_showDescription) ...[
                    const SizedBox(height: AppSpacing.md),
                    TextField(
                      controller: _descriptionController,
                      focusNode: _descriptionFocusNode,
                      style: const TextStyle(fontSize: AppFontSizes.small),
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: '세부 정보 추가 (선택사항)',
                        hintStyle: TextStyle(
                          fontSize: AppFontSizes.small,
                          color: AppColors.textDisabled,
                        ),
                        filled: true,
                        fillColor: AppColors.surfaceVariant,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppBorderRadius.md),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.all(AppSpacing.md),
                      ),
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _saveTask(),
                    ),
                  ],

                  const SizedBox(height: AppSpacing.lg),

                  // Action buttons
                  Row(
                    children: [
                      // Description toggle button
                      _buildActionButton(
                        icon: Icons.subject_rounded,
                        label: '세부정보',
                        isActive: _showDescription,
                        onTap: () {
                          setState(() {
                            _showDescription = !_showDescription;
                          });
                          if (_showDescription) {
                            Future.delayed(const Duration(milliseconds: 100),
                                () {
                              if (mounted) {
                                _descriptionFocusNode.requestFocus();
                              }
                            });
                          }
                        },
                      ),
                      const SizedBox(width: AppSpacing.sm),

                      // Favorite toggle button
                      _buildActionButton(
                        icon: _isFavorite
                            ? Icons.star_rounded
                            : Icons.star_outline_rounded,
                        label: '즐겨찾기',
                        isActive: _isFavorite,
                        onTap: () {
                          setState(() {
                            _isFavorite = !_isFavorite;
                          });
                        },
                      ),

                      const Spacer(),

                      // Save button
                      ElevatedButton(
                        onPressed: _isTitleFilled ? _saveTask : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: AppColors.border,
                          disabledForegroundColor: AppColors.textDisabled,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.xl,
                            vertical: AppSpacing.md,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppBorderRadius.md),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          '추가',
                          style: TextStyle(
                            fontSize: AppFontSizes.medium,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppBorderRadius.md),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryContainer : AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(AppBorderRadius.md),
          border: Border.all(
            color: isActive ? AppColors.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: AppIconSizes.small,
              color: isActive ? AppColors.primary : AppColors.iconInactive,
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              label,
              style: TextStyle(
                fontSize: AppFontSizes.small,
                fontWeight: FontWeight.w600,
                color: isActive ? AppColors.primary : AppColors.textSecondary,
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
