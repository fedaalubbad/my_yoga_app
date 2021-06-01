import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/navigation_service/navigation_service.dart';
import 'package:my_yoga_app/core/sp/sp_helper.dart';
import 'package:my_yoga_app/screens/auth/login/login_screen.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    String name=SPHelper.spHelper.getUserName();
    String image=SPHelper.spHelper.getUserImage();

    logOut(){
      SPHelper.spHelper.logOut();
       }
    return  Padding(
      padding: EdgeInsets.only(left: 20.0,right: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(appPadding / 8),
                child: Container(
                  decoration: new BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(appPadding / 20),
                    child: Container(
                      decoration: new BoxDecoration(
                        color: white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(appPadding / 8),
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: FileImage(
                              File(image),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Text(
                name,
                style: TextStyle(color: black, fontWeight: FontWeight.w600,fontSize: 18),
              ),
            ],
          ),

          Row(
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: logOut,
                    child: Icon(
                      Icons.logout,
                      size: 20.0,
                      color:primary ,

                    ),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: primary,
                  //       borderRadius: BorderRadius.circular(30.0)
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(4.0),
                  //     child: Text('0',style: TextStyle(color: white,fontSize: 8),),
                  //   ),
                  // )
                ],
              ),
              // Transform(
              //   transform: Matrix4.rotationY(math.pi),
              //   alignment: Alignment.center,
              //   child: Icon(
              //     Icons.sort_rounded,
              //     size: 30.0,
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}
