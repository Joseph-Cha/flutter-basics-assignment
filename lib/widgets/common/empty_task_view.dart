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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Illustration container
            Container(
              padding: const EdgeInsets.all(AppSpacing.xxl),
              decoration: BoxDecoration(
                color: AppColors.primaryContainer(context).withAlpha((255 * 0.3).round()),
                shape: BoxShape.circle,
              ),
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.xl),
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer(context),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.task_alt_rounded,
                  size: AppIconSizes.xxLarge,
                  color: AppColors.primary(context),
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.xxl),

            // Title
            Text(
              '아직 할 일이 없어요',
              style: TextStyle(
                fontSize: AppFontSizes.xLarge,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary(context),
              ),
            ),

            const SizedBox(height: AppSpacing.sm),

            // Subtitle
            Text(
              "$ownerName님의 첫 할 일을 추가해보세요!\n아래 버튼을 눌러 시작할 수 있습니다.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppFontSizes.medium,
                color: AppColors.textTertiary(context),
                height: 1.5,
              ),
            ),

            const SizedBox(height: AppSpacing.xxl),

            // Tips container
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.surface(context),
                borderRadius: BorderRadius.circular(AppBorderRadius.md),
                border: Border.all(
                  color: AppColors.borderLight(context),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline_rounded,
                        size: AppIconSizes.medium,
                        color: AppColors.starYellow(context),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        'TIP',
                        style: TextStyle(
                          fontSize: AppFontSizes.small,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary(context),
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _buildTipItem(
                    icon: Icons.star_outline_rounded,
                    text: '중요한 할 일은 즐겨찾기로 표시하세요',
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _buildTipItem(
                    icon: Icons.check_circle_outline_rounded,
                    text: '완료한 할 일은 체크박스를 눌러보세요',
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _buildTipItem(
                    icon: Icons.touch_app_rounded,
                    text: '할 일을 탭하면 상세 정보를 볼 수 있어요',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipItem({required IconData icon, required String text}) {
    return Builder(
      builder: (context) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: AppIconSizes.small,
              color: AppColors.iconInactive(context),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: AppFontSizes.small,
                  color: AppColors.textSecondary(context),
                  height: 1.4,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
