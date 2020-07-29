import 'package:flutter/material.dart';
import 'package:portfolio/utils/switcher.dart';

class BodyHead extends StatefulWidget {
  final IconData icon;
  final String label;

  BodyHead({@required this.icon, @required this.label, Key key})
      : super(key: key);

  @override
  _BodyHeadState createState() => _BodyHeadState();
}

class _BodyHeadState extends State<BodyHead>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController _animationController;
  Animation<double> _iconAnimation;
  Animation<double> _headAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _iconAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 1, curve: Curves.bounceInOut)));
    _headAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    try {
      _animationController.forward().orCancel;
    } catch (e) {
      debugPrint(e.toString());
    }
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
      builder: (context, child) => Opacity(
        opacity: _headAnimation.value,
        child: Row(
          mainAxisAlignment: SwitcherMediaQuery.isPc(context)
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: <Widget>[
            Transform.scale(
              scale: _iconAnimation.value,
              child: Icon(
                widget.icon,
                size: 60,
              ),
            ),
            SizedBox(
              width: 22,
            ),
            Expanded(
              child: Text(
                widget.label,
                style: !SwitcherMediaQuery.isMobile(context)?Theme.of(context).textTheme.display3:Theme.of(context).textTheme.display1,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BodySubhead extends StatefulWidget {
  final String label;

  BodySubhead({@required this.label, Key key}) : super(key: key);

  @override
  _BodySubheadState createState() => _BodySubheadState();
}

class _BodySubheadState extends State<BodySubhead> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((time) => setState(() => _opacity = 1));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 1000),
      opacity: _opacity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          widget.label,
          style: !SwitcherMediaQuery.isMobile(context)?Theme.of(context).textTheme.display1:Theme.of(context).textTheme.title,
          textAlign: SwitcherMediaQuery.isPc(context)
              ? TextAlign.start
              : TextAlign.center,
        ),
      ),
    );
  }
}
