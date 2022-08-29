import 'screens/main_screen.dart';
import 'src/json/three_rings_directory.dart';
import 'src/json/three_rings_news.dart';

/// The session context used by a [MainScreen] instance.
class ThreeRingsContext {
  /// Create an instance.
  const ThreeRingsContext({
    required this.directory,
    required this.news,
  });

  /// The directory to use.
  final ThreeRingsDirectory directory;

  /// The news from the organisation.
  final ThreeRingsNews news;
}
