import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/dataSource.dart';
import 'package:portfolio/utils/flipFlopText.dart';
import 'package:portfolio/utils/gridLoadingImage.dart';
import 'package:portfolio/utils/switcher.dart';
import 'package:portfolio/utils/urlHandler.dart';

class MobileAppContainer extends StatefulWidget {
  final MobileAppModel model;

  MobileAppContainer({@required this.model, Key key}) : super(key: key);

  @override
  _MobileAppContainerState createState() => _MobileAppContainerState();
}

class _MobileAppContainerState extends State<MobileAppContainer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.grey[100]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  widget.model.appIconPath,
                  width: 32,
                  height: 32,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    widget.model.appName,
                    style: Theme.of(context).textTheme.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: FlipFlopText(
                textList: [
                  "Description: ",
                  "${widget.model.appDescription}"
                ],
                flopStyle: Theme.of(context).textTheme.caption,
              ),
            ),
            Divider(),
            Container(
              height: SwitcherMediaQuery.isPc(context) ? 400 : 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  separatorBuilder: (context, i) {
                    return SizedBox(
                      width: 4,
                    );
                  },
                  itemBuilder: (context, i) {
                    return AspectRatio(
                        aspectRatio: 0.67,
                        child: GridAssetLoadingImage(
                            assetImagePath:
                                widget.model.appScreenshotPaths[i]));
                  },
                  itemCount: widget.model.appScreenshotPaths.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Divider(),
            Wrap(
              direction: Axis.horizontal,
              spacing: 4,
              alignment: WrapAlignment.end,
              runSpacing: 4,
              children: <Widget>[
                widget.model.appWebpage != null
                    ? FlatButton.icon(
                        icon: Icon(FontAwesome.sticky_note),
                        color: Colors.black,
                        onPressed: () async {
                          await gotoUrl(widget.model.appWebpage);
                        },
                        label: Text("Visit web page"))
                    : SizedBox.shrink(),
                FlatButton.icon(
                    icon: Icon(FontAwesome.download),
                    color: Colors.orange,
                    onPressed: () async {
                      await gotoUrl(widget.model.downloadUrl);
                    },
                    label: Text("Download")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
