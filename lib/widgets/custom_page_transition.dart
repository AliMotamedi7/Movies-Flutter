import 'package:flutter/material.dart';

class FadeInRoute extends PageRouteBuilder {
  final Widget page;

  FadeInRoute({required this.page, required String routeName})
      : super(
    settings: RouteSettings(name: routeName), // set name here
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    transitionDuration: const Duration(seconds: 1),
  );
}