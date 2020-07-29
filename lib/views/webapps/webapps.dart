import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/dataSource.dart';
import 'package:portfolio/utils/emphasizedText.dart';
import 'package:portfolio/utils/flipFlopText.dart';
import 'package:portfolio/utils/headings.dart';
import 'package:portfolio/utils/imageCard.dart';
import 'package:portfolio/utils/switcher.dart';
import 'package:portfolio/utils/urlHandler.dart';

class WebAppsWidget extends StatefulWidget {
  @override
  _WebAppsWidgetState createState() => _WebAppsWidgetState();
}

class _WebAppsWidgetState extends State<WebAppsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:
          CustomScrollView(physics: BouncingScrollPhysics(), slivers: <Widget>[
        SliverList(
            delegate: SliverChildListDelegate([
          BodyHead(icon: Entypo.signal, label: "Web applications"),
          Divider(),
          EmphasizedTextContainer(
            icon: Entypo.info_with_circle,
            text: FlipFlopText(startWith: FlipFlopStart.Flop, textList: [
              "Web development - ",
              "I love web development as well. Though I am new to it, I love the way everything is laid out for the developers to write an application of their choice in the web as well. I am not familiar with most modern web frameworks except ",
              "Flutter web ",
              "using which this ",
              "portfolio app ",
              "is created. Here are some other web based projects of mine",
            ]),
          ),
          Divider(),
        ])),
        
        _buildWebApps(),
      ]),
    );
  }

  Widget _buildWebApps() {
    return SliverGrid.extent(
        maxCrossAxisExtent: SwitcherMediaQuery.isPc(context)?460:640,
        childAspectRatio: 0.6,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(WebAppModel.apps.length, (i) {
          var wa = WebAppModel.apps[i];
          return ImageCard(
            startDelay: Duration(milliseconds: 400 * i),
            imagePath: wa.imagePath,
            title: wa.title,
            body: wa.description,
            action: wa.launchUrl == null
                ? SizedBox.shrink()
                : Container(
                    color: Colors.blue,
                    child: FlatButton(
                      onPressed: () async => await gotoUrl(wa.launchUrl),
                      child: Text("Launch Application"),
                      color: Colors.transparent,
                    ),
                  ),
          );
        }));
  }
}
