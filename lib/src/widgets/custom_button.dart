import 'package:flutter/material.dart';
import 'package:flutter_project_core/src/widgets/circular_progress_indicator.dart';
import 'package:flutter_project_core/src/widgets/ink_well.dart';

class CustomButton extends StatelessWidget {
  final bool isApiInProgress;
  final String? text;
  final Widget? child;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color? color;
  final bool isDark;
  final bool isOutlineDotted;
  final double borderRadius;
  final Gradient? gradient;
  final Color? borderColor;
  final List<BoxShadow>? boxShadow;
  final bool showLoadingMessage;

  const CustomButton({
    Key? key,
    this.isApiInProgress = false,
    this.text,
    this.child,
    this.onTap,
    this.width,
    this.height,
    this.textStyle,
    this.color,
    this.isOutlineDotted = false,
    this.isDark = false,
    this.gradient,
    this.borderRadius = 42,
    this.borderColor,
    this.boxShadow,
    this.showLoadingMessage = true,
  })  : assert(text != null || child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final container = Container(
      width: width,
      height: height ?? 50,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 13,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
        boxShadow: boxShadow,
        border: Border.all(
          color: borderColor ?? Colors.black,
          width: 1,
          style: color != null || isOutlineDotted
              ? BorderStyle.none
              : BorderStyle.solid,
        ),
        gradient: gradient,
      ),
      child: DefaultTextStyle(
        style: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: isDark ? Colors.white : Colors.black)
            .merge(textStyle),
        child: isApiInProgress
            ? Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (showLoadingMessage) ...[
                      const Text(
                        'Please wait...',
                      ),
                      const SizedBox(width: 15),
                    ],
                    NCircularProgressIndicator(
                      isDark: isDark,
                    ),
                  ],
                ),
              )
            : child != null
                ? child!
                : Center(
                    child: Text(text!),
                  ),
      ),
    );

    return Stack(
      children: [
        container,
        Positioned.fill(
          child: NInkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(borderRadius),
            isDark: false,
          ),
        ),
      ],
    );
  }
}
