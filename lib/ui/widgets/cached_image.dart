import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marveldex/core/styles/images.dart';

class CachedImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit? fit;
  final FilterQuality filterQuality;
  final PlaceholderWidgetBuilder? placeHolder;
  final Size? size;

  const CachedImage({
    required this.imageUrl,
    this.placeHolder,
    this.size,
    this.filterQuality = FilterQuality.high,
    this.fit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return Image.asset(
        AppImages.placeholder,
        height: size?.height,
        width: size?.width,
      );
    }
    return CachedNetworkImage(
      filterQuality: filterQuality,
      imageUrl: imageUrl ?? '',
      placeholder: placeHolder,
      fit: fit,
      height: size?.height,
      width: size?.width,
      placeholderFadeInDuration: const Duration(milliseconds: 0),
      errorWidget: (context, url, dynamic v) {
        return Image.asset(
          AppImages.placeholder,
          height: size?.height,
          width: size?.width,
        );
      },
    );
  }
}
