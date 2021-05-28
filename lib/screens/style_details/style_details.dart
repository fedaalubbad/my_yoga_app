import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/dbHelper.dart';
import 'package:my_yoga_app/core/db/models/style.dart';
import 'package:my_yoga_app/global/progress_painter.dart';

class StyleDetails extends StatefulWidget {
  Style style;
  Function updateCourseProgress,completeStyle;
  StyleDetails(this.style,this.updateCourseProgress,this.completeStyle);
  @override
  _StyleDetailsState createState() {
    return _StyleDetailsState();
  }
}

class _StyleDetailsState extends State<StyleDetails> with SingleTickerProviderStateMixin {
  double _percentage;
  double _nextPercentage;
  Timer _timer;
  AnimationController _progressAnimationController;
  bool _progressDone;

  @override
  initState() {
    super.initState();
    _percentage = 0.0;
    _nextPercentage = 0.0;
    _timer = null;
    _progressDone = false;
    initAnimationController();
  }

  initAnimationController() {
    _progressAnimationController = AnimationController(vsync:this,
      duration: Duration(milliseconds: 1000),
    )..addListener(
          () {
        setState(() {
          _percentage = lerpDouble(_percentage, _nextPercentage,
              _progressAnimationController.value);
        });
      },
    );
  }

  start() {
   int time =(((int.parse(widget.style.time))*10) / 2).floor();
    Timer.periodic(Duration(milliseconds: time), handleTicker);
  }

  handleTicker(Timer timer) {
    _timer = timer;
    if (_nextPercentage < 100) {
      publishProgress();
    } else {
      timer.cancel();
      setState(() {
        _progressDone = true;
        if(!widget.style.completed) {
          print('completedS ${widget.style.completed}');
          widget.updateCourseProgress(widget.style);
        }
        widget.completeStyle(widget.style);
      });
    }
  }

  startProgress() {
    if (null != _timer && _timer.isActive) {
      _timer.cancel();
    }
    setState(() {
      _percentage = 0.0;
      _nextPercentage = 0.0;
      _progressDone = false;
      start();
    });
  }

  publishProgress() {
    setState(() {
      _percentage = _nextPercentage;
      _nextPercentage += 0.5;
      if (_nextPercentage > 100.0) {
        _percentage = 0.0;
        _nextPercentage = 0.0;
      }
      _progressAnimationController.forward(from: 0.0);
    });
  }

  getDoneImage() {
    return Image.asset(
      "assets/images/yoga-pose.png",
      width: 60,
      height: 60,
    );
  }

  getProgressText() {
    return Text(
      _nextPercentage == 0 ? '0' : '${_nextPercentage.toInt()}',
      style: TextStyle(
          fontSize: 40, fontWeight: FontWeight.w800, color: Colors.green),
    );
  }

  progressView() {
    return CustomPaint(
      child: Center(
        child: _progressDone ? getDoneImage() : getProgressText(),
      ),
      foregroundPainter: ProgressPainter(
          defaultCircleColor: primary,
          percentageCompletedCircleColor: secondary,
          completedPercentage: _percentage,
          circleWidth: 30.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.style.name),
        backgroundColor: secondary,
      ),
      body: Column(children: [
        Row(
          children: [
            Container(
              child: Image(
                width: size.width * 0.3,
                height: size.height * 0.2,
                image: AssetImage(this.widget.style.imageUrl),
              ),
            ),
            Column(
              children: [
                Text(
                  widget.style.name,
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
                      '${widget.style.time} minuts',
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
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 160.0,
                    width: 160.0,
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(30.0),
                    child: progressView(),
                  ),
                  OutlineButton(
                    child: Text("START"),
                    onPressed: () {
                      startProgress();
                    },
                  )
                ],
    ),
            ),
          ],
        ),
      ]),
    );
  }
}
