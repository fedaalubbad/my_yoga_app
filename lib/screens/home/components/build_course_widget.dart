import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/dbHelper.dart';
import 'package:my_yoga_app/core/db/models/course.dart';
import 'package:my_yoga_app/core/db/models/style.dart';
import 'package:my_yoga_app/core/navigation_service/navigation_service.dart';
import 'package:my_yoga_app/screens/StylesInCourse/stylesInCourse.dart';

class BuildCourseWidget extends StatelessWidget{
  Course course;
  List<Style>allStyles;
  BuildCourseWidget(this.course);
  getStyles(String courseId)async{
    List<Style>styles = await DBHelper.dbHelper.getStylesInCourse(courseId);
    this.allStyles = styles;
    return styles;
  }
  goScreen(){
    NavigationService.navigationService.navigateToWidget(StylesInCourse(course.name,course.id,allStyles));
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    getStyles(course.id);
    return InkWell(
      onTap: goScreen,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: appPadding, vertical: appPadding / 2),
        child: Container(
          height: size.height * 0.2,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                    color: black.withOpacity(0.3),
                    blurRadius: 30.0,
                    offset: Offset(10, 15))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(appPadding),
            child: Row(
              children: [
                Container(
                  width: size.width * 0.3,
                  height: size.height * 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      image: AssetImage(course.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: appPadding / 2, top: appPadding / 1.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          children: [
                            Icon(Icons.folder_open_rounded,color: black.withOpacity(0.3),),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Text(course.students,style: TextStyle(color: black.withOpacity(0.3),),)
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time_outlined,color: black.withOpacity(0.3),),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Text(course.time.toString() + ' min',style: TextStyle(color: black.withOpacity(0.3),),)
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }



}