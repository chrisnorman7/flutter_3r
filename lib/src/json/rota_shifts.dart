import 'package:json_annotation/json_annotation.dart';

import 'rota_shift.dart';

part 'rota_shifts.g.dart';

/// A collection of [shifts].
@JsonSerializable()
class RotaShifts {
  /// Create an instance.
  const RotaShifts({
    required this.shifts,
  });

  /// Create an instance from a JSON object.
  factory RotaShifts.fromJson(final Map<String, dynamic> json) =>
      _$RotaShiftsFromJson(json);

  /// The shifts to show.
  final List<RotaShift> shifts;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$RotaShiftsToJson(this);
}
