import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';

import '../../constants/constants.dart';
import '../../constants/constants.dart';
import '../../core/db/models/user.dart';

class CircleButton extends StatelessWidget {
  Function editUserInfo;
  User user;
  CircleButton(this.editUserInfo,this.user);
  TextEditingController name_Contraller=new TextEditingController();
  TextEditingController h_Contraller= TextEditingController();
  TextEditingController w_Contraller=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      // top: size.height * 0.42,
      // right: size.width * 0.15,
      bottom: size.height/40,
      right: size.width/15,
      child: FloatingActionButton(
        onPressed: () {showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white70,
                content: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Positioned(
                      right: -40.0,
                      top: -40.0,
                      child: InkResponse(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.close),
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),

                     Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                                controller:name_Contraller,
                                keyboardType:TextInputType.name,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: appPadding * 0.75,
                                      horizontal: appPadding),
                                  fillColor: Colors.white,
                                  hintText: 'new name',)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                                controller:h_Contraller,
                                keyboardType:TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: appPadding * 0.75,
                                      horizontal: appPadding),
                                  fillColor: Colors.white,
                                  hintText: 'new height',)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                                controller:w_Contraller,
                                keyboardType:TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: appPadding * 0.75,
                                      horizontal: appPadding),
                                  fillColor: Colors.white,
                                  hintText: 'new weight',)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              child: Text("Submit"),
                              onPressed: () {
                                User editedUser=User(
                                 name_Contraller.text.isEmpty?user.name:name_Contraller.text
                                ,user.email,user.password,
                                height:h_Contraller.text.isEmpty?user.height:double.parse(h_Contraller.text ),
                                weight:w_Contraller.text.isEmpty?user.weight:double.parse(w_Contraller.text)
                                ,image: user.image,progress: user.progress);
                                editUserInfo(editedUser);
                                }

                            ),
                          )
                        ],

                    ),
                  ],
                ),
              );
            });
        },
        elevation: 5.0,
        backgroundColor: primary,
        child: Icon(
          Icons.edit,
          size: 30.0,
        ),
      ),
    );
  }
}