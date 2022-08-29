// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rota_shifts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RotaShifts _$RotaShiftsFromJson(Map<String, dynamic> json) => RotaShifts(
      shifts: (json['shifts'] as List<dynamic>)
          .map((e) => RotaShift.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RotaShiftsToJson(RotaShifts instance) =>
    <String, dynamic>{
      'shifts': instance.shifts,
    };
