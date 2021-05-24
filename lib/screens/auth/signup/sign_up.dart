import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/navigation_service/navigation_service.dart';
import 'package:my_yoga_app/global/widgets/custom_button.dart';
import 'package:my_yoga_app/screens/auth/login/login_screen.dart';
import 'package:my_yoga_app/screens/home/home_screen.dart';


class SignUpScreen extends StatefulWidget{
  @override
  SignUpScreenState createState() {
    return SignUpScreenState();
  }

}
class SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      // appBar: AppBar(title: Text("SignUp"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: appPadding, vertical: appPadding * 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please Sign Up ',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Material(
              elevation: 10.0,
              color: white,
              borderRadius: BorderRadius.circular(30.0),
              child: TextField(
                decoration: InputDecoration(
                  border:
                  OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: appPadding * 0.75,
                      horizontal: appPadding),
                  fillColor: white,
                  hintText: 'Email',
                  suffixIcon: Icon(
                    Icons.email_rounded,
                    size: 25.0,
                    color: blueGrey.withOpacity(0.7),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Material(
              elevation: 10.0,
              color: white,
              borderRadius: BorderRadius.circular(30.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border:
                  OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: appPadding * 0.75,
                      horizontal: appPadding),
                  fillColor: Colors.white,
                  hintText: 'Password',
                  suffixIcon: Icon(
                    // Icons.lock_outline,
                    Icons.lock_rounded,
                    size: 25.0,
                    color: blueGrey.withOpacity(0.7),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Container(
              child: Text(
                'Forget Password!',
                style: TextStyle(
                    fontSize: 16, color: Colors.blueAccent),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Custom_Button('Sign Up', signUp),

            SizedBox(
              height: size.height * 0.04,
            ),
            Container(
              child: RichText
                (text: TextSpan(
                  text: "you already have an account!", style: TextStyle(
                  fontSize: 12, color: Colors.black),
                  children: [
                    TextSpan(text: "Login", style: TextStyle(
                        fontSize: 14, color: Colors.blueAccent),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          NavigationService.navigationService
                              .navigateAndReplaceWidget(LoginScreen());
                        },
                    )
                  ]),

              ),
            ),

          ],
        ),
      ),
    );
  }

  signUp() {
    // SPHelper.spHelper.setUserEmail(email);
    // User user=User(em, password)
    // DBHelper.dbHelper.insertUser(user);
    NavigationService.navigationService.navigateAndReplaceWidget(HomeScreen());
  }
}
