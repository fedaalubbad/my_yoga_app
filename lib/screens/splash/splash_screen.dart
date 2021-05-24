import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/navigation_service/navigation_service.dart';
import 'package:my_yoga_app/core/sp/sp_helper.dart';
import 'package:my_yoga_app/screens/auth/login/login_screen.dart';
import 'package:my_yoga_app/screens/home/home_screen.dart';
class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
return  SplashScreenState();
  }

}
class SplashScreenState extends State<SplashScreen>{
  // navigationTohome(context) async{
  //   await Future.delayed(Duration(seconds: 4));
  //   Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>LoginScreen()));
  // }
  @override
  Widget build(BuildContext context) {
    // navigationTohome(context);
    Future.delayed(Duration(seconds: 3)).then((value) {
      bool isRegister = SPHelper.spHelper.getUserEmail('email');
      print('isRegister $isRegister');
      if (isRegister) {
        NavigationService.
           navigationService.routeReplacement(context,HomeScreen());
      } else {
        NavigationService.
        navigationService.routeReplacement(context,LoginScreen());
      }
    });
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
        children: [
          Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/pic3.jpg'),
                  fit: BoxFit.cover,colorFilter: ColorFilter.mode(secondary.withOpacity(0.8),BlendMode.darken))),

        ),
           Positioned(
             left: 0,
             right: 0,
             top:size.height/3 ,
             child: Container(
                child:Column(children: [
                  CircleAvatar(backgroundImage:AssetImage('assets/images/yoga.png',),radius: 60,backgroundColor: blueGrey,),
                  Text('Yoga',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w500,color: Colors.white),)
                ],)

          ),
           ),]
        )
    );
  }

}