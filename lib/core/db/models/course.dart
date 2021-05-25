import '../dbHelper.dart';

class Course{
   String id;
   String imageUrl;
   String name;
   int time;
   String students;
   bool fav;
   int progress;

  Course({this.id,this.imageUrl,this.name,this.time,this.students,this.fav,this.progress});

  toJson() {

    return {
      DBHelper.courseIdColumnName: this.id,
      DBHelper.courseNameColumnName: this.name,
      DBHelper.courseImageUrlColumnName: this.imageUrl,
      DBHelper.courseTimeColumnName: this.time,
      DBHelper.courseStudentsColumnName: this.students,
      DBHelper.courseFavColumnName: this.fav?1:0,
      DBHelper.courseProgressColumnName: this.progress
    };
  }
  Course.fromMap(Map map) {
    this.id = map[DBHelper.courseIdColumnName];
    this.name = map[DBHelper.courseNameColumnName];
    this.imageUrl = map[DBHelper.courseImageUrlColumnName];
    this.time = map[DBHelper.courseTimeColumnName];
    this.students = map[DBHelper.courseStudentsColumnName];
    this.fav = map[DBHelper.courseFavColumnName]==1?true:false;
    this.progress = map[DBHelper.courseProgressColumnName];
  }
}