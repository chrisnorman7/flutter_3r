import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

/// The top0-level app class.
class MyApp extends StatelessWidget {
  /// Create an instance.
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context) => ProviderScope(
        child: MaterialApp(
          title: 'Three Rings',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: const HomePage(),
        ),
      );
}
