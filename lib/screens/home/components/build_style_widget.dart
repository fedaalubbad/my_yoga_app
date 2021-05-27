import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/core/db/models/style.dart';
import 'package:my_yoga_app/core/navigation_service/navigation_service.dart';
import 'package:my_yoga_app/screens/style_details/style_details.dart';

class BuildStylesWidgete extends StatelessWidget{
  Style style;
  String from;
  BuildStylesWidgete(this.style,this.from);

  goScreen() {
    NavigationService.navigationService
        .navigateToWidget(StyleDetails(style.id, style.name));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
          onTap: goScreen,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding / 2),
            child: Container(
              margin:
              EdgeInsets.only(top: appPadding * 3, bottom: appPadding * 2),
              width:this.from=='home'? size.width * 0.4:size.width,
              height: size.height * 0.2,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      topRight: Radius.circular(100.0)),
                  boxShadow: [
                    BoxShadow(
                        color: black.withOpacity(0.3),
                        blurRadius: 20.0,
                        offset: Offset(5, 15))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: appPadding / 2,
                        right: appPadding * 3,
                        top: appPadding),
                    child: Text(
                      style.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: appPadding / 2,
                        right: appPadding / 2,
                        bottom: appPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                              style.time.toString() + ' min',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: black.withOpacity(0.3)),
                              maxLines: 2,
                            ),
                          ],
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       color: primary,
                        //       borderRadius: BorderRadius.circular(5.0)),
                        //   child: Icon(
                        //     Icons.add,
                        //     color: white,
                        //   ),
                        // ),
                        Checkbox(checkColor:primary,value: style.completed,onChanged:(val){
                          // checkedFunction(taske);
                        },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            child: Image(
              width: size.width * 0.3,
              height: size.height * 0.2,
              image: AssetImage(style.imageUrl),
            ),
          ),
        )
      ],
    );
  }
}