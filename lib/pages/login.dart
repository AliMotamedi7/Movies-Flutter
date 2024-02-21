<<<<<<< HEAD
import 'package:dio/dio.dart';
=======
// ignore_for_file: must_be_immutable

>>>>>>> 8820a70 (last upadate)
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/pages/home.dart';
import 'package:movies_app/services/loginServices.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_page_transition.dart';

class Login extends StatefulWidget {
  Login({super.key, this.sharedPreferences});
  SharedPreferences? sharedPreferences;

<<<<<<< HEAD

=======
>>>>>>> 8820a70 (last upadate)
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _password.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      widget.sharedPreferences = await SharedPreferences.getInstance();
      var token = widget.sharedPreferences!.getString("token");
      if (token != null) {
        setState(() {
          isLogin = true;
        });
      }
    });
    _passShow = false;
  }

  bool _passShow = true;
  bool isLogin = false;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 20),
                    child: Image.asset(
                      "assets/images/movie.png",
                      width: 230,
                      height: 230,
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextField(
                        controller: _username,
                        style: GoogleFonts.raleway(color: Colors.black),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: InputBorder.none,
                            labelText: "Username",
                            labelStyle: GoogleFonts.raleway(),
                            prefixIcon: const Icon(
                              Icons.person_2_outlined,
                              color: Colors.black54,
                            )),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextField(
                        obscureText: !_passShow,
                        controller: _password,
                        style: GoogleFonts.raleway(color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: InputBorder.none,
                          labelText: "Password",
                          labelStyle: GoogleFonts.raleway(),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Colors.black54,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passShow = !_passShow;
                              });
                            },
                            icon: Icon(
                              _passShow
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget Password",
                        style: GoogleFonts.raleway(
                            color: const Color(0xfffd0a4c),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 45,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
<<<<<<< HEAD
                        LoginService.signIn(
                            _username.text, _password.text, widget.sharedPreferences!);
=======
                        LoginService.signIn(_username.text, _password.text,
                            widget.sharedPreferences!);
>>>>>>> 8820a70 (last upadate)
                        if (isLogin == true) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              FadeInRoute(
                                  page: const HomePage(), routeName: "/home"),
                              (route) => false);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                        backgroundColor: const Color(0xfffd0a4c),
                      ),
                      child: Text(
                        "LogIn",
                        style: GoogleFonts.raleway(
                            color: const Color(0xfff5f7f9),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account yet ? ",
                      style:
                          GoogleFonts.raleway(color: const Color(0xffb5bcc8)),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Sign Up',
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  "/signUp",
                                  (route) => false,
                                );
                              }),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
