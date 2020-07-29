import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/utils/emphasizedText.dart';
import 'package:portfolio/utils/gridLoadingImage.dart';
import 'package:portfolio/utils/headings.dart';
import 'package:portfolio/utils/urlHandler.dart';
import 'package:portfolio/utils/videoPlayer.dart';
import 'package:portfolio/views/image_viewer/image_viewer.dart';

class SoftwaresWidget extends StatefulWidget {
  @override
  _SoftwaresWidgetState createState() => _SoftwaresWidgetState();
}

class _SoftwaresWidgetState extends State<SoftwaresWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverList(
                  delegate: SliverChildListDelegate([
                BodyHead(icon: Entypo.globe, label: "Softwares"),
                Divider(),
                EmphasizedTextContainer(
                    icon: Entypo.info_with_circle,
                    text: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Softwares and Game development - ",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "I am very fond of videogames and used to wonder how they were made as a child. The first program I made was infact a game mod in a script editor and compiler called ",
                          style: Theme.of(context).textTheme.subtitle),
                      TextSpan(
                          text: "Sanny Builder (For GTA games). ",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "After that, I learned ",
                          style: Theme.of(context).textTheme.subtitle),
                      TextSpan(
                          text: "Java ",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "which quickly helped me to get familiar with ",
                          style: Theme.of(context).textTheme.subtitle),
                      TextSpan(
                          text: "C# ",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "which is the preferred language for ",
                          style: Theme.of(context).textTheme.subtitle),
                      TextSpan(
                          text: "Unity 3D ",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "and hence, I started learning ",
                          style: Theme.of(context).textTheme.subtitle),
                      TextSpan(
                          text: "Unity 3D ",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "and my beginner ",
                          style: Theme.of(context).textTheme.subtitle),
                      TextSpan(
                          text: "Blender 3D ",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "skills got a new use. Here are some of my works in Unity 3D",
                          style: Theme.of(context).textTheme.subtitle),
                    ]))),
                Divider(),

                // Asphalt AI
                BodySubhead(label: "Asphalt AI"),
                EmphasizedTextContainer(
                    icon: Entypo.info_with_circle,
                    text: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Asphalt AI ",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "is created in Unity. It's a ",
                          style: Theme.of(context).textTheme.subtitle),
                      TextSpan(
                          text: "Self-Driving car ",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "simulation based on ",
                          style: Theme.of(context).textTheme.subtitle),
                      TextSpan(
                          text: "Genetic Algorithm. ",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "This software is full of features including logs and visualizations of the training process.",
                          style: Theme.of(context).textTheme.subtitle),
                    ]))),
              ])),
              SliverGrid.extent(
                maxCrossAxisExtent: 480,
                children: List.generate(_softwareAsphaltPaths.length, (i) {
                  return GridAssetLoadingImage(
                    assetImagePath: _softwareAsphaltPaths[i],
                  );
                }),
                childAspectRatio: 1.67,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                EmphasizedTextContainer(
                    icon: Entypo.info_with_circle,
                    text: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Genetic Algorithm - ",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "This simulation makes use of neural networks and genetic algorithm. The car is first trained and then the training data is saved locally. During the training process, several aspects of the underlying neural network can be visualized. Three camera modes and three locations are available in the simulation.",
                          style: Theme.of(context).textTheme.subtitle),
                    ]))),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: VideoWidget(
                      pathToThumbnail: "assets/content/softwares/software_asphalt4.jpg",
                        caption: "See post training result in action!",
                        pathToVideo:
                            "assets/content/softwares/software_asphalt_video.mp4")),
                EmphasizedTextContainer(
                    icon: Entypo.info_with_circle,
                    text: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text:
                              "Asphalt AI won my team the runner-up position in an inter college innovative software competition in our second year in college.",
                          style: Theme.of(context).textTheme.subtitle),
                    ]))),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "For more information, download Asphalt presentation that was presented in the competition",
                    textAlign: TextAlign.center,
                  ),
                ),
                FlatButton(
                  color: Colors.blue,
                  child: Text("Download Asphalt pptx"),
                  onPressed: () async {
                    await gotoUrl(_pathToAsphaltPPT);
                  },
                ),
                Divider(),
              ])),

              // Chat Bot
              SliverList(
                  delegate: SliverChildListDelegate([
                BodySubhead(label: "Chat bot"),
                EmphasizedTextContainer(
                    icon: Entypo.info_with_circle,
                    text: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Chat bot - ",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "Back in 1st year, I was learning about APIs and came across an awesome API. ",
                          style: Theme.of(context).textTheme.subtitle),
                      TextSpan(
                          text: "Dialogflow by Google ",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "(Formerly known as Api.ai) had a cool helper library in Unity too. Hence, I got to work with this new project in my mind in no time. Made a 3D model and drafted the logical flow of the bot I was about to make",
                          style: Theme.of(context).textTheme.subtitle),
                    ]))),
                Container(
                  height: 600,
                  child: GridAssetLoadingImage(
                    assetImagePath: "assets/content/softwares/software_bot1.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                EmphasizedTextContainer(
                    icon: Entypo.info_with_circle,
                    text: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text:
                              "The bot has an API module through which more APIs can be connected to it with minimal code change. It is currently connected to ",
                          style: Theme.of(context).textTheme.subtitle),
                      TextSpan(
                          text:
                              "OpenWeatherMap API, Google Search API & Urban dictionary (Unofficial) API. ",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "The chat bot uses dialog flow API to react to human speech in text form and MSAPI for text to speech conversion. Unity's built in Dictionary Recognizer is used fro speech to text conversion which is sent to Dialogflow for processing. It features customization of clothing and hair as well as a direct text to speech conversion panel. It is currently only supported on Windows 10 due to the MSAPI and Dictionary Recognizer dependencies",
                          style: Theme.of(context).textTheme.subtitle),
                    ]))),
                VideoWidget(
                  pathToThumbnail: "assets/content/softwares/software_asphalt4.jpg",
                  pathToVideo:
                      "assets/content/softwares/software_bot_video.mp4",
                  caption: "See the chat bot in action",
                ),
                EmphasizedTextContainer(
                    icon: Entypo.info_with_circle,
                    text: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text:
                              "The bot won my team the first prize in the inter college innovative software competition",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle),
                    ]))),
                Divider(),

                // Others
              BodySubhead(label: "Others"),
              EmphasizedTextContainer(
                    icon: Entypo.info_with_circle,
                    text: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text:
                              "I have some small projects in Unity as well. Here are the screenshots of some.",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle),
                    ]))),
              ])),
              SliverToBoxAdapter(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Universe Sandbox", style: Theme.of(context).textTheme.title, textAlign: TextAlign.center),
              )),
              SliverGrid.extent(
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                childAspectRatio: 1.67,
                maxCrossAxisExtent: 300, children: List<Widget>.generate(_softwareUniPaths.length, (i) {
                  return GridAssetLoadingImage(assetImagePath: _softwareUniPaths[i]);
                })),
            ]));
  }
}

var _softwareAsphaltPaths = [
  "assets/content/softwares/software_asphalt1.jpg",
  "assets/content/softwares/software_asphalt2.jpg",
  "assets/content/softwares/software_asphalt3.jpg",
  "assets/content/softwares/software_asphalt4.jpg",
  "assets/content/softwares/software_asphalt5.jpg",
  "assets/content/softwares/software_asphalt6.jpg",
];

var _softwareUniPaths = [
  "assets/content/softwares/software_uni1.png",
  "assets/content/softwares/software_uni2.png",
  "assets/content/softwares/software_uni3.png",
  "assets/content/softwares/software_uni4.png",
];

var _pathToAsphaltPPT = "";
