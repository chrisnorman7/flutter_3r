import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/json/directory_volunteer.dart';
import 'src/json/three_rings_directory.dart';
import 'src/json/three_rings_news.dart';
import 'three_rings_context.dart';

/// Provides the headers to use.
final headersProvider = Provider((final ref) {
  final apiKey = ref.watch(apiKeyProvider);
  return <String, String>{
    'Authorization': 'APIKEY $apiKey',
  };
});

/// Provides the HTTP client.
final dioProvider = Provider((final ref) {
  final headers = ref.watch(headersProvider);
  return Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
    ),
  );
});

/// The file where the API key will be stored.
final keyFile = File('api.key');

/// Provides the API key (if any).
final apiKeyProvider = Provider((final ref) {
  if (keyFile.existsSync()) {
    return keyFile.readAsStringSync();
  }
  return null;
});

/// The base URL.
const baseUrl = 'https://www.3r.org.uk/';

/// Provide the directory.
final directoryProvider = FutureProvider<ThreeRingsDirectory>(
  (final ref) async {
    final dio = ref.watch(dioProvider);
    final response = await dio.get<Map<String, dynamic>>('directory.json');
    final json = response.data!;
    final directory = ThreeRingsDirectory.fromJson(json);
    final volunteers = List<DirectoryVolunteer>.from(directory.volunteers)
      ..sort(
        (final a, final b) {
          final aNumber = a.name.split(' ').last;
          final bNumber = b.name.split(' ').last;
          return aNumber.compareTo(bNumber);
        },
      );
    return ThreeRingsDirectory(volunteers: volunteers);
  },
);

/// Provides the context to use.
final threeRingsContextProvider = FutureProvider<ThreeRingsContext>(
  (final ref) async {
    final directory = await ref.watch(directoryProvider.future);
    final news = await ref.watch(newsProvider.future);
    return ThreeRingsContext(
      directory: directory,
      news: news,
    );
  },
);

/// Get the news.
final newsProvider = FutureProvider<ThreeRingsNews>(
  (final ref) async {
    final dio = ref.watch(dioProvider);
    final response = await dio.get<Map<String, dynamic>>('news.json');
    final json = response.data!;
    return ThreeRingsNews.fromJson(json);
  },
);
