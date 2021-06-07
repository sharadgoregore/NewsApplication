import 'package:newsapp/models/newsmode.dart';

class Newsdetail{
  NewsData data;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  Newsdetail({this.author,this.content,this.data,this.description,this.publishedAt,this.title,this.url,this.urlToImage,});


  factory Newsdetail.fromJson(Map<String,dynamic> json){
    return Newsdetail(
    data: NewsData.fromjson(json['data']),
    author: json['author'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    url: json['url'] as String,
    urlToImage: json['urlToImage'] as String,
    publishedAt: json['publishedAt'] as String,
    content: json['content'] as String,
    );
  }
}