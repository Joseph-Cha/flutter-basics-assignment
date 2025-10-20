import 'package:flutter/material.dart';
import 'package:tasks/core/constants/app_constants.dart';

class AddActionButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AddActionButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(-2, 4),
          ),
        ],
        shape: BoxShape.circle,
        color: AppColors.primaryRed,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: GestureDetector(
          onTap: onPressed,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: AppIconSizes.small,
          ),
        ),
      ),
    );
  }
}
