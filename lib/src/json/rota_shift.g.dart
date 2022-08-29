// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rota_shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RotaShift _$RotaShiftFromJson(Map<String, dynamic> json) => RotaShift(
      id: json['id'] as int,
      started: DateTime.parse(json['start_datetime'] as String),
      duration: json['duration'] as int,
      allDay: json['all_day'] as bool,
      rota: RotaRota.fromJson(json['rota'] as Map<String, dynamic>),
      volunteers: (json['volunteers'] as List<dynamic>)
          .map((e) => RotaShiftVolunteer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RotaShiftToJson(RotaShift instance) => <String, dynamic>{
      'id': instance.id,
      'start_datetime': instance.started.toIso8601String(),
      'duration': instance.duration,
      'all_day': instance.allDay,
      'rota': instance.rota,
      'volunteers': instance.volunteers,
    };
