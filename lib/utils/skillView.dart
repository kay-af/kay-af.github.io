import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/dataSource.dart';
import 'package:portfolio/utils/app.dart';
import 'package:portfolio/utils/flipFlopText.dart';

class SkillView extends StatefulWidget {
  final Skill skill;
  final Duration animationDuration;
  final Duration startDelay;
  final bool showDialogOnPress;

  SkillView(
      {@required this.skill,
      this.showDialogOnPress = true,
      this.animationDuration = const Duration(milliseconds: 2500),
      this.startDelay = const Duration(milliseconds: 0),
      Key key})
      : super(key: key);

  @override
  _SkillViewState createState() => _SkillViewState();
}

class _SkillViewState extends State<SkillView>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController _animationController;
  Animation<double> _baseTranslateAnim;
  Animation<double> _skillNameAnim;
  Animation<double> _skillDescAnim;
  Animation<double> _progressTextAnim;
  Animation<double> _progressBarAnim;
  bool _mouseOver = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _baseTranslateAnim = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0, 0.5, curve: Curves.bounceOut)));
    _skillNameAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.3, 0.7, curve: Curves.fastOutSlowIn)));
    _skillDescAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.4, 0.8, curve: Curves.fastOutSlowIn)));
    _progressTextAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 0.5, curve: Curves.bounceOut)));
    _progressBarAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 1.0, curve: Curves.bounceOut)));

    _playAnimation();
  }

  void _playAnimation() async {
    await Future.delayed(widget.startDelay);
    try {
      _animationController.forward().orCancel;
    } on TickerCanceled {}
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CursorPointer(
      onEnter: (evt) {
        setState(() {
          _mouseOver = true;
        });
      },
      onExit: (evt) {
        setState(() {
          _mouseOver = false;
        });
      },
      onPressed: widget.showDialogOnPress
          ? () async {
              await _showSkillDialog();
            }
          : () {},
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Transform.translate(
          offset: Offset(0, -45 + _baseTranslateAnim.value * 45),
          child: Opacity(
            opacity: _baseTranslateAnim.value,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Material(
                animationDuration: const Duration(milliseconds: 400),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                elevation: _mouseOver ? 4.0 : 1.0,
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white, Colors.grey[100]],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Transform.translate(
                                offset:
                                    Offset(-30 + 30 * _skillNameAnim.value, 0),
                                child: Opacity(
                                  opacity: _skillNameAnim.value,
                                  child: Text(
                                    widget.skill.skillName,
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                ),
                              ),
                              widget.skill.skillDescription == null
                                  ? SizedBox.shrink()
                                  : Divider(),
                              widget.skill.skillDescription == null
                                  ? SizedBox.shrink()
                                  : Container(
                                      child: Transform.translate(
                                        offset: Offset(
                                            60 - 60 * _skillDescAnim.value, 0),
                                        child: Opacity(
                                          opacity: _skillDescAnim.value,
                                          child: FlipFlopText(
                                            textList: [
                                              "Remarks: ",
                                              widget.skill.skillDescription
                                            ],
                                            flipStyle: Theme.of(context)
                                                .textTheme
                                                .subtitle,
                                            flopStyle: Theme.of(context)
                                                .textTheme
                                                .subtitle
                                                .copyWith(color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        SizedBox(
                          height: 64,
                          width: 64,
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: CircularProgressIndicator(
                                  strokeWidth: 8,
                                  value: widget.skill.skillValue *
                                      _progressBarAnim.value /
                                      100,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.orange),
                                  backgroundColor: Colors.grey[100],
                                ),
                              ),
                              Positioned.fill(
                                  child: Center(
                                      child: Transform.translate(
                                offset: Offset(
                                    0, -75 + 75 * _progressTextAnim.value),
                                child: Text(
                                  (widget.skill.skillValue *
                                          _progressBarAnim.value)
                                      .floor()
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              )))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showSkillDialog() async {
    await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return SkillDialogBox(skill: widget.skill);
        });
  }
}

class SkillDialogBox extends StatefulWidget {
  final Duration animationDuration;
  final Skill skill;

  SkillDialogBox(
      {this.animationDuration = const Duration(milliseconds: 800),
      @required this.skill,
      Key key})
      : super(key: key);

  @override
  _SkillDialogBoxState createState() => _SkillDialogBoxState();
}

class _SkillDialogBoxState extends State<SkillDialogBox>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animationPopup;
  Animation<double> _animationSkill;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _animationPopup = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0, 0.5, curve: Curves.easeOut),
    ));
    _animationSkill = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.3, 1.0, curve: Curves.easeOut),
    ));

    try {
      _animationController.forward().orCancel;
    } on TickerCanceled {}
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Transform.scale(
        scale: _animationPopup.value,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          backgroundColor: Colors.white,
          elevation: 1.0,
          child: Container(
            constraints: BoxConstraints.loose(Size.fromWidth(400)),
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      BackButton(),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Text(
                          widget.skill.skillName,
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Skill: "),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey[100],
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.orange),
                          value: widget.skill.skillValue *
                              _animationSkill.value /
                              100.0,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        (widget.skill.skillValue * _animationSkill.value)
                            .floor()
                            .toString(),
                        style: Theme.of(context).textTheme.subtitle,
                      )
                    ],
                  ),
                  Divider(),
                  SizedBox.fromSize(
                    size: Size.fromHeight(180),
                    child: ListView(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      children: widget.skill.details.map((detail) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Entypo.dot_single),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                detail,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
