import 'package:flutter/material.dart';
import 'package:portfolio/views/home/home.dart';

void main() {
  runApp(PortfolioApp());
  print("Flutter app started");
}

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Portfolio",
      theme: ThemeData(
        dividerTheme: DividerThemeData(thickness: 0.5),
        appBarTheme: AppBarTheme(color: Colors.grey[900], elevation: 0),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.dark(),
        ),
      ),
      initialRoute: HomePage.ROUTE,
      routes: {
        HomePage.ROUTE: (context) => HomePage(),
      },
      onGenerateRoute: (settings) {
        var selected = 0;
        switch (settings.name) {
          case "/personal":
            selected = 0;
            break;
          case "/digital_arts":
            selected = 1;
            break;
          case "/creative":
            selected = 2;
            break;
          case "/softwares":
            selected = 3;
            break;
          case "/web":
            selected = 4;
            break;
          case "/mobile":
            selected = 5;
            break;
          case "/blogs":
            selected = 6;
            break;
          case "/achievements":
            selected = 7;
            break;
        }
        return MaterialPageRoute(
            builder: (context) => HomePage(
                  selected: selected,
                ));
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
