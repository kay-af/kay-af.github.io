import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:portfolio/utils/app.dart';
import 'package:portfolio/views/video/video_viewer.dart';

class VideoWidget extends StatefulWidget {
  final String pathToThumbnail;
  final String pathToVideo;
  final String caption;
  final Duration fadeDuration;

  VideoWidget(
      {@required this.pathToThumbnail,
      @required this.pathToVideo,
      this.caption,
      this.fadeDuration = const Duration(milliseconds: 500),
      Key key})
      : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  AssetImage _thumbnail;
  bool _loading = true;
  double _opacity = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((time) {
      setState(() {
        _opacity = 1;
      });

      precacheImage(AssetImage(widget.pathToThumbnail), context).then((img) {
        setState(() {
          _opacity = 0;
        });
        Future.delayed(widget.fadeDuration).then((_) {
          setState(() {
            _loading = false;
            _opacity = 1;
            _thumbnail = AssetImage(widget.pathToThumbnail);
          });
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          widget.caption != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  child: Text(
                    widget.caption,
                    textAlign: TextAlign.center,
                  ),
                )
              : SizedBox.shrink(),
          AnimatedOpacity(
              duration: widget.fadeDuration,
              opacity: _opacity,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: _loading
                    ? Container(
                        color: Colors.grey[200],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SpinKitDualRing(
                              color: Colors.grey[700],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Loading video!",
                              style: Theme.of(context).textTheme.title,
                            ),
                          ],
                        ),
                      )
                    : Stack(
                        fit: StackFit.loose,
                        children: <Widget>[
                          Positioned.fill(
                            child: Image(
                              image: _thumbnail,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned.fill(
                              child: Center(
                            child: CursorPointer(
                              onPressed: () async {
                                await Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => VideoViewer(
                                            videoPath: widget.pathToVideo)));
                              },
                              child: Icon(
                                Icons.play_circle_filled,
                                size: 108,
                                color: Colors.white,
                              ),
                            ),
                          ))
                        ],
                      ),
              )),
        ],
      ),
    );
  }
}
