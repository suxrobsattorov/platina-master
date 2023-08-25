class Post {
  final int count;
  final String next;
  final dynamic previous;
  final List<Result> results;

  Post({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  final int id;
  final Category category;
  final String title;
  final String shortDescription;
  final int relatesTo;
  final String description;
  final String slug;
  final bool authorOffered;
  final DateTime publish;
  final bool isPinned;
  final int numberOfViews;
  final String image;
  final String imageExtraLarge;
  final String imageLarge;
  final String imageMedium;
  final String imageSmall;
  final String imageSource;
  final String imageName;
  final List<dynamic> gallery;
  final dynamic shortUrl;
  final dynamic youtubeLink;
  final List<String> tags;
  final dynamic expiredAt;
  final String language;

  Result({
    required this.id,
    required this.category,
    required this.title,
    required this.shortDescription,
    required this.relatesTo,
    required this.description,
    required this.slug,
    required this.authorOffered,
    required this.publish,
    required this.isPinned,
    required this.numberOfViews,
    required this.image,
    required this.imageExtraLarge,
    required this.imageLarge,
    required this.imageMedium,
    required this.imageSmall,
    required this.imageSource,
    required this.imageName,
    required this.gallery,
    required this.shortUrl,
    required this.youtubeLink,
    required this.tags,
    required this.expiredAt,
    required this.language,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    category: Category.fromJson(json["category"]),
    title: json["title"],
    shortDescription: json["short_description"],
    relatesTo: json["relates_to"],
    description: json["description"],
    slug: json["slug"],
    authorOffered: json["author_offered"],
    publish: DateTime.parse(json["publish"]),
    isPinned: json["is_pinned"],
    numberOfViews: json["number_of_views"],
    image: json["image"],
    imageExtraLarge: json["image_extra_large"],
    imageLarge: json["image_large"],
    imageMedium: json["image_medium"],
    imageSmall: json["image_small"],
    imageSource: json["image_source"],
    imageName: json["image_name"],
    gallery: List<dynamic>.from(json["gallery"].map((x) => x)),
    shortUrl: json["short_url"],
    youtubeLink: json["youtube_link"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    expiredAt: json["expired_at"],
    language: json["language"]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category.toJson(),
    "title": title,
    "short_description": shortDescription,
    "relates_to": relatesTo,
    "description": description,
    "slug": slug,
    "author_offered": authorOffered,
    "publish": publish.toIso8601String(),
    "is_pinned": isPinned,
    "number_of_views": numberOfViews,
    "image": image,
    "image_extra_large": imageExtraLarge,
    "image_large": imageLarge,
    "image_medium": imageMedium,
    "image_small": imageSmall,
    "image_source": imageSource,
    "image_name": imageName,
    "gallery": List<dynamic>.from(gallery.map((x) => x)),
    "short_url": shortUrl,
    "youtube_link": youtubeLink,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "expired_at": expiredAt,
    "language": language,
  };
}

class Category {
  final int id;
  final String name;
  final String slug;
  final String color;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.color,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "color": color,
  };
}