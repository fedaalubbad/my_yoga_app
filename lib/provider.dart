import 'package:flutter/cupertino.dart';
import 'package:my_yoga_app/core/db/dbHelper.dart';
import 'package:my_yoga_app/core/db/models/style.dart';

class MyProvider extends ChangeNotifier{
  List<Style> allStyles;
  // List<Style>  stylesForBeginner;

  getStyles(String courseId) async {
    List<Style> styles = await DBHelper.dbHelper.getStylesInCourse(courseId);
    allStyles = styles;
    notifyListeners();
  }
  // getStylesForBeginner(String courseId)async{
  //   List<Style> styles = await DBHelper.dbHelper.getStylesInCourse(courseId);
  //   stylesForBeginner = styles;
  //   notifyListeners();
  // }
}