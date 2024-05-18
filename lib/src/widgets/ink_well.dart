import 'package:flutter/material.dart';

class NInkWell extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;
  final bool isDark;
  final BorderRadius? borderRadius;
  EdgeInsetsGeometry? padding;

  factory NInkWell.dark({
    Widget? child,
    VoidCallback? onTap,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? padding,
  }) =>
      NInkWell(
        isDark: true,
        onTap: onTap,
        borderRadius: borderRadius,
        padding: padding,
        child: child,
      );

  factory NInkWell.light({
    Widget? child,
    VoidCallback? onTap,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? padding,
  }) =>
      NInkWell(
        child: child,
        isDark: false,
        onTap: onTap,
        borderRadius: borderRadius,
        padding: padding,
      );

  static Widget adaptive({
    Widget? child,
    VoidCallback? onTap,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? padding,
  }) =>
      Builder(
        builder: (context) => NInkWell(
          child: child,
          isDark: Theme.of(context).brightness == Brightness.dark,
          onTap: onTap,
          borderRadius: borderRadius,
          padding: padding,
        ),
      );

  NInkWell({
    this.child,
    required this.isDark,
    required this.onTap,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: borderRadius ?? BorderRadius.zero,
        splashColor: isDark
            ? Colors.white.withOpacity(0.2)
            : Colors.black.withOpacity(0.1),
        highlightColor: Colors.black.withOpacity(isDark ? 0.2 : 0.05),
        onTap: this.onTap,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(0),
          child: child,
        ),
      ),
    );
  }
}
