import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.child,
    this.padding
  });

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 15, right: 15, bottom: 15),
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
        crossAxisAlignment: CrossAxisAlignment.start,
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

