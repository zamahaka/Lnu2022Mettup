import 'dart:ui';

class Scale {
  final double sx;
  final double sy;

  const Scale(this.sx, this.sy);

  static const Scale identity = Scale(1, 1);

  static Scale lerp(
    Scale from,
    Scale to,
    double t,
  ) {
    return Scale(
      lerpDouble(from.sx, to.sx, t)!,
      lerpDouble(from.sy, to.sy, t)!,
    );
  }
}
