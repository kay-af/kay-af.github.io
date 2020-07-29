import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ImageViewer extends StatefulWidget {
  final String imagePath;

  ImageViewer({@required this.imagePath, Key key}) : super(key: key);

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  Size _imageSize;

  @override
  void initState() {
    super.initState();
    _loadImage().then((size) => setState(() => _imageSize = size));
  }

  Future<Size> _loadImage() async {
    var assetImage = AssetImage(widget.imagePath);

    var str = assetImage.resolve(ImageConfiguration());

    Completer<ui.Image> completer = new Completer();
    str.addListener(ImageStreamListener((ImageInfo imageInfo, bool _) {
      completer.complete(imageInfo.image);
    }));

    var image = await completer.future;
    return Size(image.width.toDouble(), image.height.toDouble());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Image viewer"),
        automaticallyImplyLeading: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (_imageSize == null) {
          return Center(
            child: SpinKitDualRing(color: Colors.white),
          );
        }

        double bodyAspect = constraints.maxWidth / constraints.maxHeight;
        double imageAspect = _imageSize.width / _imageSize.height;

        BoxFit imageFit =
            imageAspect > bodyAspect ? BoxFit.fitWidth : BoxFit.fitHeight;

        return SizedBox.expand(
          child: Image.asset(
            widget.imagePath,
            fit: imageFit,
          ),
        );
      }),
    );
  }
}
