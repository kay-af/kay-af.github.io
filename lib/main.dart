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
        dividerTheme: DividerThemeData(
          thickness: 0.5
        ),
        appBarTheme: AppBarTheme(
          color: Colors.grey[900],
          elevation: 0
        ),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.dark(),
        ),
      ),
      initialRoute: HomePage.ROUTE,
      routes: {
        HomePage.ROUTE: (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}