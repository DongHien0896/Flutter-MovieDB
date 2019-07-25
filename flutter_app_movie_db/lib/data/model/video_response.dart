import 'video.dart';

class VideoResponse {
  final List<Video> videos;

  VideoResponse._({this.videos});

  factory VideoResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return VideoResponse._(
        videos: json['results'] != null
            ? List<Video>.from(json['result'].map((obj) => Video.fromJson(obj)))
            : null);
  }
}
