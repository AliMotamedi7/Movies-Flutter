import "package:flutter/material.dart";

class NavBar {
  final Widget page;
  final GlobalKey<NavigatorState> navKey;

  NavBar({required this.page, required this.navKey});
}
