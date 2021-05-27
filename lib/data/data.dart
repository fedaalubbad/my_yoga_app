import 'package:my_yoga_app/core/db/models/course.dart';
import 'package:my_yoga_app/core/db/models/style.dart';

final _standStyle = Style(
  imageUrl: 'assets/images/pose2.png',
  name: 'Standing Style',
  time: '5',
  courseId:'2',
  completed:false,
);
final _sittingStyle = Style(
  imageUrl: 'assets/images/pose1.png',
  name: 'Sitting Style',
  time: '8',
  courseId:'2',
  completed:false,
);
final _legCrossStyle = Style(
  imageUrl: 'assets/images/pose3.png',
  name: 'Leg Cross Style',
  time: '6',
  courseId:'2',
  completed:false,
);

final List<Style>styles = [_standStyle,_sittingStyle,_legCrossStyle];

final _course1 = Course(
    id: '1',
    imageUrl: 'assets/images/course1.jpg',
    name: 'Advance Stretchings',
    time: 45,
    students: 'Advanced',
    fav:false,
    progress: 0,

);

final _course3 = Course(
  id: "2",
    imageUrl: 'assets/images/course3.jpg',
    name: 'Meditation',
    time: 20,
    students: 'Beginner',
    fav:false,
    progress: 0,
);

final _course2 = Course(
    id: "3",
    imageUrl: 'assets/images/course2.jpg',
    name: 'Daily Yoga',
    time: 30,
    students: 'Intermediate',
    fav:false,
    progress: 0,
);
final _course4 = Course(
    id: "4",
    imageUrl: 'assets/images/pic1.jpg',
    name: 'Daily Yoga',
    time: 30,
    students: 'Intermediate',
    fav:true,
    progress: 0,
);
final _course5 = Course(
    id: "4",
    imageUrl: 'assets/images/pic2.jpg',
    name: 'Daily Yoga',
    time: 30,
    students: 'Intermediate',
    fav:true,
    progress: 0,
);
final _course6 = Course(
    id: "4",
    imageUrl: 'assets/images/pic3.jpg',
    name: 'Daily Yoga',
    time: 30,
    students: 'Intermediate',
    fav:true,
    progress: 0,
);

final List<Course> courses = [_course1,_course2,_course3,_course4,_course5,_course6];