import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/utils/emphasizedText.dart';
import 'package:portfolio/utils/flipFlopText.dart';
import 'package:portfolio/utils/headings.dart';
import 'package:portfolio/utils/urlHandler.dart';

class BlogsWidget extends StatefulWidget {
  @override
  _BlogsWidgetState createState() => _BlogsWidgetState();
}

class _BlogsWidgetState extends State<BlogsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            BodyHead(icon: FontAwesome.sticky_note, label: "Blogs"),
            Divider(),
            BodySubhead(label: "Working on it!"),
            EmphasizedTextContainer(
              icon: Entypo.warning,
                text: FlipFlopText(
              textList: [
                "I am planning to make my own ",
                "blogging web app ",
                "in near future. Meanwhile, You can click the link below to go to my blogspot page and check existing content :)"
              ],
            )),
            FlatButton(
              onPressed: () async {
                await gotoUrl("https://frid231.blogspot.com/");
              },
              child: Text("Blogspot page"),
              color: Colors.blue,
            )
          ])),
        ],
      ),
    );
  }
}
