import 'package:flutter/material.dart';

class EmphasizedTextContainer extends StatefulWidget {
  final IconData icon;
  final Widget text;
  final Duration animationDuration;

  EmphasizedTextContainer(
      {this.icon,
      this.animationDuration = const Duration(milliseconds: 2000),
      @required this.text,
      Key key})
      : super(key: key);

  @override
  _EmphasizedTextContainerState createState() =>
      _EmphasizedTextContainerState();
}

class _EmphasizedTextContainerState extends State<EmphasizedTextContainer>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {

  AnimationController _animController;

  Animation<double> _baseAnimation;
  Animation<double> _iconAnimation;
  Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();
    _animController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _baseAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animController, curve: Interval(0, 1.0, curve: Curves.easeInOutExpo)));
    _iconAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animController,
        curve: Interval(0.3, 0.5, curve: Curves.bounceOut)));
    _textAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animController,
        curve: Interval(0.6, 1.0, curve: Curves.easeInOut)));

    try {
      _animController.forward().orCancel;
    } catch (e) {
      debugPrint(e);
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnimatedBuilder(
      animation: _animController,
      builder: (context, child) => Opacity(
        opacity: _baseAnimation.value,
        child: Card(
          elevation: 0.0,
          margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                widget.icon != null ? Transform.scale(
                  scale: _iconAnimation.value,
                  child: Icon(widget.icon)) : SizedBox.shrink(),
                SizedBox(
                  width: 16,
                ),
                Expanded(child: Opacity(
                  opacity: _textAnimation.value,
                  child: widget.text))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
