import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/navigation_service/navigation_service.dart';
import 'package:my_yoga_app/global/custom_textFeild.dart';
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
  String name='',image='',email='',password='',confirmPassword='';
      String height='0.0',weight='0.0';

  GlobalKey<FormState> formKey = GlobalKey();

  saveName(String value) {
    this.name = value;
  }
  saveEmail(String value) {
    this.email = value;
  }

  savePassword(String value) {
    this.password = value;
  }
  saveConfirmPassword(String value) {
    this.confirmPassword = value;
  }

  saveImage(String value) {
    this.image = value;
  }
  saveHeight(String value) {
    this.height = value;
  }
  saveWeight(String value) {
    this.weight = value;
  }

  validateEmail(String email) {
    if (email.length < 6) {
      return 'email is too short';
    } else if (!email.contains('@')) {
      return 'wrong email syntax!';
    }
  }

  validateName(String name) {
    if (name.length == 0) {
      return 'enter your name!';
    }
    else if (name.length < 5) {
      return 'name is too short!';
    }
  }

  validatePass(String pass) {
    if (pass.length < 5) {
      return 'email is too short!';
    }
  }

  validateMatchPass(String pass) {
    if(pass.length==0){
      return 'enter confirm password!';
    }
    else if (pass!=password) {
      return 'password not matched try again!';
    }
  }

  saveForm(user) async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      // SPHelper.spHelper.setUserEmail(email);
      // DBHelper.dbHelper.insertUser(user);
    }
  }
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
        child: SingleChildScrollView(
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
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Material(
                      elevation: 10.0,
                      color: white,
                      borderRadius: BorderRadius.circular(30.0),
                      child: CustomTextfield(
                          isPassword: true,
                          label: name,
                          save: saveName,
                          validator: validateName,
                          hint: "Name",
                          icon: Icon(Icons.edit)),
                    ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                    Material(
                      elevation: 10.0,
                      color: white,
                      borderRadius: BorderRadius.circular(30.0),
                      child: CustomTextfield(
                          isPassword: true,
                          label: email,
                          save: saveEmail,
                          validator: validateEmail(email),
                          hint: "Email",
                          icon: Icon(Icons.email)),
                    ),
                SizedBox(
                  height: size.height * 0.04,
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
                    type: TextInputType.visiblePassword,
                    hint: "password",),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Material(
                  elevation: 10.0,
                  color: white,
                  borderRadius: BorderRadius.circular(30.0),
                  child: CustomTextfield(
                    isPassword: true,
                    label: confirmPassword,
                    save: saveConfirmPassword,
                    validator: validateMatchPass,
                    type: TextInputType.visiblePassword,
                    hint: "confirmPassword",),
                ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
                Material(
                  elevation: 10.0,
                  color: white,
                  borderRadius: BorderRadius.circular(30.0),
                  child: CustomTextfield(
                    isPassword: false,
                    label: height,
                    save: (v){},
                    validator: (v){},
                    hint: "your height",
                  icon: Icon(Icons.height),
                  type: TextInputType.number,),
                ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Material(
                  elevation: 10.0,
                  color: white,
                  borderRadius: BorderRadius.circular(30.0),
                  child: CustomTextfield(
                    isPassword: false,
                    label: weight,
                    save: (v){},
                    validator: (v){},
                    hint: "your weight",
                    icon: Icon(Icons.accessibility_outlined),
                    type: TextInputType.number,),
                ),
              SizedBox(
                height: size.height * 0.04,
              ),

              Custom_Button('Sign Up', saveForm),

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