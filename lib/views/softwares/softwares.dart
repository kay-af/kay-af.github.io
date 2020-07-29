import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/dataSource.dart';
import 'package:portfolio/utils/emphasizedText.dart';
import 'package:portfolio/utils/flipFlopText.dart';
import 'package:portfolio/utils/gridLoadingImage.dart';
import 'package:portfolio/utils/headings.dart';
import 'package:portfolio/utils/urlHandler.dart';
import 'package:portfolio/utils/videoPlayer.dart';

class SoftwaresWidget extends StatefulWidget {
  @override
  _SoftwaresWidgetState createState() => _SoftwaresWidgetState();
}

class _SoftwaresWidgetState extends State<SoftwaresWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(physics: BouncingScrollPhysics(), slivers: <
            Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            BodyHead(icon: Entypo.globe, label: "Softwares"),
            Divider(),
            EmphasizedTextContainer(
                icon: Entypo.info_with_circle,
                text: FlipFlopText(textList: [
                  "Softwares and Game development - ",
                  "I am very fond of videogames and used to wonder how they were made as a child. The first program I made was infact a game mod in a script editor and compiler called ",
                  "Sanny Builder (For GTA games). ",
                  "After that, I learned ",
                  "Java ",
                  "which quickly helped me to get familiar with ",
                  "C# ",
                  "which is the preferred language for ",
                  "Unity 3D ",
                  "and hence, I started learning ",
                  "Unity 3D ",
                  "and my beginner ",
                  "Blender 3D ",
                  "skills got a new use. Here are some of my works in Unity 3D",
                ], startWith: FlipFlopStart.Flop,)),
            Divider(),

            // Asphalt AI
            BodySubhead(label: "Asphalt AI"),
            EmphasizedTextContainer(
                icon: Entypo.info_with_circle,
                text: FlipFlopText(textList: [
                  "Asphalt AI ",
                  "is created in Unity. It's a ",
                  "Self-Driving car ",
                  "simulation based on ",
                  "Genetic Algorithm. ",
                  "This software is full of features including logs and visualizations of the training process.",
                ], startWith: FlipFlopStart.Flop,)),
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
                    pathToThumbnail: SoftwarePaths.ASPHALT4,
                    caption: "See post training result in action!",
                    pathToVideo: SoftwarePaths.VID_ASPHALT)),
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
                text: FlipFlopText(textList: [
                  "Chat bot - ",
                  "Back in 1st year, I was learning about APIs and came across an awesome API. ",
                  "Dialogflow by Google ",
                  "(Formerly known as Api.ai) had a cool helper library in Unity too. Hence, I got to work with this new project in my mind in no time. Made a 3D model and drafted the logical flow of the bot I was about to make",
                ], startWith: FlipFlopStart.Flop,)),
          ])),
          SliverGrid.extent(
            maxCrossAxisExtent: 500,
            children: List.generate(_softwareBotPaths.length, (i) {
              return GridAssetLoadingImage(
                assetImagePath: _softwareBotPaths[i],
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
                text: FlipFlopText(textList: [
                  "The bot has an API module through which more APIs can be connected to it with minimal code change. It is currently connected to ",
                  "OpenWeatherMap API, Google Search API & Urban dictionary (Unofficial) API. ",
                  "The chat bot uses dialog flow API to react to human speech in text form and MSAPI for text to speech conversion. Unity's built in Dictionary Recognizer is used fro speech to text conversion which is sent to Dialogflow for processing. It features customization of clothing and hair as well as a direct text to speech conversion panel. It is currently only supported on Windows 10 due to the MSAPI and Dictionary Recognizer dependencies",
                ], startWith: FlipFlopStart.Flop,)),
            VideoWidget(
              pathToThumbnail: SoftwarePaths.BOT3,
              pathToVideo: SoftwarePaths.VID_BOT,
              caption: "See the chat bot in action",
            ),
            EmphasizedTextContainer(
                icon: Entypo.info_with_circle,
                text: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text:
                          "The bot won my team the first prize in the inter college innovative software competition",
                      style: Theme.of(context).textTheme.subtitle),
                ]))),
            Divider(),

            // Solar system
            BodySubhead(label: "Solar System"),
            EmphasizedTextContainer(
                icon: Entypo.info_with_circle,
                text: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text:
                          "Once upon a time, I made a small solar system in Unity. Nothing special, you can just fly around :). This was back when I was learning Unity",
                      style: Theme.of(context).textTheme.subtitle),
                ]))),
          ])),
          SliverGrid.extent(
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childAspectRatio: 1.67,
              maxCrossAxisExtent: 300,
              children: List<Widget>.generate(_softwareUniPaths.length, (i) {
                return GridAssetLoadingImage(
                    assetImagePath: _softwareUniPaths[i]);
              })),
        ]));
  }
}

var _softwareAsphaltPaths = [
  SoftwarePaths.ASPHALT1,
  SoftwarePaths.ASPHALT2,
  SoftwarePaths.ASPHALT3,
  SoftwarePaths.ASPHALT4,
  SoftwarePaths.ASPHALT5,
  SoftwarePaths.ASPHALT6,
  SoftwarePaths.ASPHALT7,
];

var _softwareBotPaths = [
  SoftwarePaths.BOT1,
  SoftwarePaths.BOT2,
  SoftwarePaths.BOT3,
];

var _softwareUniPaths = [
  SoftwarePaths.UNI1,
  SoftwarePaths.UNI2,
  SoftwarePaths.UNI3,
  SoftwarePaths.UNI4,
];

var _pathToAsphaltPPT = webURL + "/${SoftwarePaths.ASPHALT_PPTX}";
