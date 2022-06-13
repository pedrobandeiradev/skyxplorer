class AstronomyPictureOfTheDay {
  final String title;
  final String explanation;
  final String mediaType;
  final String date;
  final String url;
  final String? thumbnailUrl;

  AstronomyPictureOfTheDay({
    required this.title,
    required this.explanation,
    required this.mediaType,
    required this.date,
    required this.url,
    this.thumbnailUrl,
  });

  factory AstronomyPictureOfTheDay.fromMap(Map<String, dynamic> json) =>
      AstronomyPictureOfTheDay(
        title: json['title'],
        explanation: json['explanation'],
        mediaType: json['media_type'],
        date: json['date'],
        url: json['url'],
        thumbnailUrl: json['thumbnail_url'] ?? '',
      );
}
