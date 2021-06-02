import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/dbHelper.dart';
import 'package:my_yoga_app/core/db/models/style.dart';
import 'package:my_yoga_app/screens/home/components/build_style_widget.dart';
import 'package:provider/provider.dart';

import '../../provider.dart';

class StylesInCourse extends StatefulWidget {
  String title;
  String id;
  List<Style>allStyles;
  Function updateCourseProgress, completeStyle;
  StylesInCourse(this.title, this.id, this.allStyles, this.updateCourseProgress, this.completeStyle);

  @override
  _styleInCourseState createState() {
    return _styleInCourseState();
  }
}
class _styleInCourseState extends State<StylesInCourse>{

  getStyles(String courseId) async {
    Provider.of<MyProvider>(context).getStyles(courseId);
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<MyProvider>(context).getStyles(widget.id);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(backgroundColor:secondary,title: Text(widget.title),leading: IconButton(icon: Icon(Icons.arrow_back_ios),
          onPressed:()=> Navigator.of(context).pop(),),),
        body: Padding(
          padding: const EdgeInsets.only(left: appPadding / 2),
          child: Container(
            height: double.infinity,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                // itemCount: styles.length,
                itemCount: Provider.of<MyProvider>(context).allStyles.length,
                itemBuilder: (BuildContext context, int index) {
                  return BuildStylesWidgete(Provider.of<MyProvider>(context).allStyles[index],'styles',widget.updateCourseProgress,widget.completeStyle,getStyles:getStyles);
                }),
          ),
        )
    );
  }


}