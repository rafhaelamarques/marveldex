import 'package:flutter/material.dart';
import 'package:marveldex/core/styles/app_styles.dart';
import 'package:marveldex/data/model/character.dart';
import 'package:marveldex/ui/widgets/cached_image.dart';

class CharacterVerticalCard extends StatelessWidget {
  final Character character;
  final VoidCallback onTap;
  const CharacterVerticalCard({
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
        width: 200,
        decoration: BoxDecoration(
          color: AppStyles.lightRed,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedImage(
                  imageUrl: character.thumbnail.url,
                  size: const Size(150, 200),
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                character.name,
                style: AppStyles.title.copyWith(color: AppStyles.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
