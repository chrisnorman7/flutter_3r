import 'dart:async';
import 'dart:math';

import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers.dart';
import '../three_rings_context.dart';
import '../widgets/custom_grid.dart';
import '../widgets/volunteer_image.dart';
import 'three_rings_error_screen.dart';

/// The random number generator to use.
final random = Random();

/// The main screen that shows everything.
class MainScreen extends ConsumerStatefulWidget {
  /// Create an instance.
  const MainScreen({
    super.key,
  });

  /// Create state for this widget.
  @override
  MainScreenState createState() => MainScreenState();
}

/// State for [MainScreen].
class MainScreenState extends ConsumerState<MainScreen> {
  /// The timer to use.
  late final Timer timer;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(minutes: 1), (final timer) {
      ref.refresh(shiftsProvider);
      if (mounted) {
        setState(() {});
      }
    });
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final provider = ref.watch(threeRingsContextProvider);
    return provider.when(
      data: (final data) =>
          SimpleScaffold(title: 'Three Rings', body: getBody(data)),
      error: ThreeRingsErrorScreen.withPositional,
      loading: LoadingScreen.new,
    );
  }

  /// Provide the body of the widget.
  Widget getBody(final ThreeRingsContext ctx) {
    final directory = ctx.directory;
    final news = ctx.news;
    final newsItems = news.items;
    final newsItem = newsItems[random.nextInt(newsItems.length)];
    final volunteers = directory.volunteers;
    final shifts = ctx.shifts;
    setClipboardText(shifts.toString());
    return Column(
      children: [
        const Text('Shifts'),
        Expanded(
          child: CustomGrid(
            itemCount: volunteers.length,
            itemBuilder: (final context, final index) {
              final volunteer = volunteers[index];
              return ListTile(
                autofocus: index == 0,
                title: Text(volunteer.name),
                subtitle: VolunteerImage(volunteer: volunteer),
                onTap: () {},
              );
            },
          ),
        ),
        Center(
          child: Text(
            newsItem.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Html(
          data: newsItem.body,
          onAnchorTap:
              (final url, final context, final attributes, final element) {
            if (url != null) {
              launchUrl(Uri.parse(url));
            }
          },
        )
      ],
    );
  }

  /// Dispose of the widget.
  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}
