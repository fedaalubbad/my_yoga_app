import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/models/course.dart';
import 'package:my_yoga_app/screens/home/components/build_course_widget.dart';


class Courses extends StatelessWidget {
  List<Course>coursesList;
  Courses(this.coursesList);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: appPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Courses',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: primary),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                // itemCount: courses.length,
                itemCount: coursesList.length,
                itemBuilder: (context, index) {
                  return BuildCourseWidget(coursesList[index]);
                },
              ))
        ],
      ),
    );
  }
}
