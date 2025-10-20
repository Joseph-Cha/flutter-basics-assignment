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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppColors.textPrimary, size: AppIconSizes.small),
          onPressed: () => Navigator.pop(context, _currentTodo.isFavorite),
        ),
        actions: [
          IconButton(
            onPressed: _toggleFavorite,
            icon: Icon(
              _currentTodo.isFavorite
                  ? Icons.star_rounded
                  : Icons.star_outline_rounded,
              color: _currentTodo.isFavorite
                  ? AppColors.starYellow
                  : AppColors.iconInactive,
              size: AppIconSizes.large,
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: AppColors.borderLight,
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppBorderRadius.md),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: AppFontSizes.xxLarge,
                        decoration: BoxDecoration(
                          color: _currentTodo.isFavorite
                              ? AppColors.starYellow
                              : AppColors.primary,
                          borderRadius:
                              BorderRadius.circular(AppBorderRadius.sm),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Text(
                          _currentTodo.title,
                          style: const TextStyle(
                            fontSize: AppFontSizes.xxLarge,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            // Description Card
            if (_currentTodo.description != null &&
                _currentTodo.description!.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppBorderRadius.md),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.subject_rounded,
                          size: AppIconSizes.medium,
                          color: AppColors.iconInactive,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        const Text(
                          '세부 정보',
                          style: TextStyle(
                            fontSize: AppFontSizes.small,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textTertiary,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      _currentTodo.description!,
                      style: const TextStyle(
                        fontSize: AppFontSizes.medium,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: AppSpacing.md),

            // Status Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppBorderRadius.md),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        size: AppIconSizes.medium,
                        color: AppColors.iconInactive,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      const Text(
                        '상태',
                        style: TextStyle(
                          fontSize: AppFontSizes.small,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textTertiary,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _buildStatusChip(
                    icon: _currentTodo.isDone
                        ? Icons.check_circle_rounded
                        : Icons.radio_button_unchecked_rounded,
                    label: _currentTodo.isDone ? '완료됨' : '진행 중',
                    color: _currentTodo.isDone
                        ? AppColors.success
                        : AppColors.iconInactive,
                    backgroundColor: _currentTodo.isDone
                        ? AppColors.successLight
                        : AppColors.surfaceVariant,
                  ),
                  if (_currentTodo.isFavorite) ...[
                    const SizedBox(height: AppSpacing.sm),
                    _buildStatusChip(
                      icon: Icons.star_rounded,
                      label: '즐겨찾기',
                      color: AppColors.starYellow,
                      backgroundColor: AppColors.starYellowLight,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip({
    required IconData icon,
    required String label,
    required Color color,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppBorderRadius.lg),
        border: Border.all(
          color: color.withAlpha((255 * 0.3).round()),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: AppIconSizes.small, color: color),
          const SizedBox(width: AppSpacing.xs),
          Text(
            label,
            style: TextStyle(
              fontSize: AppFontSizes.small,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
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
