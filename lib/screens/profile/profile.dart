import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/dbHelper.dart';
import 'package:my_yoga_app/core/db/models/user.dart';
import 'package:syncfusion\_flutter\_gauges/gauges.dart';

class Profile extends StatelessWidget {
  User user;
  double progress;
  Profile(this.user);
  getUserProgress()async{
   int completed= await DBHelper.dbHelper.getCompletedCourses();
   progress= completed.toDouble()*10;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: double.infinity,
              color: primary,
              child: Padding(
                padding: const EdgeInsets.only(top: appPadding * 4),
                child: Column(
                  children: [
                    Container(
                      decoration: new BoxDecoration(
                        color: secondary,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(appPadding / 20),
                        child: Container(
                          decoration: new BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(appPadding / 8),
                            child: Center(
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage(
                                  user.image,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: appPadding / 2,
                    ),
                    Text(user.name,
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                    SizedBox(
                      height: appPadding / 2,
                    ),
                    Text(
                      user.email,
                      style: TextStyle(color: secondary, fontSize: 16),
                    ),
                    SizedBox(
                      height: appPadding / 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('height: ',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        Text(user.height.toString(),
                            style: TextStyle(color: Colors.teal, fontSize: 18)),
                        SizedBox(
                          width: appPadding,
                        ),
                        Text('weight: ',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        Text(user.weight.toString(),
                            style: TextStyle(color: Colors.teal, fontSize: 18)),
                      ],
                    ),
                    SizedBox(
                      height: appPadding / 2,
                    ),
                  ],
                ),
              )),
          SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                minimum: 0,
                maximum: 100,
                startAngle: 270,
                endAngle: 270,
                showLabels: false,
                showTicks: false,
                radiusFactor: 0.6,
                axisLineStyle: AxisLineStyle(
                    cornerStyle: CornerStyle.bothFlat,
                    color: Colors.black12,
                    thickness: 12),
                pointers: <GaugePointer>[
                  RangePointer(
                      value: user.progress,
                      cornerStyle: CornerStyle.bothFlat,
                      width: 12,
                      sizeUnit: GaugeSizeUnit.logicalPixel,
                      color: Colors.orangeAccent,
                      gradient: const SweepGradient(
                          colors: <Color>[primary, Colors.blueAccent],
                          stops: <double>[0.25, 0.75])),
                  MarkerPointer(
                      value: user.progress,
                      // enableDragging: true,
                      // onValueChanged:(v){},
                      markerHeight: 40,
                      markerWidth: 40,
                      markerType: MarkerType.image,
                      imageUrl: 'assets/icons/star.png',
                      // color: Color(0XFFFFAB40),
                      borderWidth: 2,
                      borderColor: Colors.white54)
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      angle: 90,
                      axisValue: 5,
                      positionFactor: 0.1,
                      widget: Text(user.progress.ceil().toString() + '%',
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: secondary)))
                ])
          ])
        ],
      ),
    );
  }
}
