// Render Paths

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/utils/pair.dart';

// Creative

class CreativePaths {
  static const String AM_VIS = "assets/content/creative/cre_am_vis.gif";
  static const String ASCII_VID = "assets/content/creative/cre_ascii.gif";
  static const String CLOCK = "assets/content/creative/cre_clock.gif";
  static const String EARTH = "assets/content/creative/cre_earth.gif";
  static const String FABRIC = "assets/content/creative/cre_fabric.gif";
  static const String GRAHAM = "assets/content/creative/cre_graham.gif";
  static const String IMG_CIRCLES =
      "assets/content/creative/cre_img_circles.gif";
  static const String MICROSCOPIC =
      "assets/content/creative/cre_microscopic.gif";
  static const String MOUSE_MOVE = "assets/content/creative/cre_mouse_move.gif";
  static const String QSORT = "assets/content/creative/cre_qsort.gif";
  static const String VORONOI = "assets/content/creative/cre_voronoi.gif";
}

class CreativeWork {
  final String title;
  final String subtitle;
  final List<String> frameworks;
  final String gifPath;

  CreativeWork(
      {@required this.title,
      @required this.subtitle,
      @required this.frameworks,
      @required this.gifPath});

  static final List<CreativeWork> creativeWorks = [
    CreativeWork(
        title: "AM Visualization",
        subtitle:
            "A simple visualization of amplitude modulation based on modulation index",
        frameworks: [FRAMEWORK_PROCESSING3],
        gifPath: CreativePaths.AM_VIS),
    CreativeWork(
        title: "ASCII Video",
        subtitle: "Turn an inage or an video into ASCII art",
        frameworks: [FRAMEWORK_PYTHON, FRAMEWORK_HTML],
        gifPath: CreativePaths.ASCII_VID),
    CreativeWork(
        title: "Clock",
        subtitle: "A simple analog clock that represents OS time",
        frameworks: [FRAMEWORK_PROCESSING3],
        gifPath: CreativePaths.CLOCK),
    CreativeWork(
        title: "Earth plotter",
        subtitle:
            "Plot any CSV data with lat and lon. The preview represents regions with recent earthquakes over a magintude of 4.5",
        frameworks: [FRAMEWORK_PROCESSING3],
        gifPath: CreativePaths.EARTH),
    CreativeWork(
        title: "Fabric",
        subtitle:
            "A simple simultion of particles which bend at mouse location",
        frameworks: [FRAMEWORK_PROCESSING3],
        gifPath: CreativePaths.FABRIC),
    CreativeWork(
        title: "Graham scan",
        subtitle: "A simple graham scan convex-hull algorithm implementation",
        frameworks: [FRAMEWORK_PROCESSING3],
        gifPath: CreativePaths.GRAHAM),
    CreativeWork(
        title: "Image circles",
        subtitle:
            "An adaptation Vadim Ogievetsky's Koala's to the max in Processing 3. Visit my Repository to find the link to his original work",
        frameworks: [FRAMEWORK_PROCESSING3],
        gifPath: CreativePaths.IMG_CIRCLES),
    CreativeWork(
        title: "Microscopic",
        subtitle:
            "A physical simulation of positive, negative and dual state particles",
        frameworks: [FRAMEWORK_PROCESSING3],
        gifPath: CreativePaths.MICROSCOPIC),
    CreativeWork(
        title: "Mouse move",
        subtitle:
            "Move your mouse with the brightest pixel on your camera preview. This app can be extended to have clicking features",
        frameworks: [FRAMEWORK_PROCESSING3],
        gifPath: CreativePaths.MOUSE_MOVE),
    CreativeWork(
        title: "Quicksort",
        subtitle:
            "Various algorithms can be visualized using Processing 3. Here is a quicksort visualization",
        frameworks: [FRAMEWORK_PROCESSING3],
        gifPath: CreativePaths.QSORT),
    CreativeWork(
        title: "Voronoi",
        subtitle: "A simple voronoi generator using simple noise",
        frameworks: [FRAMEWORK_PROCESSING3],
        gifPath: CreativePaths.VORONOI),
  ];

  static const String FRAMEWORK_PROCESSING3 = "Processing 3";
  static const String FRAMEWORK_PYTHON = "Python";
  static const String FRAMEWORK_HTML = "HTML, CSS";
}

// Render

class RenderPaths {
  static const String AI_CAR = "assets/content/renders/render_ai_car.jpg";
  static const String ALARM = "assets/content/renders/render_alarm.png";
  static const String APPLE = "assets/content/renders/render_apple.png";
  static const String FOOTBALL = "assets/content/renders/render_football.png";
  static const String GUITAR = "assets/content/renders/render_guitar.png";
  static const String IPAD = "assets/content/renders/render_ipad.png";
  static const String JOURNEY = "assets/content/renders/render_journey.jpg";
  static const String LANTERN = "assets/content/renders/render_lantern.png";
  static const String PIANO = "assets/content/renders/render_piano.jpg";
  static const String RESTAURANT =
      "assets/content/renders/render_restaurant.jpg";
  static const String ROOM = "assets/content/renders/render_room.png";

  static List<Pair<String, Pair<int, int>>> gridWidgetData =
      <Pair<String, Pair<int, int>>>[
    Pair(
      FOOTBALL,
      Pair(2, 1),
    ),
    Pair(
      ROOM,
      Pair(2, 1),
    ),
    Pair(
      ALARM,
      Pair(2, 1),
    ),
    Pair(
      LANTERN,
      Pair(1, 2),
    ),
    Pair(
      RESTAURANT,
      Pair(2, 1),
    ),
    Pair(
      JOURNEY,
      Pair(2, 1),
    ),
    Pair(
      GUITAR,
      Pair(1, 2),
    ),
    Pair(
      IPAD,
      Pair(1, 1),
    ),
    Pair(
      PIANO,
      Pair(1, 1),
    ),
    Pair(
      APPLE,
      Pair(2, 1),
    ),
    Pair(
      AI_CAR,
      Pair(2, 1),
    ),
  ];
}

// Web apps

class WebAppPaths {
  static const String SPACE_HERO =
      "assets/content/webapps/webapp_spacehero.png";
  static const String CHAT = "assets/content/webapps/webapp_chat.png";
  static const String COLOR_TOOlS =
      "assets/content/webapps/web_color_tools.png";
}

class WebAppModel {
  String title;
  String description;
  String imagePath;
  String launchUrl;

  WebAppModel(
      {@required this.title,
      @required this.description,
      @required this.imagePath,
      @required this.launchUrl});

  static List<WebAppModel> apps = <WebAppModel>[
    WebAppModel(
      title: "Space Hero",
      description:
          "Space hero is a simple online game targeted for PCs. The aim of the game is to save the planet from invasion by space monsters. Control your ship and kill as many enemies as possible. Space hero is currently hosted on Heroku. It is made using p5js framework and assets are collected from opengaeart.com",
      imagePath: WebAppPaths.SPACE_HERO,
      launchUrl: "http://space-hero.herokuapp.com/",
    ),
    WebAppModel(
      title: "The Live Chat App",
      description:
          "The live chat app is an app created using SocketIO for realtime chat. Random people can join a room based chat environment or create their private rooms. It allows upto 8 people in a room and randomly assigns them. It is currently hosted on Heroku.",
      imagePath: WebAppPaths.CHAT,
      launchUrl: "http://thelivechatapp.herokuapp.com/",
    ),
    WebAppModel(
      title: "Color tools",
      description:
          "Color tools API is a restful API for interacting with colors. API will be extended in the future. This app is created using Nodejs for the backend server and Python for API library. Currently hosted on Heroku. Visit the web page for API reference.",
      imagePath: WebAppPaths.COLOR_TOOlS,
      launchUrl: "http://color-tools.herokuapp.com/",
    )
  ];
}

// Mobile apps

class MobileAppPaths {
  static const String NOTES_ICON =
      "assets/content/mobileapps/mobile_notes_icon.png";
  static const String NOTES1 =
      "assets/content/mobileapps/mobile_notes_shot1.jpg";
  static const String NOTES2 =
      "assets/content/mobileapps/mobile_notes_shot2.jpg";

  static const String EYEDROPPER_ICON =
      "assets/content/mobileapps/mobile_eyedropper_logo.png";
  static const String EYEDROPPER1 =
      "assets/content/mobileapps/mobile_eyedropper1.jpg";
  static const String EYEDROPPER2 =
      "assets/content/mobileapps/mobile_eyedropper2.jpg";
  static const String EYEDROPPER3 =
      "assets/content/mobileapps/mobile_eyedropper3.jpg";
  static const String EYEDROPPER4 =
      "assets/content/mobileapps/mobile_eyedropper4.jpg";

  // APKs
  static const String APK_NODE_EDITOR =
      webURL + "assets/content/mobileapps/note_editor.apk";
  static const String APK_EYEDROPPER =
      webURL + "assets/content/mobileapps/mobile_eyedropper.apk";
}

class MobileAppModel {
  String appName;
  String appIconPath;
  String appDescription;
  String downloadUrl;
  List<String> appScreenshotPaths;
  String appWebpage;

  MobileAppModel(
      {@required this.appName,
      @required this.appIconPath,
      @required this.appDescription,
      @required this.downloadUrl,
      this.appWebpage,
      @required this.appScreenshotPaths});

  static List<MobileAppModel> models = <MobileAppModel>[
    MobileAppModel(
        appName: "Note Editor",
        appDescription:
            "A very simple text editor for android phones. You can write a note, give it a title, save it and share. You can classify notes as favourites. This app provides a robust sorting and searching option. This app is open source and code can be found on my github. Click the \"Visit web page\" option below to go to the repository.",
        appIconPath: MobileAppPaths.NOTES_ICON,
        appWebpage: "https://www.github.com/kay-af/simple-note-editor/",
        appScreenshotPaths: [MobileAppPaths.NOTES1, MobileAppPaths.NOTES2],
        downloadUrl: MobileAppPaths.APK_NODE_EDITOR),
    MobileAppModel(
        appName: "Eyedropper",
        appIconPath: MobileAppPaths.EYEDROPPER_ICON,
        appDescription:
            "Recently, I created a rest API based on the color lookup tool made I made previously in C#. I ported the tool to Python and created a REST API using NodeJs. I wanted to create an application that used this API so I came u with the idea of Eyedropper. Eyedropper is an android application (Open-source) which takes live camera input and picaks up the center pixel color and with the press of a button, fetches matched color names and codes from the API. It is useful for recognizing names of the colors. The source code is available on my github page",
        downloadUrl: MobileAppPaths.APK_EYEDROPPER,
        appWebpage: "https://www.github.com/kay-af/eye-dropper",
        appScreenshotPaths: [
          MobileAppPaths.EYEDROPPER1,
          MobileAppPaths.EYEDROPPER2,
          MobileAppPaths.EYEDROPPER3,
          MobileAppPaths.EYEDROPPER4,
        ]),
  ];
}

// Achievements

class AchievementPaths {
  static const String ALGORITHMS = "assets/content/achievements/ac_adv.jpg";
  static const String C_PROGRAM =
      "assets/content/achievements/ac_c_program.jpg";
  static const String GENDER_JUSTICE =
      "assets/content/achievements/ac_gender_justice.jpg";
  static const String MEMENTO = "assets/content/achievements/ac_memento.jpg";
  static const String SREY18 = "assets/content/achievements/ac_srey_18.jpg";
  static const String SREY19 = "assets/content/achievements/ac_srey_19.jpg";
}

class Achievement {
  String title;
  String description;
  String imagePath;

  Achievement(
      {@required this.title,
      @required this.description,
      @required this.imagePath});

  static final List<Achievement> achievements = [
    Achievement(
        title: "NPTEL Gender Justice and Workplace Security",
        description: "Scored 76% in NPTEL online certification course",
        imagePath: AchievementPaths.GENDER_JUSTICE),
    Achievement(
        title: "Problem solving through C",
        description:
            "Scored 87% and ranked in top 1% in NPTEL online certification course",
        imagePath: AchievementPaths.C_PROGRAM),
    Achievement(
        title: "Winner SREY 2K18",
        description: "Won first prize for the Chat Bot my team presented",
        imagePath: AchievementPaths.SREY18),
    Achievement(
        title: "A memento",
        description: "A memento from NPTEL for ranking in top 1%",
        imagePath: AchievementPaths.MEMENTO),
    Achievement(
        title: "Advanced trends in algorithms",
        description:
            "Completed a workshop on algorithms. Learned new stuff like Voronoi and Convex hull algorithms which I implemented later in Processing framework",
        imagePath: AchievementPaths.ALGORITHMS),
    Achievement(
        title: "First runner up in SREY 2K19 (in Association with Cognizant)",
        description:
            "Won second prize for the Asphalt AI program created in Unity",
        imagePath: AchievementPaths.SREY19),
  ];
}

// Others

class DrawerOption {
  final String title;
  final String subtitle;
  final IconData icon;

  DrawerOption(
      {@required this.title, @required this.subtitle, @required this.icon});
}

class SocialMediaOption {
  final String title;
  final IconData icon;
  final String url;

  SocialMediaOption(
      {@required this.title, @required this.icon, @required this.url});
}

class Skill {
  String skillName;
  double skillValue;
  String skillDescription;
  List<String> details;

  Skill(
      {@required this.skillName,
      @required this.skillValue,
      this.skillDescription,
      this.details}) {
    assert(this.skillValue >= 0.0 && this.skillValue <= 100.0);
  }

  static List<Skill> languageProficiencyModels = [
    Skill(
        skillName: "Java",
        skillValue: 75.0,
        skillDescription: "Reasonably skilled",
        details: [
          "The first widely used programming language I learned",
          "Used Java as base language in creative programming through Processing 3",
          "Have a clear concept of Object oriented programming through Java",
          "Have made several small projects in the past including a simple love calculator in Android Studio and Weather App through OpenWeatherMap API",
          "Recently created a binary serialization library inspired from LiteNetLib for C#"
              "Know some design patterns used to develop softwares in Java",
          "Learned in school and college",
          "Have taught Java to diploma students"
        ]),
    Skill(
        skillName: "C#",
        skillValue: 72.0,
        skillDescription: "Reasonably skilled",
        details: [
          "Base language used in Unity 3D",
          "Almost conceptually accquainted with the Object oriented programming through C#",
          "Used it to make big projects like Chat Bot and Asphalt AI that won me competitions",
          "Made a colour lookup library using KD tree in C# recently"
              "Being closer to Java, have a fair knowledge of approach to a given problem",
          "Self-learned + Youtube tutorials"
        ]),
    Skill(
        skillName: "Flutter (Dart)",
        skillValue: 70.0,
        skillDescription: "Reasonably skilled",
        details: [
          "Quite familiar with the reactive UI pattern used by dart",
          "Have successfully answered numerous Stackoverflow questions related to Dart",
          "Have worked with Firebase in flutter",
          "This portfolio is created in flutter web by me",
          "Self-learned + Youtube tutorials + Documentation"
        ]),
    Skill(
        skillName: "C",
        skillValue: 60.0,
        skillDescription: "Reasonably skilled",
        details: [
          "Received NPTEL certification. Ranking in top 1% with 87% marks in Introduction to programming through C",
          "First language learned in College",
        ]),
    Skill(
        skillName: "C++",
        skillValue: 56.0,
        skillDescription: "Fairly skilled",
        details: [
          "I use C++ as the base language in competitive programming",
          "Learned in college"
        ]),
    Skill(
        skillName: "Python",
        skillValue: 55.0,
        skillDescription: "Fairly skilled",
        details: [
          "Made ASCII art program in Python",
          "I use it as the alternative language in competitive programming"
        ]),
    Skill(
        skillName: "Javascript",
        skillValue: 54.0,
        skillDescription: "Fairly skilled",
        details: [
          "Created web apps with Javascript in the past",
          "Created Space Hero in P5Js purely with Javascript"
              "Self-learned + Youtube tutorials"
        ]),
    Skill(
        skillName: "NodeJS",
        skillValue: 52.0,
        skillDescription: "Fairly skilled",
        details: [
          "Created web app servers in the past",
          "Created servers for the web apps in NodeJs and express in the past (Mostly hosted on Heroku)",
          "Self-learned + Youtube tutorials"
        ]),
    Skill(
        skillName: "HTML / CSS",
        skillValue: 44.0,
        skillDescription: "Have worked with it",
        details: [
          "Created web apps in Html and Css in the past",
          "Self-learned + Youtube tutorials"
        ]),
    Skill(
        skillName: "Typescript",
        skillValue: 43.0,
        skillDescription: "Have worked with it",
        details: [
          "Writing backend of a server in typescript currently",
          "Still learning typescript",
          "Self-learned + Youtube tutorials"
        ]),
  ];

  static List<Skill> softwareTools = [
    Skill(
        skillName: "Unity 3D",
        skillValue: 80.0,
        skillDescription: "Highly skilled",
        details: [
          "Started learning Unity 3D back in standard 11",
          "Made several small personal level projects for learning",
          "Have been in an internship with a task of converting 2D ML environments in 3D",
          "Made big projects like Asphalt AI in Unity with almost everything created / redesigned by me",
          "Currently working on a videogame project in Unity for android devices",
          "Mostly self-learned + Documentation + Youtube tutorials + Technical articles",
        ]),
    Skill(
        skillName: "Blender 3D",
        skillValue: 78.0,
        skillDescription: "Highly skilled",
        details: [
          "Though I never had a formal training in many things like Organic modelling, I know the interface quite well",
          "Accquainted with various techniques used in 3D modelling like Polygon modelling, Retopology and Sculpting",
          "Have worked with particle systems",
          "Created several pieces of artwork in blender",
          "Have basic knowledge of skinning and animation including Inverse kinematics",
          "Have knowledge of texture baking and UV mapping thus allowing me to create game ready models",
        ]),
    Skill(
        skillName: "Photoshop / Gimp",
        skillValue: 65.0,
        skillDescription: "Reasonably skilled",
        details: [
          "I use photoshop and gimp for post processing of my artworks",
          "I have the knowledge of operating these softwares and achieving various effects and results"
        ]),
    Skill(
        skillName: "Audacity",
        skillValue: 30.0,
        skillDescription: "Have worked with",
        details: [
          "When it comes to audio editing in my softwares, I use the open-source software - Audacity"
        ]),
    Skill(skillName: "Various", skillValue: 50.0, details: [
      "I have tried numerous other technologies such as Java swing in Netbeans, Forms in C# (using designers), Android studio for android development in Java",
      "I have not created any presentable softwares using these tools as of now but I understand some of the concepts related to them"
    ])
  ];

  static List<Skill> languagesKnownModel = <Skill>[
    Skill(
        skillName: "English",
        skillValue: 70.0,
        skillDescription: "\nRead, Write, Speak - Efficiently",
        details: []),
    Skill(
        skillName: "Hindi",
        skillValue: 85.0,
        skillDescription: "\nRead, Write, Speak - Efficiently",
        details: []),
    Skill(
        skillName: "Bengali",
        skillValue: 83.0,
        skillDescription:
            "Mother Tongue\nRead, Write - Inefficiently\nSpeak - Efficiently",
        details: []),
  ];
}

class Hobby {
  String name;
  String description;

  Hobby({@required this.name, @required this.description});

  static final List<Hobby> hobbies = [
    Hobby(
        name: "Classical Music",
        description:
            "I am a huge fan of classical music. My favourite artist is Franz Liszt and favourite piece is Liebestraum by him"),
    Hobby(
        name: "Modern music",
        description:
            "I love modern music as well. My favourite artists are James Blunt, Michael David Rosenberg (Passenger) and Chris Martin (Coldplay)"),
    Hobby(
        name: "Playing Piano",
        description:
            "I am not very good at playing piano but I still want to learn to play Liebestraum some day"),
    Hobby(
        name: "Programming",
        description:
            "Programming is more like an entertainment for me. It feels like I am playing videogames while I am programming"),
    Hobby(
        name: "Videogames",
        description:
            "Ofcourse, The ultimate goal of my life is to be an awesome game developer"),
    Hobby(
        name: "Digital arts and Drawing",
        description:
            "Apart from digital arts, I like to do simple potraits too. I am not very good at it though"),
  ];
}

class AboutMe {
  static String name = "Mohd. Afridi Kayal";
  static DateTime dateOfBirth = DateTime.utc(1999, 10, 29);
  static String nationality = "Indian";
  static String religion = "Islam";
  static String bloodGroup = "O+";
  static String email = "kayalafridi@gmail.com";

  static final List<String> aboutMeDescriptive = [
    "Hello! My name is ",
    "Afridi Kayal. ",
    "I am currently pursuing my BTech. degree in computer science engineering from ",
    "St. Thomas' College of Engineering & Technology.\n\n",
    "I was born in ",
    "Delhi ",
    "while my family is originally from ",
    "West Bengal. ",
    "I studied in ",
    "Rich Harvest Public School, Janak Puri, New Delhi ",
    "till standard 5. My family moved to Kolkata back in ",
    "2009 ",
    "and I was transferred to ",
    "St. Thomas' Boys' School.\n\n",
    "I am a highly motivated student always keen to make new stuff. My programming journey started back in standard 8 when I started inspecting game mods and developed interest in game development. This interest led me to write my first game modification in a modding tool for ",
    "GTA 3D Universe Games ",
    "called ",
    "Sanny Builder. ",
    "I went on to make few mods but never persisited sadly. It was just for fun and I enjoyed it.\n\nBack in grade 9, I opted for ",
    "Java ",
    "and ofcourse, I regreted my choice in the beginning. Java was too different from the Sanny Builder that I was used to. Luckily, after struggling a bit and with the help of an awesome teacher of mine ",
    "(I am still very grateful to her)",
    ", I started understanding Java.\n\nMeanwhile, I started learning ",
    "Unity 3D ",
    "and ",
    "Blender 3D. ",
    "Earlier, we did not have a proper internet access so it was quite difficult to get started. My only option was to go through the documentation and I must say that the Unity's official documentation is one of the best I have ever seen.\n\nAfter completing school, I had enough knowledge for making a big project in Unity using C#.\n\n",
    "Chat Bot ",
    "was that first big project. It was followed by ",
    "Asphalt AI ",
    "in second year of my college. Both softwares won my team prizes in inter college competitions.\n\nI followed the same path to learn frameworks like ",
    "Flutter ",
    "and ",
    "Processing 3. ",
    "Also different programming languages like ",
    "Python, C, C++, etc. ",
    "Youtube tutorials and articles on the internet helped me a lot in my self learning journey. For a detailed timeline of my achievements, refer to the bottom of the page."
  ];
}

class TimelineElement {
  String title;
  String subtitle;
  DateTime date;
  IconData icon;

  TimelineElement({
    @required this.title,
    @required this.subtitle,
    @required this.date,
    @required this.icon,
  });

  static final List<TimelineElement> timeline = [
    TimelineElement(
        title: "Birth",
        subtitle: "Born: ${defaultDateFormat.format(AboutMe.dateOfBirth)}",
        date: AboutMe.dateOfBirth,
        icon: FontAwesome.child),
    TimelineElement(
        title: "Started studying",
        subtitle: "Rich Harvest Public School, Janak Puri, New Delhi",
        date: DateTime(2003),
        icon: Entypo.book),
    TimelineElement(
        title: "Changed school",
        subtitle: "St. Thomas' Boys' School, Kolkata, West Bengal",
        date: DateTime(2009),
        icon: Entypo.book),
    TimelineElement(
        title: "Softwares",
        subtitle:
            "Started messing with game makers and other softwares hence developing more interest. Made small incomplete projects for learning",
        date: DateTime(2011),
        icon: Entypo.laptop),
    TimelineElement(
        title: "Java basics",
        subtitle: "Started learning Java",
        date: DateTime(2013),
        icon: Entypo.book),
    TimelineElement(
        title: "Passed ICSE examination",
        subtitle: "Scored 84% in standard X",
        date: DateTime(2014),
        icon: Entypo.trophy),
    TimelineElement(
        title: "Developed few GTA SA mods",
        subtitle:
            "Simple modifications to add parkour animations and features in game using GMax",
        date: DateTime(2014),
        icon: Entypo.game_controller),
    TimelineElement(
        title: "Game development",
        subtitle: "Started learning Blender 3D and Unity 3D with C#",
        date: DateTime(2014),
        icon: Entypo.trophy),
    TimelineElement(
        title:
            "Registered in a programming competition with a friend for the first time",
        subtitle:
            "Unfortunately, we were the second runner ups and got no prize",
        date: DateTime(2015),
        icon: Entypo.info),
    TimelineElement(
        title: "Passed ISC examination",
        subtitle:
            "Scored 94% in standard XII and ranked 4 in Science department in school",
        date: DateTime(2016),
        icon: Entypo.trophy),
    TimelineElement(
        title: "Developed my first Android app in Unity",
        subtitle: "It was a simple love calculator made using Unity's 2D tools",
        date: DateTime(2016),
        icon: Entypo.trophy),
    TimelineElement(
        title: "College!",
        subtitle:
            "St. Thomas' College of Engineering and Tehnology, Kolkata, West Bengal",
        date: DateTime(2017),
        icon: Entypo.book),
    TimelineElement(
        title: "NPTEL Certification",
        subtitle:
            "Got certified in Gender Justice (76%) and Introduction to programming through C (87% Topper 1%)",
        date: DateTime(2018),
        icon: Entypo.trophy),
    TimelineElement(
        title: "Created a Chat Bot in Unity 3D",
        subtitle: "Won first prize in SREY Innovation challenge in College",
        date: DateTime(2018),
        icon: Entypo.trophy),
    TimelineElement(
        title:
            "Started creative coding and Competitive programming using Python",
        subtitle:
            "Learned processing 3 for creative coding with Java. Started learning Python for CP in Hackerearth",
        date: DateTime(2018),
        icon: Entypo.info),
    TimelineElement(
        title: "Processing 3",
        subtitle: "Created several creative programs in Processing 3",
        date: DateTime(2019),
        icon: Entypo.info),
    TimelineElement(
        title: "Rendering",
        subtitle: "Started creating digital arts in Blender",
        date: DateTime(2019),
        icon: Entypo.info),
    TimelineElement(
        title: "Asphalt AI",
        subtitle:
            "Created Asphalt AI software in Unity. Won second prize in SREY 2k19!",
        date: DateTime(2019),
        icon: Entypo.trophy),
    TimelineElement(
        title: "Github",
        subtitle:
            "Started using Github and pushed my creative work and other codes there",
        date: DateTime(2019),
        icon: Entypo.github),
    TimelineElement(
        title: "Completed a workshop",
        subtitle: "Advanced trends in algorithms",
        date: DateTime(2019),
        icon: Entypo.trophy),
    TimelineElement(
        title: "Flutter",
        subtitle: "Started learning Flutter framework",
        date: DateTime(2019),
        icon: Entypo.book),
    TimelineElement(
        title: "Taught Java to Diploma students",
        subtitle:
            "Wanted to share my knowledge so I taught diploma students. Had a 15-day contract at Xesp institution",
        date: DateTime(2019),
        icon: Entypo.light_bulb),
    TimelineElement(
        title: "Joined an internship",
        subtitle: "with ThinkXFactor",
        date: DateTime(2020),
        icon: Entypo.trophy),
    TimelineElement(
        title: "Lockdown",
        subtitle: "During lockdown, Learned a lot of stuff",
        date: DateTime(2020),
        icon: Entypo.book),
    TimelineElement(
        title: "Space hero",
        subtitle: "Created space hero game in P5Js",
        date: DateTime(2020),
        icon: Entypo.game_controller),
    TimelineElement(
        title: "Chat App",
        subtitle: "Created a chat application using Socket.IO",
        date: DateTime(2020),
        icon: Entypo.trophy),
    TimelineElement(
        title: "HackwithInfy!",
        subtitle:
            "Cleared both rounds of HackwithInfy to get an interview for system engineer specialist role at InfoSys",
        date: DateTime(2020),
        icon: Entypo.trophy),
    TimelineElement(
        title: "Serializer",
        subtitle: "Creaated a binary serialization library in Java",
        date: DateTime(2020),
        icon: Entypo.trophy),
    TimelineElement(
        title: "Color lookup tool",
        subtitle:
            "Created a color lookup tool in C# using Kd-tree implementation",
        date: DateTime(2020),
        icon: Entypo.trophy),
    TimelineElement(
        title: "Note Editor",
        subtitle: "Created an android App. Note Editor in Flutter",
        date: DateTime(2020),
        icon: Entypo.trophy),
    TimelineElement(
        title: "Color tools",
        subtitle: "Created a web app (REST API) for interaction with colors",
        date: DateTime(2020),
        icon: Entypo.trophy),
    TimelineElement(
        title: "Eyedropper",
        subtitle: "Using Color-tools' lookup API, created an android app that tells color names from camera input",
        date: DateTime(2020),
        icon: Entypo.trophy),
    TimelineElement(
        title: "Portfolio",
        subtitle: "Created this web app in flutter",
        date: DateTime(2020),
        icon: Entypo.book),
    TimelineElement(
        title: "Present day",
        subtitle: "Trying to improve everyday :)",
        date: DateTime.now(),
        icon: Entypo.star),
  ];
}

// Softwares

class SoftwarePaths {
  // VIDEOS
  static const String VID_ASPHALT =
      "assets/content/softwares/software_asphalt_video.mp4";
  static const String VID_BOT =
      "assets/content/softwares/software_bot_video.mp4";

  // STATIC
  static const String ASPHALT1 =
      "assets/content/softwares/software_asphalt1.jpg";
  static const String ASPHALT2 =
      "assets/content/softwares/software_asphalt2.jpg";
  static const String ASPHALT3 =
      "assets/content/softwares/software_asphalt3.jpg";
  static const String ASPHALT4 =
      "assets/content/softwares/software_asphalt4.jpg";
  static const String ASPHALT5 =
      "assets/content/softwares/software_asphalt5.jpg";
  static const String ASPHALT6 =
      "assets/content/softwares/software_asphalt6.jpg";
  static const String ASPHALT7 =
      "assets/content/softwares/software_asphalt7.jpg";
  static const String BOT1 = "assets/content/softwares/software_bot1.jpg";

  static const String BOT2 = "assets/content/softwares/software_bot2.png";
  static const String BOT3 = "assets/content/softwares/software_bot3.png";

  static const String UNI1 = "assets/content/softwares/software_uni1.png";
  static const String UNI2 = "assets/content/softwares/software_uni2.png";
  static const String UNI3 = "assets/content/softwares/software_uni3.png";
  static const String UNI4 = "assets/content/softwares/software_uni4.png";

  static const String ASPHALT_PPTX =
      "assets/content/softwares/software_asphalt.pptx";
}

final String profilePicPath = "assets/images/profile_pic.jpg";
final DateFormat defaultDateFormat = DateFormat.yMMMMd();
const String webURL = "http://kay-af.github.io/portfolio/";
