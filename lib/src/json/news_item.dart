import 'package:json_annotation/json_annotation.dart';

part 'news_item.g.dart';

/// A single news item.
@JsonSerializable()
class NewsItem {
  /// Create an instance.
  const NewsItem({
    required this.id,
    required this.title,
    required this.body,
  });

  /// Create an instance from a JSON object.
  factory NewsItem.fromJson(final Map<String, dynamic> json) =>
      _$NewsItemFromJson(json);

  /// The ID of this news item.
  final int id;

  /// The title of this news item.
  final String title;

  /// The body of this news item.
  final String body;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$NewsItemToJson(this);
}
