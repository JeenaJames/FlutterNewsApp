class Article {
  String title;
  String author;
  String description;
  String urlToImage;
  DateTime publishedAt;
  String content;
  String articleUrl;
  bool status;

  Article(
      {this.title,
      this.description,
      this.author,
      this.content,
      this.publishedAt,
      this.urlToImage,
      this.articleUrl,
      this.status});
}
