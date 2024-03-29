import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/models/style.dart';
import 'package:my_yoga_app/data/data.dart';

import '../../../core/navigation_service/navigation_service.dart';
import '../../StylesInCourse/stylesInCourse.dart';
import 'build_style_widget.dart';


class DiffStyles extends StatelessWidget {
  List<Style>styles;
  Function updateCourseProgress,completeStyle;
  DiffStyles(this.styles,this.updateCourseProgress,this.completeStyle);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              bottom: appPadding/2,top: appPadding,left: appPadding ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'For Beginners',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                ),
              ),
              InkWell(
                onTap: goStylesScreen,
                child: Text(
                  'See All',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w800, color: primary),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: appPadding / 2),
          child: Container(
            height: size.height * 0.30,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                // itemCount: styles.length,
                itemCount:3,
                itemBuilder: (BuildContext context, int index) {
                  return BuildStylesWidgete(styles[index],'home',updateCourseProgress,completeStyle);
                }),
          ),
        )
      ],
    );
  }
  goStylesScreen(){
    NavigationService.navigationService.navigateToWidget(StylesInCourse('Meditation', '2', styles, updateCourseProgress, completeStyle));

  }
}
