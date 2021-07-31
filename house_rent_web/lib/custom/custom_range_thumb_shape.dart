import 'package:flutter/material.dart';

class CustomThumbShape implements RangeSliderThumbShape {
  final double thumbRadius;
  final thumbHeight;
  final int min;
  final int max;

  const CustomThumbShape({
    required this.thumbRadius,
    this.thumbHeight,
    required this.min,
    required this.max,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {
        Animation<double>? activationAnimation,
        Animation<double>? enableAnimation,
        bool? isDiscrete,
        bool? isEnabled,
        bool? isOnTop,
        bool? isPressed,
        double? value,
        TextDirection? textDirection,
        SliderThemeData? sliderTheme,
        Thumb? thumb,
        double? textScaleFactor,
        Size? sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    final rRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: center, width: thumbHeight * 1.2, height: thumbHeight * .6),
      Radius.circular(thumbRadius * .4),
    );

    final paint = Paint()
      ..color = sliderTheme!.activeTrackColor! //Thumb Background Color
      ..style = PaintingStyle.fill;

    TextSpan span = new TextSpan(
        style: new TextStyle(
            fontSize: thumbHeight * .3,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1),
        text: '${((center.dx-24)/2.16).round().toString()}');
    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter =
    Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawRRect(rRect, paint);
    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    return (min+(max-min)*value).round().toString();
  }
}