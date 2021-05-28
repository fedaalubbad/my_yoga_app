import 'dart:io';
import 'package:my_yoga_app/core/db/models/course.dart';
import 'package:my_yoga_app/core/db/models/style.dart';
import 'package:my_yoga_app/core/navigation_service/navigation_service.dart';
import 'package:my_yoga_app/screens/home/home_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_yoga_app/core/sp/sp_helper.dart';
import 'models/user.dart';

class DBHelper {
  /////user
  static final String userTableName = 'Users';
  static final String userIdColumnName = 'userId';
  static final String userNameColumnName = 'userName';
  static final String userEmailColumnName = 'userEmail';
  static final String userPasswordColumnName = 'userPassword';
  static final String userImageColumnName = 'userImage';
  static final String userHeightColumnName = 'userHeight';
  static final String userWeightColumnName = 'userWeight';
  static final String userProgressColumnName = 'userProgress';

  /////product
  static final String productsTableName = 'Products';
  static final String productIdColumnName = 'productId';
  static final String productNameColumnName = 'productName';
  static final String productDescriptionColumnName = 'productDescription';
  static final String productCategoryColumnName = 'productCategory';
  static final String productImageColumnName = 'productImage';
  static final String productPriceColumnName = 'productPrice';

  ////////course
  static const String courseTableName = 'courses';
  static const String courseIdColumnName = 'courseId';
  static const String courseNameColumnName = 'courseName';
  static const String courseImageUrlColumnName = 'courseImageUrl';
  static const String courseTimeColumnName = 'courseTime';
  static const String courseStudentsColumnName = 'courseStudents';
  static const String courseProgressColumnName = 'courseProgress';
  static const String courseFavColumnName = 'courseFav';

  /////////style
  static final String styleTableName = 'styles';
  static final String styleIdColumnName = 'styleId';
  static final String styleNameColumnName = 'styleName';
  static final String styleImageUrlColumnName = 'styleImageUrl';
  static final String styleTimeColumnName = 'styleTime';
  static final String styleCourseIdColumnName = 'styleCourseId';
  static final String styleCompletedColumnName = 'styleCompleted';


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
      String databaseName = 'myYoga.db';
      String dbPath = appDocPath + '/$databaseName';
      Database database =
      await openDatabase(dbPath, version: 7, onCreate: (database, v) async {
        await database.execute(CourseTable);
        createUsersTable(database);
        // createCourseTable(database);
        createStylesTable(database);
        // createProductsTable(database);
      });
      return database;
    } catch (e) {
      return null;
    }
  }

  createUsersTable(Database database) async {
    await database.execute(
        '''CREATE TABLE $userTableName (
        $userIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT, 
        $userNameColumnName TEXT, 
        $userImageColumnName TEXT,
        $userEmailColumnName TEXT,
        $userPasswordColumnName TEXT,
        $userHeightColumnName DOUBLE,
        $userWeightColumnName DOUBLE,
        $userProgressColumnName DOUBLE
        );''');
  }
  createStylesTable(Database database) async {
    await database.execute(
        '''CREATE TABLE $styleTableName (
            $styleIdColumnName TEXT PRIMARY KEY, 
            $styleNameColumnName TEXT,
            $styleTimeColumnName TEXT,
            $styleImageUrlColumnName TEXT,
            $styleCompletedColumnName INTEGER,
            $styleCourseIdColumnName TEXT
              );''');
  }
  static const CourseTable = """CREATE TABLE IF NOT EXISTS $courseTableName (
            $courseIdColumnName TEXT PRIMARY KEY, 
            $courseNameColumnName TEXT,
            $courseImageUrlColumnName TEXT,
            $courseTimeColumnName INTEGER,
            $courseStudentsColumnName TEXT,
            $courseProgressColumnName INTEGER,
            $courseFavColumnName INTEGER
              );""";

  // createCourseTable(Database database) async {
  //   await database.execute(
  //       '''CREATE TABLE $courseTableName (
  //           $courseIdColumnName TEXT PRIMARY KEY,
  //           $courseNameColumnName TEXT,
  //           $courseImageUrlColumnName TEXT,
  //           $courseTimeColumnName INTEGER,
  //           $courseStudentsColumnName TEXT
  //           $courseProgressColumnName TEXT,
  //           $courseFavColumnName INTEGER
  //             );''');

  // static const StylesTable='''CREATE TABLE $styleTableName (
  //           $styleIdColumnName TEXT PRIMARY KEY,
  //           $styleNameColumnName TEXT,
  //           $styleTimeColumnName TEXT,
  //           $styleImageUrlColumnName TEXT,
  //           $styleCompletedColumnName INTEGER,
  //           $styleCourseIdColumnName TEXT
  //             );''';


  createProductsTable(Database database) async {
    await database.execute(
        '''CREATE TABLE $productsTableName (
          $productIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
          $productNameColumnName TEXT,
          $productDescriptionColumnName TEXT,
          $productCategoryColumnName TEXT,
          $productImageColumnName TEXT,
          $productPriceColumnName TEXT
         );''');
  }


  insertCourse(Course course) async {
    try {
      Database database = await initDatabase();
      await database.insert(courseTableName, course.toJson());
    } catch (e) {}
  }

  insertStyle(Style style) async {
    try {
      Database database = await initDatabase();
      await database.insert(styleTableName, style.toJson());
    } catch (e) {}
  }

  Future<List<Course>> getAllCourses() async {
    Database database = await initDatabase();
    List<Map<String, Object>> rows = await database.query(courseTableName);
    List<Course> courses = rows.map((e) => Course.fromMap(e)).toList();
    return courses;
  }

  //  Future<Course> getSpecialCourse(String id)async{
  //   Database database = await initDatabase();
  //   List<Map<String, Object>> maps = [];
  //   Course course;
  //   maps=await database.query(courseTableName,
  //       where: '$courseIdColumnName=?', whereArgs: [id]);
  //   course=Course.fromMap(maps.first);
  //   return course;
  // }
  Future<List<Course>> getFavCourses() async {
    Database database = await initDatabase();
    List<Map<String, Object>> maps = [];
    List<Course>courses;
    maps = await database.query(courseTableName,
        where: '$courseFavColumnName=?', whereArgs: [1]);
    courses = maps.map((e) => Course.fromMap(e)).toList();
    return courses;
  }

  Future<List<Style>> getStylesInCourse(String courseId) async {
    Database database = await initDatabase();
    List<Map<String, Object>> maps = [];
    List<Style> styles;
    maps = await database.query(styleTableName,
        where: '$styleCourseIdColumnName=?', whereArgs: [courseId]);
    styles = maps.map((e) => Style.fromMap(e)).toList();
    return styles;
  }

  Future<Style> getSpecificStyle(String id) async {
    Database database = await initDatabase();
    List<Map<String, Object>> maps = [];
    Style style;
    maps = await database.query(styleTableName,
        where: '$styleIdColumnName=?', whereArgs: [id]);
    style = Style.fromMap(maps.first);
    return style;
  }


  completeStyle(Style style) async {
    try {
      Database database = await initDatabase();
      style.completed = true;
      int updatedRows = await database.update(styleTableName, style.toJson(),
          where: '$styleIdColumnName = ?', whereArgs: [style.id]);
      print(updatedRows);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<bool> favCourse(Course course) async {
    try {
      Database database = await initDatabase();
      course.fav = !course.fav;
      int updatedRows = await database.update(courseTableName, course.toJson(),
          where: '$courseIdColumnName = ?', whereArgs: [course.id]);
      print(updatedRows);
      return course.fav;
    } on Exception catch (e) {
      print(e);
    }
  }

  updateCourseProgress(Course course, progress) async {
    try {
      Database database = await initDatabase();
      course.progress = progress;
      int updatedRows = await database.update(courseTableName, course.toJson(),
          where: '$courseIdColumnName = ?', whereArgs: [course.id]);
      print(updatedRows);
    } on Exception catch (e) {
      print(e);
    }
  }

  insertUser(User user) async {
    try {
      Database database = await initDatabase();
      User signUser=await getUser(user.email);
      if(signUser==null) {
        await database.insert(userTableName, user.toJson());
        SPHelper.spHelper.setUserEmail(user.email);
        SPHelper.spHelper.setUserName(user.name);
        SPHelper.spHelper.setUserImage(user.image);
        NavigationService.navigationService.navigateAndReplaceWidget(
            HomeScreen());
      }
      else{

      }
    } catch (e) {}
  }

  Future<User> getUser(String email) async {
    Database database = await initDatabase();
    List<Map<String, Object>> maps = [];
    User user;
    maps = await database.query(userTableName,
        where: '$userEmailColumnName=?', whereArgs: [email]);
    if (maps.isNotEmpty) {
      user = User.fromMap(maps.first);
      return user;
    }else{
      return null;
    }
  }

  Future<User> selectUser(String email, String password) async {
    Database database = await initDatabase();
    List<Map<String, Object>> maps = [];
    User user;
    maps = await database.query(userTableName,
        where: '$userEmailColumnName=?', whereArgs: [email]);
    if (maps.isNotEmpty) {
      user = User.fromMap(maps.first);
      if (user.password == password) {
        SPHelper.spHelper.setUserEmail(email);
        SPHelper.spHelper.setUserName(user.name);
        SPHelper.spHelper.setUserImage(user.image);
        NavigationService.navigationService
            .navigateAndReplaceWidget(HomeScreen());
        return user;
      } else {
        return null;
        print('wrong pass');
      }
    } else {
      return null;
      print('user not found');
    }
  }

  Future<void> cleanDatabase() async {
    try {
      Database database = await initDatabase();
      await database.transaction((txn) async {
        var batch = txn.batch();
        // batch.delete(courseTableName);
        batch.delete(styleTableName);

        await batch.commit();
      });
    } catch (error) {
      throw Exception('DbBase.cleanDatabase: ' + error.toString());
    }
  }
    Future<void> deleteTable() async {
      try {
        Database database = await initDatabase();
        database.delete(courseTableName);
        database.delete(styleTableName);
      } catch (error) {
        throw Exception('DbBase.cleanDatabase: ' + error.toString());
      }
    }

}
