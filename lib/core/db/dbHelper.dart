import 'dart:io';
import 'package:my_yoga_app/core/db/models/course.dart';
import 'package:my_yoga_app/core/navigation_service/navigation_service.dart';
import 'package:my_yoga_app/screens/home/home_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_yoga_app/core/sp/sp_helper.dart';
import 'models/user.dart';

class DBHelper {
  /////user
  static final String usertableName = 'Users';
  static final String userNameColumnName = 'userName';
  static final String userPasswordColumnName = 'userPassword';
  /////product
  static final String productstableName = 'Products';
  static final String productIdColumnName = 'productId';
  static final String productNameColumnName = 'productName';
  static final String productDescriptionColumnName = 'productDescription';
  static final String productCategoryColumnName = 'productCategory';
  static final String productImageColumnName = 'productImage';
  static final String productPriceColumnName = 'productPrice';
  ////////course
  static final String coursetableName = 'course';
  static final String courseIdColumnName = 'courseId';
  static final String courseNameColumnName= 'courseName';
  static final String courseImageUrlColumnName= 'courseImageUrl';
  static final String courseTimeColumnName= 'courseTime';
  static final String courseStudentsColumnName= 'courseStudents';

  DBHelper._();
  static DBHelper dbHelper = DBHelper._();
  Database x; // save connection with database

  Future<Database> initDatabase() async {
    if (x != null) {
      return x;
    } else {
      x = await createConnectionWithDatabase();
      return x;
    }
  }

  Future<Database> createConnectionWithDatabase() async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      String databaseName = 'ecommerce.db';
      String dbPath = appDocPath + '/$databaseName';
      Database database =
      await openDatabase(dbPath, version: 1, onCreate: (database, v) {
        createUsersTable(database);
        createProductsTable(database);
      });
      return database;
    } catch (e) {
      return null;
    }
  }

  createUsersTable(Database database) async {
    database.execute(
        '''CREATE TABLE $usertableName (
        $userNameColumnName TEXT PRIMARY KEY, 
        $userPasswordColumnName TEXT
        )''');
  }
  createCourseTable(Database database) async {
    database.execute(
        '''CREATE TABLE $coursetableName (
            '$courseIdColumnName TEXT PRIMARY KEY, 
            '$courseNameColumnName TEXT,
            '$courseImageUrlColumnName TEXT,
            '$courseTimeColumnName TEXT,
            '$courseStudentsColumnName TEXT
              )''');
  }

  createProductsTable(Database database) async {
    database.execute('''CREATE TABLE $productstableName (
          $productIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
          $productNameColumnName TEXT,
          $productDescriptionColumnName TEXT,
          $productCategoryColumnName TEXT,
          $productImageColumnName TEXT,
          $productPriceColumnName TEXT
         )''');
  }

  insertUser(User user) async {
    try {
      Database database = await initDatabase();
      await database.insert(usertableName, user.toJson());
      SPHelper.spHelper.setUserEmail(user.email);
      NavigationService.navigationService.navigateAndReplaceWidget(HomeScreen());
    } catch (e) {}
  }
  insertCourse(Course course) async {
    try {
      Database database = await initDatabase();
      await database.insert(courseIdColumnName, course.toJson());
    } catch (e) {}
  }
 getAllCourses(){


 }
  Future<Course> getSpecialCourse(String id)async{
   Database database = await initDatabase();
   List<Map<String, Object>> maps = [];
   Course course;
   maps=await database.query(coursetableName,
       where: '$courseIdColumnName=?', whereArgs: [id]);
   course=Course.fromMap(maps.first);
   return course;
 }

  Future<User> selectUser(String email, String password) async {
    Database database = await initDatabase();
    List<Map<String, Object>> maps = [];
    User user;
    maps = await database.query(usertableName,
        where: '$userNameColumnName=?', whereArgs: [email]);
    if (maps.isNotEmpty) {
      user = User.fromMap(maps.first);
      if (user.password == password) {
        SPHelper.spHelper.setUserEmail(email);
        NavigationService.navigationService
            .navigateAndReplaceWidget(HomeScreen());
      } else {
        return null;
        print('wrong pass');
      }
    } else {
      return null;
      print('user not found');
    }
  }
}
