import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/models/style.dart';
import 'package:my_yoga_app/screens/home/components/build_style_widget.dart';


class StylesInCourse extends StatelessWidget {
  String title;
  String id;
  List<Style>allStyles;
  Function updateCourseProgress,completeStyle;
  StylesInCourse(this.title,this.id,this.allStyles,this.updateCourseProgress,this.completeStyle) ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor:secondary,title: Text(this.title),leading: IconButton(icon: Icon(Icons.arrow_back_ios),
        onPressed:()=> Navigator.of(context).pop(),),),
      body: Padding(
            padding: const EdgeInsets.only(left: appPadding / 2),
            child: Container(
              height: double.infinity,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  // itemCount: styles.length,
                  itemCount: allStyles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BuildStylesWidgete(allStyles[index],'styles',updateCourseProgress,completeStyle);
                  }),
            ),
          )
    );
  }
}
