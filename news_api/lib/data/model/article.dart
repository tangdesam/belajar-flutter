import 'dart:convert';

import 'package:news_api/data/model/source.dart';

class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"] == null ? 'null' : json["author"],
    title: json["title"] == null ? 'null' : json["title"],
    description: json["description"] == null ? 'null' : json["description"],
    url: json["url"] == null ? 'null' : json["url"],
    urlToImage: json["urlToImage"] == null ? 'null' : json["urlToImage"],
    publishedAt: json["publishedAt"] == null ? DateTime.parse('1900-01-01') : DateTime.parse(json["publishedAt"]),
    content: json["content"] == null ? 'null' : json["content"],
  );

  Map<String, dynamic> toJson() => {
    "source": source.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content == null ? null : content,
  };
}

List<Article> parseArticles(String? json) {
  if (json==null){
    return[];
  }
  final List parsed = jsonDecode(json);
  return parsed.map((json) => Article.fromJson(json)).toList();
}