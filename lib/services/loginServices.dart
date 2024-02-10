import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  static signIn(String email, String password,
      SharedPreferences sharedPreferences) async {
    var dio = Dio();
    try {
      var response = await dio.post("https://moviesapi.ir/oauth/token",
          data: FormData.fromMap({
            "grant_type": "password",
            "username": email,
            "password": password,
          }),
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          }));
      if (response.statusCode == 200) {
        print(response.data["access_token"]);
        sharedPreferences.setString("token", response.data["access_token"]);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  signUp(String email, String password, String name, bool isSignUp) async {
    var dio = Dio();
    try {
      var response = await dio.post(
        "https://moviesapi.ir/api/v1/register",
        data: FormData.fromMap({
          "email": email,
          "name": name,
          "password": password,
        }),
      );
      isSignUp = true;
      return response.data;
    } catch (e) {
      print("object");
      print(e.toString());
    }
  }
}
