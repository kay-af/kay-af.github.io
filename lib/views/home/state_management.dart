import 'package:flutter/material.dart';

class HomeManager {
  
  final ScrollController drawerScrollController;
  int selectedPage;
  bool drawerExpanded;

  HomeManager() : 
    this.drawerScrollController = ScrollController(),
    this.selectedPage = 0;

  void dispose() {
    drawerScrollController.dispose();
  }
}