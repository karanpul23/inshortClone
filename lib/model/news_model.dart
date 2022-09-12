// Package imports:
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'dart:convert';

part 'news_model.g.dart';

class NewsModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsModel(
      {required this.status,
      required this.totalResults,
      required this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = List.empty(growable: true);
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    data['articles'] = articles!.map((v) => v.toJson()).toList();
    return data;
  }
}

@HiveType(typeId: 101)
class Articles {
  @HiveField(0)
  late String? sourceName;
  @HiveField(1)
  late String? author;
  @HiveField(2)
  late String? title;
  @HiveField(3)
  late String? description;
  @HiveField(4)
  late String? url;
  @HiveField(5)
  late String? urlToImage;
  @HiveField(6)
  late String? publishedAt;
  @HiveField(7)
  late String? content;

  Articles(
      {this.sourceName,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    sourceName =
        (json['source'] != null ? Source.fromJson(json['source']).name : null)!;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sourceName != null) {
      data['sourceName'] = sourceName;
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

class Source extends Equatable {
  late String? id;
  late String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  @override
  List<Object?> get props => [id, name];
}
