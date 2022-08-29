import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import 'api_key_form.dart';
import 'main_screen.dart';

/// The home page widget.
class HomePage extends ConsumerWidget {
  /// Create an instance.
  const HomePage({
    super.key,
  });

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final apiKey = ref.watch(apiKeyProvider);
    return getBody(ref: ref, apiKey: apiKey);
  }

  /// Get the body for this widget.
  Widget getBody({
    required final WidgetRef ref,
    required final String? apiKey,
  }) {
    if (apiKey == null) {
      return const ApiKeyForm();
    }
    return const MainScreen();
  }
}
