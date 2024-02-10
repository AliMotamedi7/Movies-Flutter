import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/pages/home.dart';
import 'package:movies_app/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  SharedPreferences? sharedPreferences;

  route(Widget page, String routeName) {
    Navigator.pushAndRemoveUntil(context,
        FadeInRoute(page: page, routeName: routeName), (route) => false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences!.getString("token");
      var duration = const Duration(seconds: 6);
      Timer(
        duration,
        () => token != null
            ? route(const HomePage(), "/Home")
            : route(Login(sharedPreferences: sharedPreferences), "/login"),
      );
    });
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
              child: Lottie.asset("assets/animations/movies.json",
                  repeat: true,
                  frameRate: FrameRate(60),
                  controller: _controller, onLoaded: (composition) {
                _controller
                  ..duration = composition.duration
                  ..forward()
                  ..addListener(() {
                    if (_controller.isCompleted) {
                      _controller.repeat();
                    }
                  });
              }),
            ),
            Text(
              "Welcome",
              style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "We're glad you're here.",
              style: GoogleFonts.raleway(
                  color: const Color(0xffb5bcc8),
                  fontWeight: FontWeight.normal,
                  fontSize: 25),
            ),
            const Spacer(),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 40),
              child: const CircularProgressIndicator(
                color: Color(0xfffd0a4c),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
