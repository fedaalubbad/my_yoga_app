import 'package:my_yoga_app/core/db/models/course.dart';
import 'package:my_yoga_app/core/db/models/style.dart';

final _standStyle = Style(
  id: '1',
  imageUrl: 'assets/images/pose2.png',
  name: 'Standing Style',
  time: '5',
  courseId:'2',
  completed:false,
);
final _sittingStyle = Style(
  id: '2',
  imageUrl: 'assets/images/pose1.png',
  name: 'Sitting Style',
  time: '8',
  courseId:'2',
  completed:false,
);
final _legCrossStyle = Style(
  id: '3',
  imageUrl: 'assets/images/pose3.png',
  name: 'Leg Cross Style',
  time: '6',
  courseId:'2',
  completed:false,
);
final _standStyle2 = Style(
  id: '4',
  imageUrl: 'assets/images/pose2.png',
  name: 'Standing Style',
  time: '5',
  courseId:'2',
  completed:false,
);

final _sittingStyle3 = Style(
  id: '5',
  imageUrl: 'assets/images/pose1.png',
  name: 'Sitting Style',
  time: '9',
  courseId:'2',
  completed:false,
);

final _legCrossStyle4 = Style(
  id: '6',
  imageUrl: 'assets/images/pose3.png',
  name: 'Leg Cross Style',
  time: '10',
  courseId:'2',
  completed:false,
);

final _BoundAnglePose = Style(
  id: '7',
  imageUrl: 'assets/gif/BoundAnglePose.gif',
  name: 'Bound Angle Pose',
  time: '10',
  courseId:'5',
  completed:false,
);

final _NearWarpedKagu= Style(
  id: '8',
  imageUrl: 'assets/gif/NearWarpedKagu.gif',
  name: 'Near Warped Kagu',
  time: '10',
  courseId:'5',
  completed:false,
);

final _SoreParallelGecko= Style(
  id: '9',
  imageUrl: 'assets/gif/SoreParallelGecko.gif',
  name: 'Sore Parallel Gecko',
  time: '10',
  courseId:'5',
  completed:false,
);

final _FocusedBoringCrocodile= Style(
  id: '10',
  imageUrl: 'assets/gif/FocusedBoringCrocodile.gif',
  name: 'Focused Boring Crocodile',
  time: '10',
  courseId:'5',
  completed:false,
);
final _BiodegradableLankyEagle= Style(
  id: '11',
  imageUrl: 'assets/gif/BiodegradableLankyEagle.gif',
  name: 'Biodegradable Lanky Eagle',
  time: '10',
  courseId:'5',
  completed:false,
);

final List<Style>styles = [_standStyle,_sittingStyle,_legCrossStyle,_standStyle2,_sittingStyle3,_legCrossStyle4,];

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
  fav:false,
    progress: 0,
);

final _course6 = Course(
    id: "5",
    imageUrl: 'assets/images/pic4.jpeg',
    name: 'relaxation exercises ',
    time: 30,
    students: 'Intermediate',
    fav:false,
    progress: 0,
);
// final _course7 = Course(
//     id: "7",
//     imageUrl: 'assets/images/pic3.jpg',
//     name: 'relaxation exercises ',
//     time: 30,
//     students: 'Intermediate',
//     fav:true,
//     progress: 0,
// );

// final List<Course> courses = [_course1,_course2,_course3,_course4,_course5,_course6];
final List<Course> courses = [_course6];