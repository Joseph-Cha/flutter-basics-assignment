import 'package:flutter/material.dart';
import 'package:tasks/core/constants/app_constants.dart';

class AddActionButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AddActionButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: AppColors.accent(context),
      foregroundColor: Colors.white,
      elevation: AppElevation.high,
      icon: const Icon(
        Icons.add_rounded,
        size: AppIconSizes.medium,
      ),
      label: const Text(
        '할 일 추가',
        style: TextStyle(
          fontSize: AppFontSizes.medium,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
