// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'three_rings_news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThreeRingsNews _$ThreeRingsNewsFromJson(Map<String, dynamic> json) =>
    ThreeRingsNews(
      items: (json['news_items'] as List<dynamic>)
          .map((e) => NewsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ThreeRingsNewsToJson(ThreeRingsNews instance) =>
    <String, dynamic>{
      'news_items': instance.items,
    };
