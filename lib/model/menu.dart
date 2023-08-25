class Menu {
  final String name;
  final String slug;
  final String color;
  final int order;
  final String link;
  final String language;

  Menu({
    required this.name,
    required this.slug,
    required this.color,
    required this.order,
    required this.link,
    required this.language,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    name: json["name"],
    slug: json["slug"],
    color: json["color"],
    order: json["order"],
    link: json["link"],
    language: json["language"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "slug": slug,
    "color": color,
    "order": order,
    "link": link,
    "language": language,
  };
}