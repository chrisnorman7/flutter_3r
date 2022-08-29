import 'json/directory_volunteer.dart';

/// A shift on the rota.
class Shift {
  /// Create an instance.
  const Shift({
    required this.name,
    required this.volunteers,
  });

  /// The name of the shift.
  final String name;

  /// The volunteer on this shift.
  final List<DirectoryVolunteer> volunteers;
}
