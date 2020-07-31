import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/dataSource.dart';
import 'package:portfolio/utils/app.dart';
import 'package:portfolio/utils/switcher.dart';
import 'package:portfolio/utils/urlHandler.dart';
import 'package:portfolio/views/achievements/achievements.dart';
import 'package:portfolio/views/blogs/blogs.dart';
import 'package:portfolio/views/creative/creative.dart';
import 'package:portfolio/views/digital_arts/digital_arts.dart';
import 'package:portfolio/views/home/state_management.dart';
import 'package:portfolio/views/image_viewer/image_viewer.dart';
import 'package:portfolio/views/mobileapps/mobileApps.dart';
import 'package:portfolio/views/personal/personal.dart';
import 'dart:js' as js;

import 'package:portfolio/views/softwares/softwares.dart';
import 'package:portfolio/views/webapps/webapps.dart';

class HomePage extends StatefulWidget {
  static const String ROUTE = "/home";
  final int selected;

  HomePage({this.selected = 0});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  HomeManager _manager;

  @override
  void initState() {
    _manager = HomeManager(selected: widget.selected);
    super.initState();
  }

  @override
  void dispose() {
    _manager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isPc = SwitcherMediaQuery.isPc(context);
    return Scaffold(
      drawer: !isPc ? _buildDrawer() : null,
      appBar: AppBar(
        automaticallyImplyLeading: !isPc,
        title: Row(
          children: <Widget>[
            CursorPointer(
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => ImageViewer(
                          imagePath: "assets/images/profile_pic.jpg")),
                );
              },
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile_pic.jpg"),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Switcher(
              mobile: SizedBox.shrink(),
              tablet: Text(
                "Afridi Kayal",
              ),
              pc: Text("Afridi Kayal"),
            ),
          ],
        ),
        actions: _buildAppBarActions(),
      ),
      body: !isPc
          ? _buildBody()
          : Row(
              children: <Widget>[_buildDrawer(), Expanded(child: _buildBody())],
            ),
    );
  }

  List<Widget> _buildAppBarActions() {
    if (SwitcherMediaQuery.isPc(context)) {
      return List<Widget>.generate(_socialMediaOptions.length, (i) {
        return FlatButton(
          child: Icon(_socialMediaOptions[i].icon),
          onPressed: () async {
            await gotoUrl(_socialMediaOptions[i].url);
          },
        );
      });
    } else {
      return <Widget>[
        PopupMenuButton(
            onSelected: (index) async {
              await gotoUrl(_socialMediaOptions[index].url);
            },
            padding: const EdgeInsets.all(2.0),
            icon: Icon(Entypo.dots_three_vertical),
            elevation: 1.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            itemBuilder: (context) {
              return List<PopupMenuItem>.generate(_socialMediaOptions.length,
                  (i) {
                return PopupMenuItem(
                  child: ListTile(
                    title: Text(_socialMediaOptions[i].title),
                    trailing: Icon(
                      _socialMediaOptions[i].icon,
                    ),
                    contentPadding: const EdgeInsets.all(2.0),
                  ),
                  value: i,
                );
              });
            })
      ];
    }
  }

  Widget _buildBody() {
    switch (_manager.selectedPage) {
      case 0:
        return PersonalWidget();
      case 1:
        return DigitalArtsWidget();
      case 2:
        return CreativeWidget();
      case 3:
        return SoftwaresWidget();
      case 4:
        return WebAppsWidget();
      case 5:
        return MobileAppsWidget();
      case 6:
        return BlogsWidget();
      case 7:
        return AchievementsWidget();
    }
    return PersonalWidget();
  }

  Widget _buildDrawer() {
    var drawerWidget = ListTileTheme(
      selectedColor: Colors.white,
      child: Drawer(
        elevation: 1.0,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Scrollbar(
              controller: _manager.drawerScrollController,
              child: LayoutBuilder(builder: (context, constraints) {
                return ListView.builder(
                  controller: _manager.drawerScrollController,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    var drawerOption = _drawerOptions[i];

                    var tile = CursorPointer(
                        child: ListTile(
                      trailing: Icon(drawerOption.icon),
                      title: Text(drawerOption.title),
                      subtitle: Text(drawerOption.subtitle),
                      selected: _manager.selectedPage == i,
                      onTap: () async {
                        setState(() {
                          _manager.selectedPage = i;
                        });
                        if (!SwitcherMediaQuery.isPc(context)) {
                          Navigator.of(context).pop();
                        }
                      },
                    ));

                    if (_manager.selectedPage == i) {
                      return Container(
                        child: tile,
                        color: Colors.blue,
                      );
                    } else {
                      return tile;
                    }
                  },
                  itemCount: _drawerOptions.length,
                );
              }),
            )),
      ),
    );

    if (SwitcherMediaQuery.isPc(context)) {
      return MouseRegion(
        child: drawerWidget,
        onEnter: (details) => setState(() => _manager.drawerExpanded = true),
        onExit: (details) => setState(() => _manager.drawerExpanded = false),
      );
    } else {
      return drawerWidget;
    }
  }
}

var _drawerOptions = <DrawerOption>[
  // DrawerOption(
  //     title: "Gallery",
  //     subtitle: "A gist of all my works",
  //     icon: Entypo.infinity),
  DrawerOption(
      title: "Personal information",
      subtitle: "About me",
      icon: Ionicons.ios_person),
  DrawerOption(
      title: "Digital arts", subtitle: "3D / 2D artworks", icon: Entypo.image),
  DrawerOption(
      title: "Creative Programming",
      subtitle: "Short simple visualizations",
      icon: Entypo.star),
  DrawerOption(
      title: "Softwares",
      subtitle: "Softwares of various kinds",
      icon: Entypo.globe),
  DrawerOption(title: "Web", subtitle: "Web applications", icon: Entypo.signal),
  DrawerOption(
      title: "Mobile", subtitle: "Mobile applications", icon: Entypo.mobile),
  DrawerOption(
      title: "Blogs",
      subtitle: "Blogging and simple tutorials",
      icon: FontAwesome.sticky_note),
  DrawerOption(
      title: "Achievements",
      subtitle: "A tiny list of my achievements so far",
      icon: Entypo.trophy),
];

var _socialMediaOptions = <SocialMediaOption>[
  SocialMediaOption(
      title: "Facebook",
      icon: Entypo.facebook,
      url: "https://www.facebook.com/afridi.kayal.3"),
  SocialMediaOption(
      title: "Twitter",
      icon: Entypo.twitter,
      url: "https://twitter.com/AfridiKayal"),
  SocialMediaOption(
      title: "Instagram",
      icon: Entypo.instagram,
      url: "https://www.instagram.com/_frid.c/"),
  SocialMediaOption(
      title: "LinkedIn",
      icon: Entypo.linkedin,
      url: "https://www.linkedin.com/in/afridi-kayal-ba110719b"),
  SocialMediaOption(
      title: "Github",
      icon: FontAwesome.github,
      url: "https://github.com/kay-af"),
  SocialMediaOption(title: "Email", icon: Entypo.mail, url: mailToUrl),
];
