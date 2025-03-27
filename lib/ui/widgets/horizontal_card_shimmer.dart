import 'package:flutter/material.dart';
import 'package:marveldex/core/styles/app_styles.dart';

class HorizontalCardShimmer extends StatelessWidget {
  const HorizontalCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      decoration: BoxDecoration(
        color: AppStyles.grey.withAlpha(100),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 8,
          children: [
            ClipOval(
              child: Container(width: 150, height: 150, color: AppStyles.grey),
            ),
            Column(
              spacing: 4,
              children: [
                Container(width: 150, height: 20, color: AppStyles.grey),
                Container(width: 150, height: 20, color: AppStyles.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
