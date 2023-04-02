import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    required this.categories,
  });

  List<Category> categories;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    required this.name,
    required this.videos,
  });

  String name;
  List<Video> videos;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["name"],
    videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
  };
}

class Video {
  Video({
    required this.description,
    required this.sources,
    required this.subtitle,
    required this.thumb,
    required this.title,
  });

  String description;
  List<String> sources;
  String subtitle;
  String thumb;
  String title;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    description: json["description"],
    sources: List<String>.from(json["sources"].map((x) => x)),
    subtitle: json["subtitle"],
    thumb: json["thumb"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "sources": List<dynamic>.from(sources.map((x) => x)),
    "subtitle": subtitle,
    "thumb": thumb,
    "title": title,
  };
}
