import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/utils/app.dart';
import 'package:portfolio/utils/flipFlopText.dart';
import 'package:portfolio/utils/gridLoadingImage.dart';
import 'package:portfolio/utils/urlHandler.dart';
import '../dataSource.dart';
import 'switcher.dart';

class PersonalInfoWidget extends StatefulWidget {
  @override
  _PersonalInfoWidgetState createState() => _PersonalInfoWidgetState();
}

class _PersonalInfoWidgetState extends State<PersonalInfoWidget>
    with SingleTickerProviderStateMixin {
  bool _readMore = false;

  @override
  Widget build(BuildContext context) {
    return _buildPersonalInfo();
  }

  Widget _buildPersonalInfo() {
    return Card(
      color: Colors.white,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.grey[100]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SwitcherMediaQuery.isPc(context)
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _infoWidgets(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _infoWidgets(),
                  )),
      ),
    );
  }

  List<Widget> _infoWidgets() {
    return <Widget>[
      _buildInfoCard(),
      SwitcherMediaQuery.isPc(context)
          ? VerticalDivider(
              width: 80,
            )
          : Divider(),
      SwitcherMediaQuery.isPc(context)
          ? Expanded(child: _buildAboutMe())
          : _buildAboutMe(),
    ];
  }

  Widget _buildInfoCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildProfilePic(),
        SizedBox(
          height: 10,
        ),
        Text(
          AboutMe.name,
          style: Theme.of(context).textTheme.display1,
        ),
        SizedBox(
          height: 10,
        ),
        Icon(Entypo.cake),
        SizedBox(
          height: 10,
        ),
        Text(
          defaultDateFormat.format(AboutMe.dateOfBirth),
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(color: Colors.grey[400]),
        ),
        SizedBox(
          height: 20,
        ),
        _buildTablet(
            icon: Entypo.plus, label: "Blood Group", value: AboutMe.bloodGroup),
        _buildTablet(
            icon: Entypo.flag,
            label: "Nationality",
            value: AboutMe.nationality),
        _buildTablet(
            icon: Entypo.moon, label: "Religion", value: AboutMe.religion),
        _buildTablet(
            icon: Entypo.mail,
            label: "Email",
            value: AboutMe.email,
            onClick: () async {
              await gotoUrl(mailToUrl);
            }),
      ],
    );
  }

  Widget _buildAboutMe() {
    var readingList = !_readMore
        ? AboutMe.aboutMeDescriptive
            .sublist(0, min(AboutMe.aboutMeDescriptive.length, 18))
            .toList()
        : AboutMe.aboutMeDescriptive;
    if (SwitcherMediaQuery.isPc(context)) {
      readingList = AboutMe.aboutMeDescriptive;
    }

    var widget = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "About Me",
          style: Theme.of(context).textTheme.display1.copyWith(
                color: Colors.black,
              ),
        ),
        SizedBox(
          height: 16,
        ),
        AnimatedSize(
          alignment: Alignment.topCenter,
          vsync: this,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOut,
          child: FlipFlopText(
            textAlign: TextAlign.left,
            textList: readingList,
            flipStyle: TextStyle(color: Colors.black),
            flopStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontStyle: FontStyle.italic),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        !SwitcherMediaQuery.isPc(context)
            ? FlatButton(
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    _readMore = !_readMore;
                  });
                },
                child: Text(_readMore ? "Read less" : "Read more"))
            : SizedBox.shrink()
      ],
    );
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SwitcherMediaQuery.isPc(context)
            ? SingleChildScrollView(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: widget)
            : widget);
  }

  Widget _buildTablet(
      {@required IconData icon,
      @required String label,
      @required String value,
      Function() onClick}) {
    var child = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon),
        SizedBox(
          height: 10,
        ),
        FlipFlopText(
          textList: ["$label: ", value],
          flopStyle: onClick != null
              ? Theme.of(context).textTheme.subtitle.apply(color: Colors.purple)
              : null,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );

    if (onClick == null) return child;
    return CursorPointer(
      child: child,
      onPressed: onClick,
    );
  }

  Widget _buildProfilePic() {
    return Container(
      constraints: BoxConstraints.tight(Size.fromRadius(64)),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: GridAssetLoadingImage(
        assetImagePath: profilePicPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
