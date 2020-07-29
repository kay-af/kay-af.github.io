import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/dataSource.dart';
import 'package:portfolio/utils/gridLoadingImage.dart';
import 'package:portfolio/utils/headings.dart';
import 'package:portfolio/utils/imageCard.dart';
import 'package:portfolio/utils/urlHandler.dart';
import 'package:portfolio/utils/viewAll.dart';

class GalleryWidget extends StatefulWidget {
  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            BodyHead(icon: Entypo.infinity, label: "Gallery"),
            Divider(),
            BodySubhead(label: "Digital Arts"),
          ])),
          _buildRenders(),
          SliverViewAllButton(onPressed: () {}),

          // Web apps
          SliverList(
              delegate: SliverChildListDelegate([
            Divider(),
            BodySubhead(label: "Web Applications"),
          ])),
          _buildWebApps(),
        ],
      ),
    );
  }

  Widget _buildRenders() {
    var renderPaths = [
      RenderPaths.FOOTBALL,
      RenderPaths.ROOM,
      RenderPaths.ALARM,
      RenderPaths.LANTERN
    ];

    return SliverGrid.extent(
        maxCrossAxisExtent: 620,
        childAspectRatio: 1.67,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List<Widget>.generate(renderPaths.length, (i) {
          return GridAssetLoadingImage(
            assetImagePath: renderPaths[i],
          );
        }));
  }

  Widget _buildWebApps() {
    return SliverGrid.extent(
      maxCrossAxisExtent: 460,
      childAspectRatio: 0.6,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: WebAppModel.apps.map<Widget>((wa) {
        return ImageCard(
          imagePath: wa.imagePath,
          title: wa.title,
          body: wa.description,
          action: wa.launchUrl == null
              ? SizedBox.shrink()
              : FlatButton(
                  onPressed: () async => await gotoUrl(wa.launchUrl),
                  child: Text("Launch Application"),
                  color: Colors.blue,
                ),
        );
      }).toList(),
    );
  }
}
