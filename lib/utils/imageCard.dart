import 'package:flutter/material.dart';
import 'package:portfolio/utils/gridLoadingImage.dart';

class ImageCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String body;
  final Widget action;
  final Duration animationDuration;
  final Duration startDelay;

  ImageCard(
      {@required this.imagePath,
      @required this.title,
      @required this.body,
      this.action,
      this.startDelay = const Duration(milliseconds: 0),
      this.animationDuration = const Duration(milliseconds: 1500),
      Key key})
      : super(key: key);

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController _animationController;
  Animation<Offset> _offsetAnim;
  Animation<double> _textAnim;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _offsetAnim = Tween<Offset>(begin: Offset(0, -50), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeOut));
    _textAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 1, curve: Curves.easeOut)));

    Future.delayed(widget.startDelay).then((val) {
      try {
        _animationController.forward().orCancel;
      } on TickerCanceled {}
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Transform.translate(
        offset: _offsetAnim.value,
        child: Opacity(
          opacity: _textAnim.value,
          child: Card(
            elevation: 1.0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            child: Opacity(
              opacity: _textAnim.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: GridAssetLoadingImage(
                          assetImagePath: widget.imagePath)),
                  SizedBox(
                    height: 8.0,
                  ),
                  Transform.translate(
                    offset: Offset((1 - _textAnim.value) * 50, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.title,
                        style: Theme.of(context).textTheme.title,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Divider(),
                  Transform.translate(
                    offset: Offset((1 - _textAnim.value) * -50, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.body,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  widget.action != null ? widget.action : SizedBox.shrink()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
