import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/dbHelper.dart';
import 'package:my_yoga_app/core/db/models/style.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class StyleDetails extends StatelessWidget{
  String title;
  String id;
  Style _style;
  double progress=0;
  StyleDetails(this.id,this.title);

  getStyleDetails(String styleId) async {
    Style style = await DBHelper.dbHelper.getSpecificStyle(styleId);
    this._style = style;
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    getStyleDetails(this.id);
  return Scaffold(
    body: Column(
      children: [
       Row(
         children: [
           Container(
            child: Image(
              width: size.width * 0.3,
              height: size.height * 0.2,
              image: AssetImage(this._style.imageUrl),
            ),
      ),
           Column(
             children: [
               Text(_style.name),
               Text(_style.time),
             ],
           ),
         ],
       ),
        Container(
          height: 150,
          width: 150,
          child: SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                minimum: 0,
                maximum: 100,
                startAngle: 270,
                endAngle: 270,
                showLabels: false,
                showTicks: false,
                radiusFactor: 0.5,
                axisLineStyle: AxisLineStyle(
                    cornerStyle: CornerStyle.bothFlat,
                    color: Colors.black26,
                    dashArray: [10, 5],
                    thickness: 5),
                pointers: <GaugePointer>[
                  RangePointer(
                    value: progress,
                    cornerStyle: CornerStyle.bothFlat,
                    width: 5,
                    sizeUnit: GaugeSizeUnit.logicalPixel,
                    color: Colors.lightBlueAccent,
                  ),
                  MarkerPointer(
                    value: progress,
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
                         progress.ceil().toString() + '%',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: secondary)))
                ])
          ]),
        ),
    ]
    ),
  );
  }

}