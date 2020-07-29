import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/dataSource.dart';
import 'package:portfolio/utils/headings.dart';
import 'package:portfolio/utils/hobbyView.dart';
import 'package:portfolio/utils/personalInfoWidget.dart';
import 'package:portfolio/utils/skillView.dart';
import 'package:portfolio/utils/switcher.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class PersonalWidget extends StatefulWidget {
  @override
  _PersonalWidgetState createState() => _PersonalWidgetState();
}

class _PersonalWidgetState extends State<PersonalWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            BodyHead(icon: Ionicons.ios_person, label: "Personal"),
            Divider(),
            SwitcherMediaQuery.isPc(context)
                ? Container(
                    constraints: BoxConstraints(
                      maxHeight: 600,
                    ),
                    child: PersonalInfoWidget())
                : PersonalInfoWidget(),
            Divider(),
            BodySubhead(
              label: "Programming Skills",
            ),
          ])),
          _buildSliverGrid(
            children: List<Widget>.generate(
                Skill.languageProficiencyModels.length, (i) {
              return SkillView(
                skill: Skill.languageProficiencyModels[i],
                startDelay: Duration(milliseconds: 200 * i),
              );
            }),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Divider(),
            BodySubhead(
              label: "Software tools",
            ),
          ])),
          _buildSliverGrid(
              children: List<Widget>.generate(Skill.softwareTools.length, (i) {
            return SkillView(
              skill: Skill.softwareTools[i],
              startDelay: Duration(milliseconds: 200 * i),
            );
          })),
          SliverList(
              delegate: SliverChildListDelegate([
            Divider(),
            BodySubhead(
              label: "Languages known",
            ),
          ])),
          _buildSliverGrid(
              children:
                  List<Widget>.generate(Skill.languagesKnownModel.length, (i) {
            return SkillView(
              skill: Skill.languagesKnownModel[i],
              startDelay: Duration(milliseconds: 200 * i),
              showDialogOnPress: false,
            );
          })),
          SliverList(
              delegate: SliverChildListDelegate([
            Divider(),
            BodySubhead(
              label: "Hobbies and interests",
            ),
          ])),
          _buildSliverGrid(
              children: List<Widget>.generate(Hobby.hobbies.length, (i) {
            return HobbyView(
              hobby: Hobby.hobbies[i],
              animationDelay: Duration(milliseconds: i * 200),
            );
          })),
          SliverList(
              delegate: SliverChildListDelegate([
            Divider(),
            BodySubhead(
              label: "Timeline",
            ),
            Timeline.builder(
              itemBuilder: (context, i) {
                var widgets = <Widget>[
                  Expanded(
                    child: Text(
                      TimelineElement.timeline[i].title,
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: i.isEven
                          ? TextAlign.start
                          : !SwitcherMediaQuery.isPc(context)
                              ? TextAlign.start
                              : TextAlign.end,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "${TimelineElement.timeline[i].date.year}",
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(color: Colors.blue),
                  )
                ];
                return TimelineModel(
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 35.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                              children: i.isEven
                                  ? widgets
                                  : SwitcherMediaQuery.isPc(context)
                                      ? widgets.reversed.toList()
                                      : widgets),
                          Divider(
                            color: Colors.black38,
                          ),
                          Text(
                            TimelineElement.timeline[i].subtitle,
                            style: Theme.of(context).textTheme.subtitle,
                            textAlign: i.isEven
                                ? TextAlign.start
                                : !SwitcherMediaQuery.isPc(context)
                                    ? TextAlign.start
                                    : TextAlign.end,
                          ),
                        ],
                      ),
                    ),
                    position: i.isEven
                        ? TimelineItemPosition.left
                        : TimelineItemPosition.right,
                    iconBackground: Colors.grey[100],
                    icon: Icon(TimelineElement.timeline[i].icon));
              },
              position: SwitcherMediaQuery.isPc(context)
                  ? TimelinePosition.Center
                  : TimelinePosition.Right,
              lineColor: Colors.black38,
              shrinkWrap: true,
              itemCount: TimelineElement.timeline.length,
              physics: NeverScrollableScrollPhysics(),
            ),
          ])),
        ],
      ),
    );
  }

  Widget _buildSliverGrid({@required List<Widget> children}) {
    return !SwitcherMediaQuery.isMobile(context)
        ? SliverGrid.extent(
            maxCrossAxisExtent: SwitcherMediaQuery.isPc(context) ? 400 : 800,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            childAspectRatio: SwitcherMediaQuery.isPc(context) ? 1.2 : 2.5,
            children: children)
        : SliverList(
            delegate: SliverChildListDelegate(children.map((child) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: child,
            )).toList()),
          );
  }
}
