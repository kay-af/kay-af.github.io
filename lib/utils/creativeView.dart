import 'package:flutter/material.dart';
import 'package:portfolio/utils/gridLoadingImage.dart';
import 'package:portfolio/utils/switcher.dart';
import '../dataSource.dart';

class CreativeView extends StatefulWidget {
  final CreativeWork creativeWork;
  final Duration animationDelay;
  final Duration animationDuration;

  CreativeView(
      {@required this.creativeWork,
      this.animationDelay = const Duration(milliseconds: 0),
      this.animationDuration = const Duration(milliseconds: 500),
      Key key})
      : super(key: key);

  @override
  _CreativeViewState createState() => _CreativeViewState();
}

class _CreativeViewState extends State<CreativeView>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController _animationController;
  Animation<double> _opacityAnim;
  Animation<double> _scaleAnim;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _opacityAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0, 0.5, curve: Curves.easeOut),
    ));
    _scaleAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 1.0, curve: Curves.bounceOut)));

    Future.delayed(widget.animationDelay).then((_) {
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
  Widget build(BuildContext context) {
    super.build(context);
    return AnimatedBuilder(
      animation: _animationController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text(
                  widget.creativeWork.title,
                  style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.center,
                ),
                Divider(),
                Text(
                  widget.creativeWork.subtitle,
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.center,
                ),
                Divider(),
                Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: List<Widget>.generate(
                        widget.creativeWork.frameworks.length,
                        (i) => Chip(
                              label: Text(widget.creativeWork.frameworks[i]),
                            )))
              ],
            ),
          ),
          Expanded(
              child: GridAssetLoadingImage(
                  assetImagePath: widget.creativeWork.gifPath))
        ],
      ),
      builder: (context, child) => Transform.scale(
        scale: _scaleAnim.value,
        child: Opacity(
          opacity: _opacityAnim.value,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                  SwitcherMediaQuery.isPc(context) ? 16.0 : 8.0)),
            ),
            elevation: 1.0,
            color: Colors.white,
            child: child,
          ),
        ),
      ),
    );
  }
}
