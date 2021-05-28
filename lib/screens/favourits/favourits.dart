import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/models/course.dart';
import 'package:my_yoga_app/screens/home/components/build_course_widget.dart';

class Favorites_Courses extends StatelessWidget{
  List<Course> courses;
  Function likeFun;
  Function updateCourseProgress,completeStyle;
  Favorites_Courses(this.courses,this.likeFun,this.updateCourseProgress,this.completeStyle);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     return Padding(
            padding: const EdgeInsets.only(left: appPadding / 2),
            child: Container(
              height: double.infinity,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  // itemCount: styles.length,
                  itemCount: courses.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BuildCourseWidget(courses[index],likeFun,updateCourseProgress,completeStyle);
                  }),
            ),

    );
  }


}