import 'package:flutter/material.dart';

class NCircularProgressIndicator extends StatelessWidget {
  final bool isDark;
  final double size;
  final Key? key;

  const NCircularProgressIndicator({
    this.key,
    this.isDark = false,
    this.size = 15,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation(
          isDark ? Colors.white : Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
