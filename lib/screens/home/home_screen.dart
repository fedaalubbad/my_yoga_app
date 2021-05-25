import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/dbHelper.dart';
import 'package:my_yoga_app/core/db/models/course.dart';
import 'package:my_yoga_app/data/data.dart';

import 'components/courses.dart';
import 'components/custom_app_bar.dart';
import 'components/diff_styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selsctedIconIndex = 2;
  List<Course>allCourses;

  getAllCourses()async{
      List<Course>courses = await DBHelper.dbHelper.getAllCourses();
      this.allCourses = courses;

    setState(() {
    });
  }
  @override
  void initState() {
    super.initState();
    getAllCourses();
  }
  insertCourses() async{
    for (int i=0; i < courses.length; i++) {
     await DBHelper.dbHelper.insertCourse(courses[i]);
    }
  }
  insertStyles()async{
    for (int i=0; i < styles.length; i++) {
      await DBHelper.dbHelper.insertStyle(styles[i]);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Padding(
         padding: EdgeInsets.only(top:appPadding * 2),

         child: Column(
           children: [
             CustomAppBar(),

             DiffStyles(),

             Courses(allCourses),
           ],
         ),
       ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        index: selsctedIconIndex,
        buttonBackgroundColor: primary,
        height: 60.0,
        color: white,
        onTap: (index) {
          setState(() {
            selsctedIconIndex = index;
          });
        },
        animationDuration: Duration(
          milliseconds: 200,
        ),
        items: <Widget>[
          Icon(Icons.play_arrow_outlined, size: 30,color: selsctedIconIndex == 0 ? white : black,),
          Icon(Icons.search, size: 30,color: selsctedIconIndex == 1 ? white : black,),
          Icon(Icons.home_outlined, size: 30,color: selsctedIconIndex == 2 ? white : black,),
          Icon(Icons.favorite_border_outlined, size: 30,color: selsctedIconIndex == 3 ? white : black,),
          Icon(Icons.person_outline, size: 30,color: selsctedIconIndex == 4 ? white : black,),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:insertStyles,
      ),
    );
  }
}
