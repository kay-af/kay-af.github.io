import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SliverViewAllButton extends StatelessWidget {

  final String label;
  final Function() onPressed;

  SliverViewAllButton({this.label = "View All", @required this.onPressed, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
          child: FlatButton(onPressed: onPressed, color: Colors.blue, child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(this.label),
          SizedBox(width: 20,),
          Icon(Entypo.eye)
        ],
      )),
    );
  }
}