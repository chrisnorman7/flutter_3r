import 'package:json_annotation/json_annotation.dart';

import 'rota_rota.dart';
import 'rota_shift_volunteer.dart';

part 'rota_shift.g.dart';

/// A shift on the rota.
@JsonSerializable()
class RotaShift {
  /// Create an instance.
  const RotaShift({
    required this.id,
    required this.started,
    required this.duration,
    required this.allDay,
    required this.rota,
    required this.volunteers,
  });

  /// Create an instance from a JSON object.
  factory RotaShift.fromJson(final Map<String, dynamic> json) =>
      _$RotaShiftFromJson(json);

  /// The ID of this shift.
  final int id;

  /// The time this shift starts.
  @JsonKey(name: 'start_datetime')
  final DateTime started;

  /// The duration of this shift in seconds.
  final int duration;

  /// The time this shift ends.
  DateTime get ends => started.add(Duration(seconds: duration));

  /// Whether or not this shift is an all day shift.
  @JsonKey(name: 'all_day')
  final bool allDay;

  /// The rota this shift is part of.
  final RotaRota rota;

  /// The title of this shift.
  String get title => rota.name;

  /// The volunteers on this shift.
  final List<RotaShiftVolunteer> volunteers;

  /// Convert this instance to JSON.
  Map<String, dynamic> toJson() => _$RotaShiftToJson(this);
}
