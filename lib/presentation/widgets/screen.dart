import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.child
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: child
    );
  }
}

class ScrollableScreen extends StatelessWidget {
  const ScrollableScreen({
    super.key,
    required this.scrollable,
    this.bottom,
    this.top,
    this.bottomGap = 10,
    this.topGap = 10
  });

  final Widget? top;
  final Widget scrollable;
  final Widget? bottom;
  final double bottomGap;
  final double topGap;

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Column(
        children: [
          top ?? const SizedBox.shrink(),
          SizedBox(height: bottomGap),
          Expanded(
            child: SingleChildScrollView(
              child: scrollable,
            )
          ),
          SizedBox(height: topGap),
          bottom ?? const SizedBox.shrink()
        ],
      )
    );
  }
}

