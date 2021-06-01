import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/dbHelper.dart';
import 'package:my_yoga_app/core/db/models/style.dart';
import 'package:my_yoga_app/screens/home/components/build_style_widget.dart';

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
  @override
  void initState() {
    getStyles(widget.id);
    super.initState();
    setState(() {
    });
  }
  getStyles(String courseId) async {
    List<Style> styles = await DBHelper.dbHelper.getStylesInCourse(courseId);
    widget.allStyles = styles;
    return styles;
  }
  @override
  Widget build(BuildContext context) {
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
                itemCount: widget.allStyles.length,
                itemBuilder: (BuildContext context, int index) {
                  return BuildStylesWidgete(widget.allStyles[index],'styles',widget.updateCourseProgress,widget.completeStyle,getStyles:getStyles);
                }),
          ),
        )
    );
  }


}