import 'package:json_annotation/json_annotation.dart';

part 'volunteer_reference.g.dart';

/// A reference to a volunteer.
@JsonSerializable()
class VolunteerReference {
  /// Create an instance.
  const VolunteerReference({
    required this.id,
    required this.name,
  });

  /// Create an instance from a JSON object.
  factory VolunteerReference.fromJson(final Map<String, dynamic> json) =>
      _$VolunteerReferenceFromJson(json);

  /// The ID of this volunteer.
  final int id;

  /// The name of this volunteer.
  final String name;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$VolunteerReferenceToJson(this);
}
