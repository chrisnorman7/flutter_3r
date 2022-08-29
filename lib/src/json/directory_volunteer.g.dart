// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory_volunteer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectoryVolunteer _$DirectoryVolunteerFromJson(Map<String, dynamic> json) =>
    DirectoryVolunteer(
      id: json['id'] as int,
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$DirectoryVolunteerToJson(DirectoryVolunteer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
    };
