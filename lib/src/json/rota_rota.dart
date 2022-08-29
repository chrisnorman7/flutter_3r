import 'package:json_annotation/json_annotation.dart';

import 'rota_shift.dart';

part 'rota_rota.g.dart';

/// a rota assignment for a [RotaShift] instance.
@JsonSerializable()
class RotaRota {
  /// Create an instance.
  const RotaRota({
    required this.id,
    required this.name,
  });

  /// Create an instance from a JSON object.
  factory RotaRota.fromJson(final Map<String, dynamic> json) =>
      _$RotaRotaFromJson(json);

  /// The ID of this rota.
  final int id;

  /// The name of this rota.
  final String name;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$RotaRotaToJson(this);
}
