import 'package:my_yoga_app/core/db/models/course.dart';
import 'package:my_yoga_app/core/db/models/style.dart';

final _standStyle = Style(
  imageUrl: 'assets/images/pose2.png',
  name: 'Standing Style',
  time: 5,
  courseId:'2',
  completed:0,
);
final _sittingStyle = Style(
  imageUrl: 'assets/images/pose1.png',
  name: 'Sitting Style',
  time: 8,
  courseId:'2',
  completed:0,
);
final _legCrossStyle = Style(
  imageUrl: 'assets/images/pose3.png',
  name: 'Leg Cross Style',
  time: 6,
  courseId:'2',
  completed:0,
);

final List<Style>styles = [_standStyle,_sittingStyle,_legCrossStyle];

final _course1 = Course(
    id: '1',
    imageUrl: 'assets/images/course1.jpg',
    name: 'Advance Stretchings',
    time: 45,
    students: 'Advanced',
    fav:0,
    progress: '0',

);

final _course3 = Course(
  id: "2",
    imageUrl: 'assets/images/course3.jpg',
    name: 'Meditation',
    time: 20,
    students: 'Beginner',
    fav:0,
    progress: '0',
);
final _course2 = Course(
    id: "3",
    imageUrl: 'assets/images/course2.jpg',
    name: 'Daily Yoga',
    time: 30,
    students: 'Intermediate',
    fav:0,
    progress: '0',
);

final List<Course> courses = [_course1,_course3,_course2];