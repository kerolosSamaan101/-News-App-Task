class News {
  final String title;
  final String description;
  final String imageUrl;
  final DateTime date;
  final String url;

  News({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
    required this.url,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? 'No title',
      description: json['description'] ?? 'No description',
      imageUrl: json['urlToImage'] ?? '',
      date: DateTime.tryParse(json['publishedAt'] ?? '') ?? DateTime.now(),
      url: json['url'] ?? '',
    );
  }
}

abstract class NewsState {}

class InitialState extends NewsState {}

class Loading extends NewsState {}

class AppearedNews extends NewsState {
  final List<News> news;
  AppearedNews(this.news);
}

class NewsError extends NewsState {
  final String msg;
  NewsError(this.msg);
}

class NewsChoosed extends NewsState {
  final News news;
  NewsChoosed(this.news);
}
