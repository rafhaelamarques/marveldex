import 'package:flutter/material.dart';
import 'package:marveldex/core/styles/app_styles.dart';
import 'package:marveldex/ui/widgets/horizontal_card_shimmer.dart';
import 'package:marveldex/ui/widgets/vertical_card_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Shimmer.fromColors(
        baseColor: AppStyles.shimmerBaseColor,
        highlightColor: AppStyles.shimmerHighlightColor,
        child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                color: AppStyles.grey.withAlpha(100),
                child: Row(
                  spacing: 8,
                  children: List.generate(
                    5,
                    (index) => const VerticalCardShimmer(),
                  ),
                ),
              ),
            ),
            Column(
              children: List.generate(
                10,
                (index) => const HorizontalCardShimmer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
