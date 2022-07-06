import 'package:flutter/material.dart';

import 'gradient_background_data.dart';

class GradientBackground extends StatelessWidget {
  final GradientBackgroundData data;

  const GradientBackground({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: CustomPaint(
        painter: _GradientBackgroundPainter(data: data),
      ),
    );
  }
}

class InterpolateGradientBackground extends StatelessWidget {
  final List<GradientBackgroundData> data;
  final double progress;

  InterpolateGradientBackground({
    super.key,
    required this.data,
    required this.progress,
  })  : assert(data.isNotEmpty),
        assert(!progress.isNegative && progress.isFinite);

  @override
  Widget build(BuildContext context) {
    final interpolatedData = _interpolateData(data, progress);

    return GradientBackground(data: interpolatedData);
  }

  GradientBackgroundData _interpolateData(
    List<GradientBackgroundData> data,
    double progress,
  ) {
    final fromIndex = progress.floor();
    final toIndex = progress.ceil();

    final lastIndex = data.length - 1;
    final from = data[fromIndex.clamp(0, lastIndex)];
    final to = data[toIndex.clamp(0, lastIndex)];

    return GradientBackgroundData.lerp(
        from, to, progress - progress.truncate());
  }
}

class _GradientBackgroundPainter extends CustomPainter {
  final GradientBackgroundData data;

  const _GradientBackgroundPainter({
    required this.data,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final paint = Paint()
      ..shader = RadialGradient(
        center: FractionalOffset.topLeft,
        colors: [data.gradientColor, data.bgColor],
      ).createShader(rect);

    canvas.save();
    canvas.translate(
      rect.width * data.center.dx,
      rect.height * data.center.dy,
    );

    canvas.scale(data.scale.sx, data.scale.sy);
    canvas.drawPaint(paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _GradientBackgroundPainter oldDelegate) =>
      data != oldDelegate.data;
}
