import 'package:flutter/material.dart';
import 'package:movies_app/pages/home.dart';
import 'package:movies_app/pages/login.dart';
<<<<<<< HEAD
import 'package:movies_app/pages/movie_page.dart';
=======
import 'package:movies_app/pages/profile.dart';
>>>>>>> 8820a70 (last upadate)
import 'package:movies_app/pages/signup.dart';
import 'package:movies_app/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const SplashScreen(),
        "/home": (context) => const HomePage(),
<<<<<<< HEAD
        "/login": (context) =>  Login(),
        "/signUp": (context) => const SignUp(),
        "/moviePage": (context) => const MoviePage(),
=======
        "/login": (context) => Login(),
        "/signUp": (context) => const SignUp(),
        "/profilePage": (context) => const ProfilePage(),
>>>>>>> 8820a70 (last upadate)
      },
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
