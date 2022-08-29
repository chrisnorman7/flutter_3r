import 'package:json_annotation/json_annotation.dart';

import 'volunteer_reference.dart';

part 'rota_shift_volunteer.g.dart';

/// A volunteer on a shift.
@JsonSerializable()
class RotaShiftVolunteer {
  /// Create an instance.
  const RotaShiftVolunteer({
    required this.id,
    required this.volunteer,
  });

  /// Create an instance from a JSON object.
  factory RotaShiftVolunteer.fromJson(final Map<String, dynamic> json) =>
      _$RotaShiftVolunteerFromJson(json);

  /// The ID of this assignment.
  final int id;

  /// The reference to the volunteer.
  final VolunteerReference volunteer;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$RotaShiftVolunteerToJson(this);
}
