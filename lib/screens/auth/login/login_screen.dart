import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yoga_app/core/db/dbHelper.dart';
import 'package:my_yoga_app/screens/auth/signup/sign_up.dart';
import 'package:my_yoga_app/screens/home/home_screen.dart';
import '../components/background_image_clipper.dart';
import '../components/login_credentials.dart';


class LoginScreen extends StatefulWidget {
  String email;
  String password;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackgroundImage(),
                LoginCredentials(),

              ],
            ),
            // CircleButton(),
          ],
        ),
      ),
    );
  }


}