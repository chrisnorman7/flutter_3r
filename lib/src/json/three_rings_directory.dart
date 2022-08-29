import 'package:json_annotation/json_annotation.dart';

import 'directory_volunteer.dart';

part 'three_rings_directory.g.dart';

/// The directory as received from the server.
@JsonSerializable()
class ThreeRingsDirectory {
  /// Create an instance.
  const ThreeRingsDirectory({required this.volunteers});

  /// Create an instance from a JSON object.
  factory ThreeRingsDirectory.fromJson(final Map<String, dynamic> json) =>
      _$ThreeRingsDirectoryFromJson(json);

  /// The volunteers in the directory.
  final List<DirectoryVolunteer> volunteers;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ThreeRingsDirectoryToJson(this);
}
