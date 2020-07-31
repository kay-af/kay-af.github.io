import 'package:flutter/material.dart';

class HomeManager {
  
  final ScrollController drawerScrollController;
  int selectedPage;
  bool drawerExpanded;

  HomeManager({int selected = 0}) : 
    this.drawerScrollController = ScrollController(),
    this.selectedPage = selected;

  void dispose() {
    drawerScrollController.dispose();
  }
}