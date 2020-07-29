import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:portfolio/utils/app.dart';
import 'package:portfolio/views/image_viewer/image_viewer.dart';

class GridAssetLoadingImage extends StatefulWidget {
  final String assetImagePath;
  final Widget loader;
  final BoxFit fit;
  final Duration fadeDuration;

  GridAssetLoadingImage(
      {@required this.assetImagePath,
      this.loader,
      this.fit = BoxFit.cover,
      this.fadeDuration = const Duration(milliseconds: 500),
      Key key})
      : super(key: key);

  @override
  _GridAssetLoadingImageState createState() => _GridAssetLoadingImageState();
}

class _GridAssetLoadingImageState extends State<GridAssetLoadingImage> {

  bool _loaded = false;
  double _widgetOpacity = 1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage(widget.assetImagePath), context)
        .then((val) => setState(() {
              _widgetOpacity = 0;
              var waitDuration = Duration(
                  milliseconds: widget.fadeDuration.inMilliseconds + 100);
              Future.delayed(waitDuration)
                  .then((val) => setState(() {
                        _loaded = true;
                        _widgetOpacity = 1;
                      }))
                  .catchError((e) {});
            }))
        .catchError((e) {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var child = _loaded
        ? Image.asset(
          widget.assetImagePath,
          fit: widget.fit,
        )
        : widget.loader == null
            ? Container(
                color: Colors.grey[100],
                child: Center(
                    child: SpinKitDualRing(
                  color: Colors.grey[700],
                )))
            : widget.loader;

    var animatedOp = AnimatedOpacity(
        child: child, opacity: _widgetOpacity, duration: widget.fadeDuration);

    return _loaded
        ? CursorPointer(
            child: animatedOp,
            onPressed: () async {
              if (_loaded)
                await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ImageViewer(imagePath: widget.assetImagePath)));
            })
        : animatedOp;
  }
}

class HeadingGridLoadingImage extends StatefulWidget {
  final String heading;
  final GridAssetLoadingImage image;

  HeadingGridLoadingImage(
      {@required this.heading, @required this.image, Key key})
      : super(key: key);

  @override
  _HeadingGridLoadingImageState createState() =>
      _HeadingGridLoadingImageState();
}

class _HeadingGridLoadingImageState extends State<HeadingGridLoadingImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            widget.heading,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        widget.image
      ],
    );
  }
}

class HeadingCard extends StatefulWidget {
  final String heading;
  final Widget body;

  HeadingCard({@required this.heading, @required this.body});

  @override
  _HeadingCardState createState() => _HeadingCardState();
}

class _HeadingCardState extends State<HeadingCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(widget.heading, style: Theme.of(context).textTheme.headline),
          SizedBox(
            height: 8,
          ),
          widget.body
        ],
      ),
    );
  }
}
