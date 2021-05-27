import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/dbHelper.dart';
import 'package:my_yoga_app/core/navigation_service/navigation_service.dart';
import 'package:my_yoga_app/core/sp/sp_helper.dart';
import 'package:my_yoga_app/global/custom_textFeild.dart';
import 'package:my_yoga_app/global/widgets/custom_button.dart';
import 'package:my_yoga_app/screens/auth/signup/sign_up.dart';

class LoginCredentials extends StatelessWidget {
  String email;
  String password;
  LoginCredentials();
  GlobalKey<FormState> formKey = GlobalKey();

  saveEmail(String value) {
    this.email = value;
  }

  savePassword(String value) {
    this.password = value;
  }

  validateEmail(String email) {
    if (email.length < 5) {
      return 'email is too short';
    } else if (!email.contains('@')) {
      return 'wrong email syntax';
    }
  }

  validatePass(String pass) {
    if (pass.length < 5) {
      return 'email is too short';
    }
  }

  saveForm() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      // SPHelper.spHelper.setUserEmail(email);
      DBHelper.dbHelper.selectUser(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please Log In',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('enter your email',style: TextStyle(color: primary),),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Material(
                    elevation: 10.0,
                    color: white,
                    borderRadius: BorderRadius.circular(30.0),
                    child: CustomTextfield(
                        isPassword: false,
                        label: email,
                        save: saveEmail,
                        validator: validateEmail,
                        hint:' Email',
                        icon: Icon(Icons.email),
                      type: TextInputType.emailAddress,),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Text('enter your password',style: TextStyle(color: primary),),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Material(
                    elevation: 10.0,
                    color: white,
                    borderRadius: BorderRadius.circular(30.0),
                    child: CustomTextfield(
                        isPassword: true,
                        label: password,
                        save: savePassword,
                        validator: validatePass,
                        hint: 'password',
                        type: TextInputType.visiblePassword,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Container(
              child: Text(
                'Forget Password!',
                style: TextStyle(fontSize: 16, color: Colors.blueAccent),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Custom_Button('Log In', saveForm),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              child: RichText(
                text: TextSpan(
                    text: "you haven't any account yet!",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            gotoSign();
                          },
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
          ],
        ),
      ),
    );
  }

  gotoSign() {
    NavigationService.navigationService
        .navigateAndReplaceWidget(SignUpScreen());
  }
}
