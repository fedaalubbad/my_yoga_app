import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/dbHelper.dart';
import 'package:my_yoga_app/core/db/models/course.dart';
import 'package:my_yoga_app/core/db/models/style.dart';
import 'package:my_yoga_app/core/navigation_service/navigation_service.dart';
import 'package:my_yoga_app/screens/StylesInCourse/stylesInCourse.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../home_screen.dart';

class BuildCourseWidget extends StatelessWidget {
  Course course;
  List<Style> allStyles;
  Function likeFunction;
  Function updateCourseProgress,completeStyle;

  BuildCourseWidget(this.course,this.likeFunction,this.updateCourseProgress,this.completeStyle);

  getStyles(String courseId) async {
    List<Style> styles = await DBHelper.dbHelper.getStylesInCourse(courseId);
    this.allStyles = styles;
    return styles;
  }

  goScreen() {
    NavigationService.navigationService
        .navigateToWidget(StylesInCourse(course.name, course.id, allStyles,updateCourseProgress,completeStyle));
  }
  Future<bool> onLikeButtonTapped(bool isLiked) async{
    await likeFunction(course);
    return !isLiked;
  }


  @override
  Widget build(BuildContext context) {
    getStyles(course.id);
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      InkWell(
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
                              Icon(
                                Icons.folder_open_rounded,
                                color: black.withOpacity(0.3),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                course.students,
                                style: TextStyle(
                                  color: black.withOpacity(0.3),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_outlined,
                                color: black.withOpacity(0.3),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                course.time.toString() + ' min',
                                style: TextStyle(
                                  color: black.withOpacity(0.3),
                                ),
                              )
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
      ),
      Positioned(
        top: -10,
        left: 0,
        child: Container(
          height: 100,
          width: 100,
          child: SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                minimum: 0,
                maximum: 100,
                startAngle: 270,
                endAngle: 270,
                showLabels: false,
                showTicks: false,
                radiusFactor: 0.4,
                axisLineStyle: AxisLineStyle(
                    cornerStyle: CornerStyle.bothFlat,
                    color: Colors.black26,
                    dashArray: [10, 5],
                    thickness: 5),
                pointers: <GaugePointer>[
                  RangePointer(
                    value: course.progress.toDouble(),
                    cornerStyle: CornerStyle.bothFlat,
                    width: 5,
                    sizeUnit: GaugeSizeUnit.logicalPixel,
                    color: Colors.lightBlueAccent,
                  ),
                  MarkerPointer(
                    value: course.progress.toDouble(),
                    markerHeight: 20,
                    markerWidth: 20,
                    markerType: MarkerType.image,
                    imageUrl: 'assets/icons/star.png',
                    // borderColor: Colors.black12
                  )
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      angle: 90,
                      axisValue: 5,
                      positionFactor: 0.1,
                      widget: Text(
                          course.progress.toDouble().ceil().toString() + '%',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: secondary)))
                ])
          ]),
        ),
      ),
      Positioned(
          right: 30,
          bottom: 30,
          child: LikeButton(
            onTap:onLikeButtonTapped,
            size: 35,
            circleColor:
            CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
            bubblesColor: BubblesColor(
              dotPrimaryColor: Color(0xff33b5e5),
              dotSecondaryColor: Color(0xff0099cc),
            ),
            likeBuilder: (bool isLiked) {
              isLiked=course.fav;
              return Icon(
                Icons.favorite,
                color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                size: 30,
              );
            },
            // likeCount: 665,
            // countBuilder: (int count, bool isLiked, String text) {
            //   var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
            //   Widget result;
            //   if (count == 0) {
            //     result = Text(
            //       "love",
            //       style: TextStyle(color: color),
            //     );
            //   } else
            //     result = Text(
            //       text,
            //       style: TextStyle(color: color),
            //     );
            //   return result;
            // },
          ))
    ]);
  }
}
