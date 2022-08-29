import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

/// A custom error screen which will delete the API key if necessary.
class ThreeRingsErrorScreen extends ConsumerWidget {
  /// Create an instance.
  const ThreeRingsErrorScreen({
    required this.error,
    required this.stackTrace,
    super.key,
  });

  /// Create an instance with positional arguments.
  const ThreeRingsErrorScreen.withPositional(
    this.error,
    this.stackTrace, {
    super.key,
  });

  /// The error to show.
  final Object error;

  /// THe stack trace to use.
  final StackTrace? stackTrace;

  /// Build a widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) =>
      SimpleScaffold(
        title: 'Error',
        body: ErrorListView(
          error: error,
          stackTrace: stackTrace,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final e = error;
            if (e is DioError && e.response?.statusCode == 403) {
              keyFile.deleteSync();
            }
            ref.refresh(apiKeyProvider);
          },
          tooltip: 'OK',
          child: const Icon(
            Icons.close,
            semanticLabel: 'OK',
          ),
        ),
      );
}
