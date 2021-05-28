import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/dbHelper.dart';
import 'package:my_yoga_app/core/db/models/user.dart';
import 'package:my_yoga_app/core/navigation_service/navigation_service.dart';
import 'package:my_yoga_app/global/custom_textFeild.dart';
import 'package:my_yoga_app/global/widgets/custom_button.dart';
import 'package:my_yoga_app/screens/auth/login/login_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class SignUpScreen extends StatefulWidget{
  SignUpScreen();
  @override
  SignUpScreenState createState() {
    return SignUpScreenState();
  }
}
class SignUpScreenState extends State<SignUpScreen> {
  String name = '',
      image = 'assets/images/profile_add.png',
      email = '',
      password = '',
      confirmPassword = '';
  double height = 0.0,
      weight = 0.0;
  final _passwordContraller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  File _image;
  final picker = ImagePicker();

// تنفذ عند اختيارأو التقاط الصورة
  Future getImage(ImageSource src) async {
    final pickedFile = await picker.getImage(source: src);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No Image selected!');
      }
    });
  }

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

  saveHeight(double value) {
    this.height = value;
  }

  saveWeight(double value) {
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
      return 'password is too short!';
    }
  }

  validateMatchPass(String pass) {
    if (pass.length == 0) {
      return 'enter confirm password!';
    } else if (pass != _passwordContraller.text) {
      return 'password not matched try again!';
    }
  }

  saveForm(BuildContext context) async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      User user = User(name, email, password, image: image,
          weight: weight,
          height: height,
          progress: 0.0);
      User signedUser = await DBHelper.dbHelper.getUser(email);
      if (signedUser == null) {
        await DBHelper.dbHelper.insertUser(user);
      }else{
        buildToast('user is already exist try again!', context);
      }
    }
  }

  void buildToast(String msg,BuildContext context) =>
      Toast.show(msg, context,
          duration: Toast.LENGTH_LONG,
          textColor: Colors.red,
          backgroundColor: Colors.amber,
          backgroundRadius: 5,
          gravity: Toast.CENTER);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      // appBar: AppBar(title: Text("SignUp"),),
      body: Padding(
        padding: const EdgeInsets.only(
           left: appPadding,right: appPadding,bottom: appPadding/4, top: appPadding*4),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              InkWell(
                onTap: showAlert,
                child: Stack(children: [
                  CircleAvatar(radius:50,backgroundImage: _image==null?AssetImage(image):FileImage(_image),),
                  Positioned(
                    bottom: 3,right: 3,
                      child: Icon(Icons.add_a_photo_sharp,color: Colors.pink,)
                  )
                ],),
              ),

              SizedBox(
                height: size.height * 0.03,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('enter your name',style: TextStyle(color: primary),),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Material(
                      elevation: 10.0,
                      color: white,
                      borderRadius: BorderRadius.circular(30.0),
                      child: CustomTextfield(
                          isPassword: false,
                          label: name,
                          save: saveName,
                          validator: validateName,
                          hint: "Name",
                          icon: Icon(Icons.edit),
                          type: TextInputType.text,),
                    ),
                SizedBox(
                  height: size.height * 0.04,
                ),
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
                          hint: "Email",
                          icon: Icon(Icons.email),
                          type: TextInputType.emailAddress,
                      ),
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
                    type: TextInputType.visiblePassword,
                    hint: "password",
                     passwordContraller: _passwordContraller,),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                    Text('confirm password',style: TextStyle(color: primary),),
                    SizedBox(
                      height: size.height * 0.01,
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

                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Text('enter your height',style: TextStyle(color: primary),),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                      Material(
                        elevation: 10.0,
                        color: white,
                        borderRadius: BorderRadius.circular(30.0),
                        child: CustomTextfield(
                          isPassword: false,
                          label: height.toString(),
                          save: (v){},
                          validator: (v){},
                          hint: "your height",
                        icon: Icon(Icons.height),
                        type: TextInputType.number,),
                      ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Text('enter your weight',style: TextStyle(color: primary),),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Material(
                        elevation: 10.0,
                        color: white,
                        borderRadius: BorderRadius.circular(30.0),
                        child: CustomTextfield(
                          isPassword: false,
                          label: weight.toString(),
                          save: (v){},
                          validator: (v){},
                          hint: "your weight",
                          icon: Icon(Icons.accessibility_outlined),
                          type: TextInputType.number,),
                      ),
                  ],
                ),
              ),

              SizedBox(
                height: size.height * 0.04,
              ),

              Custom_Button('Sign Up', saveForm),

              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                child: RichText
                  (text: TextSpan(
                    text: "you already have an account!", style: TextStyle(
                    fontSize: 14, color: Colors.black),
                    children: [
                      TextSpan(text: "Login", style: TextStyle(
                          fontSize: 16, color: Colors.blueAccent),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            NavigationService.navigationService
                                .navigateAndReplaceWidget(LoginScreen());
                          },
                      )
                    ]),

                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
  //////////////////////////////////////////////////alert to choose image
showAlert(){
  var ad =AlertDialog(
    title: Text('choose image from!'),
    content: Container(
      height: 150,
      child: Column(
        children: [
          Divider(color: Colors.black,),
          Container(
            width: 300,
            color: Colors.teal,
            child: ListTile(
              title: Text('Gallery'),
              leading: Icon(Icons.image),
              onTap: (){
                Navigator.of(context).pop();
                getImage(ImageSource.gallery);
              },
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: 300,
            color: Colors.teal,
            child: ListTile(
              title: Text('Camera'),
              leading: Icon(Icons.camera_alt),
              onTap: (){
                Navigator.of(context).pop();
                getImage(ImageSource.camera);
              },
            ),
          ),
        ],
      ),
    ),
  );
  showDialog(builder: (context) => ad, context: context);
}

}