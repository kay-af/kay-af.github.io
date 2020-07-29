import 'package:portfolio/utils/gridLoadingImage.dart';

import '../dataSource.dart';
import 'package:flutter/material.dart';

class AchievementView extends StatefulWidget {
  final Achievement achievement;

  AchievementView({@required this.achievement, Key key}) : super(key: key);

  @override
  _AchievementViewState createState() => _AchievementViewState();
}

class _AchievementViewState extends State<AchievementView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 8.0,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.achievement.title,
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            indent: 8,
            endIndent: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.achievement.description,
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              child: GridAssetLoadingImage(
                  assetImagePath: widget.achievement.imagePath, fit: BoxFit.cover,))
        ],
      ),
    );
  }
}
