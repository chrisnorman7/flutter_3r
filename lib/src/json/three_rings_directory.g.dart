// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'three_rings_directory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThreeRingsDirectory _$ThreeRingsDirectoryFromJson(Map<String, dynamic> json) =>
    ThreeRingsDirectory(
      volunteers: (json['volunteers'] as List<dynamic>)
          .map((e) => DirectoryVolunteer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ThreeRingsDirectoryToJson(
        ThreeRingsDirectory instance) =>
    <String, dynamic>{
      'volunteers': instance.volunteers,
    };
