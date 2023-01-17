import 'dart:convert';

class NoticiasResponse {
    NoticiasResponse({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    String? status;
    int? totalResults;
    List<Article?>? articles;

    factory NoticiasResponse.fromRawJson(String str) => NoticiasResponse.fromJson(json.decode(str));

    factory NoticiasResponse.fromJson(Map<String, dynamic> json) => NoticiasResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: json["articles"] == null ? [] : List<Article?>.from(json["articles"]!.map((x) => Article.fromJson(x))),
    );
}

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

    Source? source;
    String? author;
    String? title;
    String? description;
    String? url;
    String? urlToImage;
    DateTime? publishedAt;
    String? content;

    factory Article.fromRawJson(String str) => Article.fromJson(json.decode(str));

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );
}

class Source {
    Source({
        required this.id,
        required this.name,
    });

    Id? id;
    String? name;

    factory Source.fromRawJson(String str) => Source.fromJson(json.decode(str));

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );
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
