import '../dbHelper.dart';

class Course{
   String id;
   String imageUrl;
   String name;
   int time;
   String students;

  Course({this.id,this.imageUrl,this.name,this.time,this.students});

  toJson() {
    return {
      DBHelper.courseIdColumnName: this.id,
      DBHelper.courseNameColumnName: this.name,
      DBHelper.courseImageUrlColumnName: this.imageUrl,
      DBHelper.courseTimeColumnName: this.time,
      DBHelper.courseStudentsColumnName: this.students
    };
  }
  Course.fromMap(Map map) {
    this.id = map[DBHelper.courseIdColumnName];
    this.name = map[DBHelper.courseNameColumnName];
    this.imageUrl = map[DBHelper.courseImageUrlColumnName];
    this.time = map[DBHelper.courseTimeColumnName];
    this.students = map[DBHelper.courseStudentsColumnName];
  }
}