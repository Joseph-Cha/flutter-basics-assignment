import 'package:flutter/material.dart';
import 'package:tasks/core/constants/app_constants.dart';

class EmptyTaskView extends StatelessWidget {
  final String ownerName;

  const EmptyTaskView({
    super.key,
    required this.ownerName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppBorderRadius.sm),
            color: AppColors.containerBackground,
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.note_add_outlined,
                  size: AppIconSizes.large,
                  color: AppColors.primaryAmber,
                ),
                const SizedBox(height: AppSpacing.xs),
                const Text(
                  '아직 할 일이 없음',
                  style: TextStyle(
                    fontSize: AppFontSizes.medium,
                    color: AppColors.textHint,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  "할 일을 추가하고 $ownerName's Task에서\n할 일을 추적하세요.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: AppFontSizes.small,
                    color: AppColors.textDisabled,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
