import 'package:flutter/material.dart';

class CustomBorderedProgressBar extends StatelessWidget {
  final double progress;
  final double width;
  final double height;
  final Color borderColor;
  final Color backgroundColor;
  final Color progressColor;

  const CustomBorderedProgressBar({
    super.key,
    required this.progress,
    required this.width,
    required this.height,
    required this.borderColor,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(height / 2),
        color: backgroundColor,
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: progressColor,
            borderRadius: BorderRadius.circular(height / 2),
          ),
        ),
      ),
    );
  }
}
