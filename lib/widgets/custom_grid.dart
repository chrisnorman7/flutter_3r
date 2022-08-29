import 'dart:math';

import 'package:flutter/material.dart';

/// A custom grid.
class CustomGrid extends StatelessWidget {
  /// Create an instance.
  const CustomGrid({
    required this.itemCount,
    required this.itemBuilder,
    super.key,
  });

  /// The number of items to show.
  final int itemCount;

  /// How to build the children.
  final IndexedWidgetBuilder itemBuilder;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => LayoutBuilder(
        builder: (final context, final constraints) {
          final aspectRatio = constraints.maxWidth / constraints.maxHeight;
          final columns = sqrt(itemCount * aspectRatio);
          final childWidth = constraints.maxWidth / columns.ceil();
          return FittedBox(
            fit: BoxFit.scaleDown,
            child: SizedBox(
              width: constraints.maxWidth,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisExtent: childWidth,
                ),
                itemBuilder: itemBuilder,
                itemCount: itemCount,
                reverse: true,
                shrinkWrap: true,
              ),
            ),
          );
        },
      );
}
