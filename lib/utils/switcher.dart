import 'package:flutter/material.dart';

class Switcher extends StatefulWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget pc;

  Switcher(
      {@required this.mobile,
      @required this.tablet,
      @required this.pc,
      Key key})
      : super(key: key);

  @override
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  @override
  Widget build(BuildContext context) {
    switch(SwitcherMediaQuery.deviceType(context)) {
      
      case DeviceType.Mobile:
        return widget.mobile;
        break;
      case DeviceType.Tablet:
        return widget.tablet;
        break;
      case DeviceType.Pc:
        return widget.pc;
        break;
    }
    return widget.pc;
  }
}

enum DeviceType {
  Mobile,
  Tablet,
  Pc
}

class SwitcherMediaQuery {
  static DeviceType deviceType(BuildContext context) {
    var width = MediaQuery.of(context).size.width /
        MediaQuery.of(context).devicePixelRatio;
    if(width <= 480) return DeviceType.Mobile;
    else if(width > 480 && width <= 768) return DeviceType.Tablet;
    else return DeviceType.Pc;
  }

  static bool isMobile(BuildContext context) {
    return deviceType(context) == DeviceType.Mobile;
  }

  static bool isTablet(BuildContext context) {
    return deviceType(context) == DeviceType.Tablet;
  }

  static bool isPc(BuildContext context) {
    return deviceType(context) == DeviceType.Pc;
  }
}