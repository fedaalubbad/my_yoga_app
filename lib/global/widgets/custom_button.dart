import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/dbHelper.dart';
import 'package:my_yoga_app/core/db/models/user.dart';
import 'package:my_yoga_app/core/navigation_service/navigation_service.dart';
import 'package:my_yoga_app/screens/home/home_screen.dart';

class Custom_Button extends StatelessWidget{
  String title;
  Function function;
  Custom_Button(this.title,this.function);
  login(String email,String password)async{
    // SPHelper.spHelper.setUserEmail(email);
    await DBHelper.dbHelper.selectUser(email, password);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => HomeScreen(),
    //   ),
    // );
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => NavigationService.navigationService.navigateAndReplaceWidget(HomeScreen()),
      child: Material(
          elevation: 10.0,
          shadowColor: primary,
          color: secondary,
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            width: size.width,
            // height: size.width * 0.15,
            height: size.height * 0.08,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),

    );
  }

}