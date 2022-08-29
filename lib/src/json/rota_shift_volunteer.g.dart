// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rota_shift_volunteer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RotaShiftVolunteer _$RotaShiftVolunteerFromJson(Map<String, dynamic> json) =>
    RotaShiftVolunteer(
      id: json['id'] as int,
      volunteer: VolunteerReference.fromJson(
          json['volunteer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RotaShiftVolunteerToJson(RotaShiftVolunteer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'volunteer': instance.volunteer,
    };
