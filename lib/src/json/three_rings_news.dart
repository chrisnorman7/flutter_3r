import 'package:json_annotation/json_annotation.dart';

import 'news_item.dart';

part 'three_rings_news.g.dart';

/// A list of news items.
@JsonSerializable()
class ThreeRingsNews {
  /// Create an instance.
  const ThreeRingsNews({
    required this.items,
  });

  /// Create an instance from a JSON object.
  factory ThreeRingsNews.fromJson(final Map<String, dynamic> json) =>
      _$ThreeRingsNewsFromJson(json);

  /// the downloaded news articles.
  @JsonKey(name: 'news_items')
  final List<NewsItem> items;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ThreeRingsNewsToJson(this);
}
