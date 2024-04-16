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
    this.top
  });

  final Widget? top;
  final Widget scrollable;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Column(
        children: [
          _getGap(top),
          top ?? const SizedBox.shrink(),
          _getGap(top),
          Expanded(
            child: SingleChildScrollView(
              child: scrollable,
            )
          ),
          _getGap(bottom),
          bottom ?? const SizedBox.shrink()
        ],
      )
    );
  }

  Widget _getGap(Widget? widget) {
    if (widget == null) return const SizedBox.shrink();
    return const SizedBox(height: 10);
  }
}

