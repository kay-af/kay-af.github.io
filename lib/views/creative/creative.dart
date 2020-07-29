import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/utils/creativeView.dart';
import 'package:portfolio/utils/emphasizedText.dart';
import 'package:portfolio/utils/flipFlopText.dart';
import 'package:portfolio/utils/headings.dart';
import '../../dataSource.dart';

class CreativeWidget extends StatefulWidget {
  @override
  _CreativeWidgetState createState() => _CreativeWidgetState();
}

class _CreativeWidgetState extends State<CreativeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            BodyHead(icon: Entypo.star, label: "Creative programming"),
            Divider(),
            EmphasizedTextContainer(
              icon: Entypo.info,
                text: FlipFlopText(
              textList: [
                "Some small visual creative programs help me understand the logic / math related to basic ",
                "Graphics. ",
                "Here are few of my works"
              ],
            )),
          ])),
          _buildCreative(),
        ],
      ),
    );
  }

  Widget _buildCreative() {
    return SliverGrid.extent(
        maxCrossAxisExtent: 640,
        childAspectRatio: 0.84,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List<Widget>.generate(CreativeWork.creativeWorks.length, (i) {
          return CreativeView(
            creativeWork: CreativeWork.creativeWorks[i],
          );
        }));
  }
}
