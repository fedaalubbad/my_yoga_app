import '../dbHelper.dart';

class Style{
  String id;
  String imageUrl;
  String name;
  int time;
  String courseId;
  String completed;

  Style({this.id,this.imageUrl,this.name,this.time,this.courseId,this.completed});
  toJson() {
    return {
      DBHelper.styleIdColumnName: this.id,
      DBHelper.styleNameColumnName: this.name,
      DBHelper.styleImageUrlColumnName: this.imageUrl,
      DBHelper.styleTimeColumnName: this.time,
      DBHelper.styleCourseIdColumnName: this.courseId,
      DBHelper.styleCompletedColumnName: this.completed
    };
  }
  Style.fromMap(Map map) {
    this.id = map[DBHelper.styleIdColumnName];
    this.name = map[DBHelper.styleNameColumnName];
    this.imageUrl = map[DBHelper.styleImageUrlColumnName];
    this.time = map[DBHelper.styleTimeColumnName];
    this.courseId = map[DBHelper.styleCourseIdColumnName];
    this.completed = map[DBHelper.styleCompletedColumnName];
  }
}