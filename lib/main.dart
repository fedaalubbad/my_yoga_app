import 'package:flutter/material.dart';
import 'package:my_yoga_app/screens/splash/splash_screen.dart';
import 'core/navigation_service/navigation_service.dart';
import 'core/sp/sp_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SPHelper.spHelper.initSharedPrefences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigationService.navigatorKey,
      title: 'Yoga App',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      home: SplashScreen(),
    );
  }
}