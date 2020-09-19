import 'package:meta/meta.dart';

class Post {

  final String title, type, imagePath;
  final List subreddits;
  final bool schedule;


  Post({
    @required this.title,
    @required this.type,
    @required this.imagePath,
    @required this.subreddits,
    @required this.schedule,
  });

  Map<String, dynamic> toJson() =>
      {
        'title': title,
        'imagePath': imagePath,
        'subreddits': subreddits,
        'schedule': schedule,
      };

  String getTitle() {
    return title;
  }

  String getImagePath() {
    return imagePath;
  }

  List getSubreddits() {
    return subreddits;
  }

  bool getSchedule() {
    return schedule;
  }

}