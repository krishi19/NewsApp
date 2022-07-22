class NewsModel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  NewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> data) {
    return NewsModel(
      author: data['author'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      url: data['url'] ?? '',
      urlToImage: data['urlToImage'] ?? '',
      publishedAt: data['publishedAt'] ?? '',
      content: data['content'] ?? '',
    );
  }
}
