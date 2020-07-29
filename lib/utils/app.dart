import 'dart:html' as html;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

final appContainer = html.window.document.getElementById('app-container');

class CursorPointer extends StatefulWidget {
  final Widget child;
  final Function() onPressed;

  final Function(PointerEnterEvent) onEnter;
  final Function(PointerExitEvent) onExit;
  final Function(PointerHoverEvent) onHover;

  CursorPointer(
      {@required this.child,
      this.onPressed,
      this.onEnter,
      this.onExit,
      this.onHover,
      Key key})
      : super(key: key);

  @override
  _CursorPointerState createState() => _CursorPointerState();
}

class _CursorPointerState extends State<CursorPointer> {

  bool _mouseOver = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: GestureDetector(
        onTap: () {
          if(_mouseOver && widget.onPressed != null) widget.onPressed(); 
        },
        child: widget.child),
      onEnter: (evt) {
        appContainer.style.cursor = "pointer";
        setState(() {
          _mouseOver = true;
        });
        if (widget.onEnter != null) widget.onEnter(evt);
      },
      onExit: (evt) {
        setState(() {
          _mouseOver = false;
        });
        appContainer.style.cursor = "default";
        if (widget.onExit != null) widget.onExit(evt);
      },
      onHover: (evt) {
        if (widget.onHover != null) widget.onHover(evt);
      },
    );
  }
}
