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
    final bool isFavorite = todoEntity.isFavorite;
    final bool isDone = todoEntity.isDone;

    return GestureDetector(
      onTap: () => _navigateToDetail(context),
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        decoration: BoxDecoration(
          color: isFavorite ? AppColors.favoriteBackground : AppColors.surface,
          borderRadius: BorderRadius.circular(AppBorderRadius.md),
          border: Border.all(
            color: isFavorite ? AppColors.favoriteBorder : AppColors.borderLight,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _navigateToDetail(context),
            borderRadius: BorderRadius.circular(AppBorderRadius.md),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.md,
                horizontal: AppSpacing.md,
              ),
              child: Row(
                children: [
                  // Checkbox
                  InkWell(
                    onTap: onToggleDone,
                    borderRadius: BorderRadius.circular(AppBorderRadius.round),
                    child: Container(
                      width: AppIconSizes.large,
                      height: AppIconSizes.large,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isDone ? AppColors.success : AppColors.border,
                          width: 2,
                        ),
                        color: isDone ? AppColors.success : Colors.transparent,
                      ),
                      child: isDone
                          ? const Icon(
                              Icons.check,
                              size: AppIconSizes.small,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),

                  // Title
                  Expanded(
                    child: Text(
                      todoEntity.title,
                      style: TextStyle(
                        fontSize: AppFontSizes.medium,
                        fontWeight: FontWeight.w500,
                        color: isDone
                            ? AppColors.textTertiary
                            : AppColors.textPrimary,
                        decoration: isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationColor: AppColors.textTertiary,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),

                  // Favorite button
                  InkWell(
                    onTap: onToggleFavorite,
                    borderRadius: BorderRadius.circular(AppBorderRadius.round),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.xs),
                      child: Icon(
                        isFavorite ? Icons.star_rounded : Icons.star_outline_rounded,
                        size: AppIconSizes.medium,
                        color: isFavorite
                            ? AppColors.starYellow
                            : AppColors.iconInactive,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
