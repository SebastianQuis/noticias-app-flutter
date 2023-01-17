// To parse this JSON data, do
//
//     final noticiasResponse = noticiasResponseFromJson(jsonString);

import 'dart:convert';

NoticiasResponse noticiasResponseFromJson(String str) => NoticiasResponse.fromJson(json.decode(str));

String noticiasResponseToJson(NoticiasResponse data) => json.encode(data.toJson());

class NoticiasResponse {
    NoticiasResponse({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    String status;
    int totalResults;
    List<Article> articles;

    factory NoticiasResponse.fromJson(Map<String, dynamic> json) => NoticiasResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class Article {
    Article({
        required this.source,
        this.author,
        required this.title,
        this.description,
        required this.url,
        this.urlToImage,
        required this.publishedAt,
        this.content,
    });

    Source source;
    String? author;
    String title;
    String? description;
    String url;
    String? urlToImage;
    DateTime publishedAt;
    String? content;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? 'no autor',
        title: json["title"],
        description: json["description"] ?? 'no description',
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? 'sin content',
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
    };
}

class Source {
    Source({
        this.id,
        required this.name,
    });

    String? id;
    String name;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] ?? 'no id',
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

enum Id { LA_NACION, GOOGLE_NEWS, INFOBAE }

final idValues = EnumValues({
    "google-news": Id.GOOGLE_NEWS,
    "infobae": Id.INFOBAE,
    "la-nacion": Id.LA_NACION
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        reverseMap ??= map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
