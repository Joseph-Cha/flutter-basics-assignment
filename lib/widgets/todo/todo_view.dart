import 'package:flutter/material.dart';
import 'package:tasks/core/constants/app_constants.dart';
import 'package:tasks/models/todo_entity.dart';
import 'package:tasks/pages/todo_detail_page.dart';

class TodoView extends StatelessWidget {
  final TodoEntity todoEntity;
  final VoidCallback onToggleDone;
  final VoidCallback onToggleFavorite;

  const TodoView({
    super.key,
    required this.todoEntity,
    required this.onToggleDone,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetail(context),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.sm,
          horizontal: AppSpacing.md,
        ),
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppBorderRadius.md),
          color: AppColors.cardBackground,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onToggleDone,
              child: Icon(
                todoEntity.isDone
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                todoEntity.title,
                style: TextStyle(
                  decoration: todoEntity.isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontSize: AppFontSizes.medium,
                ),
              ),
            ),
            GestureDetector(
              onTap: onToggleFavorite,
              child: Icon(
                todoEntity.isFavorite ? Icons.star : Icons.star_border,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _navigateToDetail(BuildContext context) async {
    final bool? updatedFavoriteStatus = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => TodoDetailPage(todoEntity: todoEntity),
      ),
    );

    // DetailPage에서 즐겨찾기가 변경되었고, 현재 상태와 다르면 콜백 호출
    if (updatedFavoriteStatus != null &&
        updatedFavoriteStatus != todoEntity.isFavorite) {
      onToggleFavorite();
    }
  }
}
