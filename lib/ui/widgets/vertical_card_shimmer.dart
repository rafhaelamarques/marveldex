import 'package:flutter/material.dart';
import 'package:marveldex/core/styles/app_styles.dart';

class VerticalCardShimmer extends StatelessWidget {
  const VerticalCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      width: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 10,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(width: 150, height: 200, color: AppStyles.grey),
            ),
            Container(width: 100, height: 20, color: AppStyles.grey),
          ],
        ),
      ),
    );
  }
}
