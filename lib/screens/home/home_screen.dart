import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/dbHelper.dart';
import 'package:my_yoga_app/core/db/models/course.dart';
import 'package:my_yoga_app/core/db/models/style.dart';
import 'package:my_yoga_app/core/db/models/user.dart';
import 'package:my_yoga_app/core/sp/sp_helper.dart';
import 'package:my_yoga_app/data/data.dart';
import 'package:my_yoga_app/screens/favourits/favourits.dart';
import 'package:my_yoga_app/screens/profile/profile.dart';
import 'components/courses.dart';
import 'components/custom_app_bar.dart';
import 'components/diff_styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int selsctedIconIndex = 1;
  List<Course>allCourses;

  getAllCourses()async{
      List<Course>courses = await DBHelper.dbHelper.getAllCourses();
      this.allCourses = courses;

    setState(() {
    });
  }
  List<Style>stylesForBeginner;
  List<Style>stylesList;

  getStylesForBeginner(String courseId)async{
      List<Style>styles = await DBHelper.dbHelper.getStylesInCourse(courseId);
      this.stylesForBeginner = styles;

    setState(() {
    });
    return styles;
  }
   var email=SPHelper.spHelper.getEmail();
  User profile;
  getUser()async{
      User user = await DBHelper.dbHelper.getUser(email);
      this.profile = user;

    setState(() {
    });
    return user;
  }

  List<Course>favCourses;
  getfavoritsCourse()async{
      List<Course>courses = await DBHelper.dbHelper.getFavCourses();
      this.favCourses = courses;
    setState(() {
    });
    return favCourses;
  }
  @override
  void initState() {
    super.initState();
    getAllCourses();
    getStylesForBeginner('2');
    getfavoritsCourse();
    getUser();
    setState(() {

    });
  }
  insertCourses() async{
    for (int i=0; i < courses.length; i++) {
     await DBHelper.dbHelper.insertCourse(courses[i]);
     await getAllCourses();
    }
  }
  insertStyles()async{
    for (int i=0; i < styles.length; i++) {
      await DBHelper.dbHelper.insertStyle(styles[i]);
      await getStylesForBeginner('2');
    }
    // insertCourses();

  }
  deleteData()async{
    DBHelper.dbHelper.cleanDatabase();
    // DBHelper.dbHelper.deleteTable();
    // setState(() {
    //
    // });
  }
  Future<bool> LikeButtonTapped(Course course) async {
    await DBHelper.dbHelper.favCourse(course);
    await getAllCourses();
    await getfavoritsCourse();
    setState(() {

    });
  }
  completeStyle(Style style)async{
    await DBHelper.dbHelper.completeStyle(style);
    await getStylesForBeginner(style.courseId);
  }
  updateCourseProgress(Style style)async{
    await DBHelper.dbHelper.updateCourseProgress(style.courseId);
    await getAllCourses();
    await getfavoritsCourse();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body:selsctedIconIndex==1? Padding(
         padding: EdgeInsets.only(top:appPadding * 2),

         child: Column(
           children: [
             CustomAppBar(),

             DiffStyles(stylesForBeginner,updateCourseProgress,completeStyle),

             Courses(allCourses,LikeButtonTapped,updateCourseProgress,completeStyle),
           ],
         ),
       ): selsctedIconIndex==2?
          Favorites_Courses(favCourses,LikeButtonTapped,updateCourseProgress,completeStyle):
          Profile(profile),

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        index: selsctedIconIndex,
        buttonBackgroundColor: secondary,
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
          Icon(Icons.person_outline, size: 30,color: selsctedIconIndex == 0 ? white : black,),
          Icon(Icons.home_outlined, size: 30,color: selsctedIconIndex == 1 ? white : black,),
          Icon(Icons.favorite_border_outlined, size: 30,color: selsctedIconIndex == 2 ? white : black,),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:insertStyles
      ),
    );
  }
}
