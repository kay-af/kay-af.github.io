import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/dataSource.dart';
import 'package:portfolio/utils/emphasizedText.dart';
import 'package:portfolio/utils/flipFlopText.dart';
import 'package:portfolio/utils/gridLoadingImage.dart';
import 'package:portfolio/utils/headings.dart';

class DigitalArtsWidget extends StatefulWidget {
  @override
  _DigitalArtsWidgetState createState() => _DigitalArtsWidgetState();
}

class _DigitalArtsWidgetState extends State<DigitalArtsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            BodyHead(icon: Entypo.image, label: "Digital Artwork"),
            Divider(),
            EmphasizedTextContainer(
                icon: Entypo.info_with_circle,
                text: FlipFlopText(
                  textList: [
                    "Digital arts - ",
                    "I am a great fan of artwork. I started learning ",
                    "3D modelling ",
                    "in ",
                    "ZModeler ",
                    "& ",
                    "Gmax ",
                    "(A free and lightweight alternative to ",
                    "Autodesk 3Ds Max",
                    ") but, both featured no rendering engine. So, I quickly moved to ",
                    "Blender 3D ",
                    "which is ",
                    "Open-source ",
                    "and has a lot more to offer than previous softwares. Here are some of my 3D / 2D Renders. I did not have any formal training and I am mostly self learned.\n",
                    "Note: ",
                    "These images might appear low resolution due to internet compression"
                  ],
                  startWith: FlipFlopStart.Flop,
                ))
          ])),
          _buildRenders(),
        ],
      ),
    );
  }

  Widget _buildRenders() {
    return SliverToBoxAdapter(
        child: StaggeredGridView.extentBuilder(
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: RenderPaths.gridWidgetData.length,
      maxCrossAxisExtent: 300,
      itemBuilder: (context, i) {
        return GridAssetLoadingImage(
          assetImagePath: RenderPaths.gridWidgetData[i].first,
        );
      },
      staggeredTileBuilder: (i) {
        return StaggeredTile.count(RenderPaths.gridWidgetData[i].second.first,
            RenderPaths.gridWidgetData[i].second.second);
      },
    ));
  }
}
