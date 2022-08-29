import 'package:backstreets_widgets/widgets/error_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import '../src/json/directory_volunteer.dart';

/// A widget that shows an image for the given [volunteer].
class VolunteerImage extends ConsumerWidget {
  /// Create an instance.
  const VolunteerImage({
    required this.volunteer,
    super.key,
  });

  /// The volunteer whose image will be shown.
  final DirectoryVolunteer volunteer;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final headers = ref.watch(headersProvider);
    return Image.network(
      '${baseUrl}directory/${volunteer.id}/photos/thumb.jpg',
      errorBuilder: (final context, final error, final stackTrace) =>
          ErrorListView(
        error: error,
        stackTrace: stackTrace,
      ),
      headers: headers,
      semanticLabel: volunteer.name,
    );
  }
}
