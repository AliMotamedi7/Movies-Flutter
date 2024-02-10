import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/services/loginServices.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_page_transition.dart';
import 'home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TickerProviderStateMixin {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      sharedPreferences = await SharedPreferences.getInstance();
      var id = sharedPreferences!.getInt("id");
      if (id != null) {
        setState(() {
          isSignUp = true;
        });
      }
    });
    _passShow = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _username.dispose();
    _password.dispose();
  }

  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  SharedPreferences? sharedPreferences;
  bool _passShow = true;
  bool isSignUp = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  width: 350,
                  height: 300,
                  child: Image.asset("assets/images/signup.png"),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: TextField(
                      controller: _email,
                      style: GoogleFonts.raleway(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: InputBorder.none,
                          labelText: "Email",
                          labelStyle: GoogleFonts.raleway(),
                          prefixIcon: const Icon(
                            Icons.mail_outline,
                            color: Colors.black54,
                          )),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 10),
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
                  margin: const EdgeInsets.only(right: 20, left: 20),
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
                            _passShow ? Icons.visibility : Icons.visibility_off,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  height: 45,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  // <-- match_parent
                  child: ElevatedButton(
                    onPressed: () {
                      LoginService().signUp(_email.text, _password.text,
                          _username.text , isSignUp);
                      if (isSignUp == true) {
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
                      "SignUp",
                      style: GoogleFonts.raleway(
                          color: const Color(0xfff5f7f9),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const Spacer(),
                RichText(
                  text: TextSpan(
                    text: "Already have an account ? ",
                    style: GoogleFonts.raleway(color: const Color(0xffb5bcc8)),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Log In',
                          style:
                              GoogleFonts.raleway(fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                "/login",
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
    );
  }
}
