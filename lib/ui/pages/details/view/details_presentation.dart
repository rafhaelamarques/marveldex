import 'package:flutter/material.dart';
import 'package:marveldex/core/styles/app_styles.dart';
import 'package:marveldex/data/model/character.dart';
import 'package:marveldex/ui/pages/details/components/icon_label_info.dart';
import 'package:marveldex/ui/widgets/cached_image.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DetailsPresentation extends StatelessWidget {
  final Character character;
  const DetailsPresentation({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: AppStyles.lightRed,
              child: CachedImage(
                imageUrl: character.thumbnail.url,
                size: Size(
                  double.infinity,
                  MediaQuery.of(context).size.height * 0.5,
                ),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(character.info, style: AppStyles.body),
                  SizedBox(height: 16),
                  Text('Featured in', style: AppStyles.title),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconLabelInfo(
                        icon: MdiIcons.bookOpenBlankVariant,
                        label: 'Comics',
                        value: character.comics.available.toString(),
                      ),
                      IconLabelInfo(
                        icon: MdiIcons.television,
                        label: 'Series',
                        value: character.series.available.toString(),
                      ),
                      IconLabelInfo(
                        icon: MdiIcons.bookmark,
                        label: 'Stories',
                        value: character.stories.available.toString(),
                      ),
                      IconLabelInfo(
                        icon: MdiIcons.earth,
                        label: 'Events',
                        value: character.events.available.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
