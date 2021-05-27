import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/dbHelper.dart';
import 'package:my_yoga_app/core/db/models/style.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class StyleDetails extends StatefulWidget {
  Style _style;
  double progress = 0;

  StyleDetails(this._style);

  Timer _timer;

  @override
  State<StatefulWidget> createState() {
    return DttailsState();
  }
}

class DttailsState extends State<StyleDetails> {
  AnimationController _controller;

  void startTimer() {
    // const oneSec = const Duration(seconds: 1);
    //     widget._timer = new Timer.periodic(
    //      oneSec,
    //   (Timer timer) {
    //     widget.progress++;
    //     if (widget.progress == widget._style.time) {
    //       setState(() {
    //         completeStyle();
    //         timer.cancel();
    //       });
    //       // } else {
    //       //   setState(() {
    //       //     progress--;
    //       //   });
    //     }
    //   },
    // );
  }
  @override
  void dispose() {
    widget._timer.cancel();
    super.dispose();
  }

completeStyle()async{
    await DBHelper.dbHelper.completeStyle(widget._style);
}
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._style.name),
        backgroundColor: secondary,
      ),
      body: Column(children: [
        Row(
          children: [
            Container(
              child: Image(
                width: size.width * 0.3,
                height: size.height * 0.2,
                image: AssetImage(this.widget._style.imageUrl),
              ),
            ),
            Column(
              children: [
                Text(
                  widget._style.name,
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: appPadding / 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timer,
                      color: blueGrey,
                    ),
                    Text(
                      'duration: ',
                      style: TextStyle(
                          color: blueGrey,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: appPadding / 2,
                    ),
                    Text(
                      '${widget._style.time} minuts',
                      style: TextStyle(
                          color: secondary,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: startTimer,
              child: Text(
                'start',
                style: TextStyle(color: white),
              ),
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
                        value: widget.progress,
                        cornerStyle: CornerStyle.bothFlat,
                        width: 5,
                        sizeUnit: GaugeSizeUnit.logicalPixel,
                        color: Colors.lightBlueAccent,
                      ),
                      MarkerPointer(
                        value: widget.progress,
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
                          widget: Text(widget.progress.ceil().toString() + '%',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: secondary)))
                    ])
              ]),
            ),
          ],
        ),
      ]),
    );
  }
}
