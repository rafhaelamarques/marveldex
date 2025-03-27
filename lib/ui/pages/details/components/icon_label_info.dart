import 'package:flutter/material.dart';
import 'package:marveldex/core/styles/app_styles.dart';

class IconLabelInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const IconLabelInfo({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: AppStyles.body.copyWith(fontWeight: FontWeight.bold),
        ),
        Row(
          spacing: 4,
          children: [
            Icon(icon, color: AppStyles.orange),
            Text(
              value,
              style: AppStyles.subtitle.copyWith(color: AppStyles.orange),
            ),
          ],
        ),
      ],
    );
  }
}
