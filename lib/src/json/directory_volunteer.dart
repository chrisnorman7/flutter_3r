import 'package:json_annotation/json_annotation.dart';

part 'directory_volunteer.g.dart';

/// A volunteer in the directory.
@JsonSerializable()
class DirectoryVolunteer {
  /// Create an instance.
  const DirectoryVolunteer({
    required this.id,
    required this.name,
    required this.url,
  });

  /// Create an instance from a JSON object.
  factory DirectoryVolunteer.fromJson(final Map<String, dynamic> json) =>
      _$DirectoryVolunteerFromJson(json);

  /// The ID of this volunteer.
  final int id;

  /// The URL of this volunteer on Three Rings.
  final String url;

  /// The name of this volunteer.
  final String name;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$DirectoryVolunteerToJson(this);
}
