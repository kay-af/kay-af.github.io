import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/dataSource.dart';
import 'package:portfolio/utils/appContainer.dart';
import 'package:portfolio/utils/emphasizedText.dart';
import 'package:portfolio/utils/flipFlopText.dart';
import 'package:portfolio/utils/headings.dart';

class MobileAppsWidget extends StatefulWidget {
  @override
  _MobileAppsWidgetState createState() => _MobileAppsWidgetState();
}

class _MobileAppsWidgetState extends State<MobileAppsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:
          CustomScrollView(physics: BouncingScrollPhysics(), slivers: <Widget>[
        SliverList(
            delegate: SliverChildListDelegate([
          BodyHead(icon: Entypo.mobile, label: "Mobile applications"),
          Divider(),
          EmphasizedTextContainer(
            icon: Entypo.info_with_circle,
            text: FlipFlopText(
              startWith: FlipFlopStart.Flop,
              textList: [
              "Mobile development - ",
              "with the advent of ",
              "Android ",
              "and ",
              "iOS ",
              "smartphones, a whole new era of handheld applications began making life easier. Though, I have had a little experience in making small apps for Android using ",
              "Java, ",
              "I never tried to make a piece of software in native android as it seemed an overkill for something I might not want to launch. The arrival of ",
              "Flutter Framework ",
              "made the development process so easy. Hence, I started taking interest in mobile app development too."
            ]),
          ),
          Divider(),
        ])),
        _buildMobileApps(),
      ]),
    );
  }

  Widget _buildMobileApps() {
    return SliverList(delegate: SliverChildListDelegate(
      MobileAppModel.models.map((model) {
        return MobileAppContainer(model: model,);
      }).toList()
    ));
  }
}