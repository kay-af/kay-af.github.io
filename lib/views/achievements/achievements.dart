import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/utils/achievementView.dart';
import 'package:portfolio/utils/emphasizedText.dart';
import 'package:portfolio/utils/flipFlopText.dart';
import 'package:portfolio/utils/gridLoadingImage.dart';
import 'package:portfolio/utils/headings.dart';
import '../../dataSource.dart';

class AchievementsWidget extends StatefulWidget {
  @override
  _AchievementsWidgetState createState() => _AchievementsWidgetState();
}

class _AchievementsWidgetState extends State<AchievementsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            BodyHead(icon: Entypo.trophy, label: "Achievements"),
            Divider(),
          ])),
          _buildAchievements()
        ],
      ),
    );
  }

  Widget _buildAchievements() {

    return SliverGrid.extent(
        maxCrossAxisExtent: 490,
        childAspectRatio: 0.84,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List<Widget>.generate(Achievement.achievements.length, (i) {
          return AchievementView(
            achievement: Achievement.achievements[i],
          );
        }));
  }
}