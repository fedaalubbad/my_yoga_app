import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:syncfusion\_flutter\_gauges/gauges.dart';


class Profile extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: appPadding *4),
         child: Center(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               CircleAvatar(radius:50,backgroundImage:AssetImage('assets/images/propic.jpeg')),
               SizedBox(height: appPadding/2,),
               Text('fedaa',style: TextStyle(color: Colors.black,fontSize: 18)),
               SizedBox(height: appPadding/2,),
               Text(' accountEmail@g.com',style: TextStyle(color: secondary,fontSize: 16),),
               SizedBox(height: appPadding/2,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                 Text('height: ',style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.bold)),
                 Text('170',style: TextStyle(color: Colors.teal,fontSize: 18)),
                 SizedBox(width: appPadding,),
                 Text('weight: ',style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.bold)),
                 Text('70',style: TextStyle(color: Colors.teal,fontSize: 18)),

               ],),

               SfRadialGauge(
                   axes: <RadialAxis>[
                     RadialAxis(minimum: 0,
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
                               value: 50,
                               cornerStyle: CornerStyle.bothFlat,
                               width: 12,
                               sizeUnit: GaugeSizeUnit.logicalPixel,
                               color:  Colors.orangeAccent,
                               gradient: const SweepGradient(
                                   colors: <Color>[
                                     primary,
                                     Colors.blueAccent
                                   ],
                                   stops: <double>[0.25, 0.75]
                               )),
                           MarkerPointer(
                               value: 50,
                               // enableDragging: true,
                               // onValueChanged:(v){},
                               markerHeight: 40,
                               markerWidth: 40,
                               markerType: MarkerType.image,
                               imageUrl: 'assets/icons/star.png',
                               // color: Color(0XFFFFAB40),
                               borderWidth: 2,
                               borderColor: Colors.white54
                           )
                         ],
                         annotations: <GaugeAnnotation>[
                           GaugeAnnotation(
                               angle: 90,
                               axisValue: 5,
                               positionFactor: 0.1,
                               widget: Text(50.ceil()
                                   .toString() + '%',
                                   style: TextStyle(
                                       fontSize: 50,
                                       fontWeight: FontWeight
                                           .bold,
                                       color: secondary
                                   ))
                           )
                         ]
                     )
                   ]
               )

             ],
           ),
         ),

     );
  }

}