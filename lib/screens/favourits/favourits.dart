import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/models/course.dart';
import 'package:my_yoga_app/screens/home/components/build_course_widget.dart';

import '../home/components/custom_app_bar.dart';

class Favorites_Courses extends StatelessWidget{
  List<Course> courses;
  Function likeFun;
  Function updateCourseProgress,completeStyle,getStyles;
  Favorites_Courses(this.courses,this.likeFun,this.updateCourseProgress,this.completeStyle,{this.getStyles});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     return  Container(
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.only(top: appPadding * 2),
               child: CustomAppBar(),
             ),

              Expanded(
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
              ),
           ],
         )
     );
  }


}