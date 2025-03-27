import 'package:flutter/material.dart';
import 'package:marveldex/core/styles/app_styles.dart';
import 'package:marveldex/data/model/character.dart';
import 'package:marveldex/ui/widgets/cached_image.dart';

class CharacterHorizontalCard extends StatelessWidget {
  final Character character;
  final VoidCallback onTap;

  const CharacterHorizontalCard({
    super.key,
    required this.character,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
        decoration: BoxDecoration(
          color: AppStyles.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              spreadRadius: 2,
              color: AppStyles.grey.withValues(alpha: 0.6),
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 8,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: AppStyles.lightRed, width: 2),
                  borderRadius: BorderRadius.circular(75),
                ),
                child: ClipOval(
                  child: CachedImage(
                    imageUrl: character.thumbnail.url,
                    size: const Size(150, 150),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(character.name, style: AppStyles.title),
                    Text(
                      character.info,
                      style: AppStyles.body.copyWith(color: AppStyles.darkGrey),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
