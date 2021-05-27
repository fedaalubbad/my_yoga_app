import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/models/style.dart';
import 'package:my_yoga_app/data/data.dart';

import 'build_style_widget.dart';


class DiffStyles extends StatelessWidget {
  List<Style>styles;

  DiffStyles(this.styles);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: appPadding, vertical: appPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'For Beginners',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w800, color: primary),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: appPadding / 2),
          child: Container(
            height: size.height * 0.33,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                // itemCount: styles.length,
                itemCount: styles.length,
                itemBuilder: (BuildContext context, int index) {
                  return BuildStylesWidgete(styles[index],'home');
                }),
          ),
        )
      ],
    );
  }
}
