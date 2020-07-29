import 'package:flutter/material.dart';
import 'package:portfolio/utils/switcher.dart';
import '../dataSource.dart';

class HobbyView extends StatefulWidget {
  final Hobby hobby;
  final Duration animationDuration;
  final Duration animationDelay;

  HobbyView(
      {@required this.hobby,
      this.animationDuration = const Duration(milliseconds: 1000),
      this.animationDelay = const Duration(milliseconds: 0),
      Key key})
      : super(key: key);

  @override
  _HobbyViewState createState() => _HobbyViewState();
}

class _HobbyViewState extends State<HobbyView>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController _animationController;
  Animation<double> _anim1;
  Animation<double> _anim2;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _anim1 = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 0.5, curve: Curves.bounceOut)));
    _anim2 = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.3, 1.0, curve: Curves.easeOut)));

    Future.delayed(widget.animationDelay).then((val) {
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
      builder: (context, child) => Transform.scale(
        scale: _anim1.value,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          elevation: 1.0,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.grey[50], Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Opacity(
                opacity: _anim2.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.hobby.name,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Divider(),
                    Container(
                      child: Text(
                        widget.hobby.description,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
