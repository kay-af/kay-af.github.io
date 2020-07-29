import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:portfolio/utils/app.dart';
import 'package:video_player/video_player.dart';

class VideoViewer extends StatefulWidget {
  final String videoPath;
  VideoViewer({@required this.videoPath});

  @override
  _VideoViewerState createState() => _VideoViewerState();
}

class _VideoViewerState extends State<VideoViewer> {
  bool _loaded = false;
  VideoPlayerController _videoPlayerController;
  double _seek;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
      widget.videoPath,
    );
    _videoPlayerController.initialize().then((val) {
      _videoPlayerController.setLooping(true);
      _videoPlayerController.addListener(() {
        setState(() {
          _seek = (_videoPlayerController.value.position.inMilliseconds / _videoPlayerController.value.duration.inMilliseconds).clamp(0.0, 1.0);
        });
      });
      setState(() {
        _loaded = true;
        _videoPlayerController.play();
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void dispose() {
    try {
      _videoPlayerController.dispose();
    } catch (e) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _loaded? FloatingActionButton(
        onPressed: () {
          if (_videoPlayerController.value.isPlaying) {
            _videoPlayerController.pause();
          } else {
            _videoPlayerController.play();
          }
          setState(() {});
        },
        backgroundColor: Colors.white,
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Positioned.fill(
              child: Center(
                child: Icon(
                  _videoPlayerController.value.isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_filled,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.redAccent),
              backgroundColor: Colors.transparent,
              value: _seek,
            ),
                ))
          ],
        ),
      ):null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Video player",
        ),
        automaticallyImplyLeading: true,
        centerTitle: true,
        brightness: Brightness.dark,
      ),
      backgroundColor: Colors.black,
      body: _loaded
          ? SizedBox.expand(
              child: AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              ),
            )
          : Center(
              child: SpinKitDualRing(color: Colors.white),
            ),
    );
  }
}
