import 'package:my_yoga_app/core/navigation_service/navigation_service.dart';
import 'package:my_yoga_app/screens/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  SPHelper._();
  static SPHelper spHelper = SPHelper._();
  SharedPreferences sharedPreferences;
  Future<SharedPreferences> initSharedPrefences() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences;
    } else {
      return sharedPreferences;
    }
  }

  setUserEmail(String email) {
    sharedPreferences.setString('email', email);
  }
  setUserImage(String image){
    sharedPreferences.setString('image', image);

  }
  setUserName(String name){
    sharedPreferences.setString('name', name);
  }
  String getUserImage(){
    var image = sharedPreferences.get('image');
    return image;
  }

  String getUserName(){
    var name = sharedPreferences.get('name');
    return name;
  }

  String getEmail(){
    var email = sharedPreferences.get('email');
     return email;
  }
  bool getUserEmail(String email) {
    var email = sharedPreferences.get('email');
    if (email == null) {
      return false;
    } else {
      return true;
    }
  }

  logOut() async {
    await sharedPreferences.clear();
    NavigationService.navigationService
        .navigateAndReplaceWidget(SplashScreen());
  }
  setDataInSharedPreference(){
    sharedPreferences.setBool('firstOpen', true);
  }

  bool getDataFromSharedPreference(){

    bool firstOpen=sharedPreferences.getBool('firstOpen') == null?? false;
    return firstOpen;
  }

  deleteValue(){
    sharedPreferences.remove('firstOpen');
  }
}