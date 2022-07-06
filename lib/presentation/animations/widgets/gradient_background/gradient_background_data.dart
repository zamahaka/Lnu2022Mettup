import 'package:flutter/widgets.dart';
import 'package:lnu2022mettup/presentation/shared/Scale.dart';

class GradientBackgroundData {
  final Color bgColor;

  final Color gradientColor;

  final Scale scale;
  final FractionalOffset center;

  const GradientBackgroundData({
    required this.bgColor,
    required this.gradientColor,
    this.scale = Scale.identity,
    this.center = FractionalOffset.topRight,
  });

  static GradientBackgroundData lerp(
    GradientBackgroundData from,
    GradientBackgroundData to,
    double t,
  ) {
    return GradientBackgroundData(
      bgColor: Color.lerp(from.bgColor, to.bgColor, t)!,
      gradientColor: Color.lerp(from.gradientColor, to.gradientColor, t)!,
      scale: Scale.lerp(from.scale, to.scale, t),
      center: FractionalOffset.lerp(from.center, to.center, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is! GradientBackgroundData) return false;

    return bgColor == other.bgColor &&
        gradientColor == other.gradientColor &&
        scale == other.scale &&
        center == other.center;
  }
}

class GradientBackgroundDataListTween
    extends Tween<List<GradientBackgroundData>> {
  GradientBackgroundDataListTween({
    required List<GradientBackgroundData> super.begin,
    required List<GradientBackgroundData> super.end,
  })  : assert(begin.length == end.length),
        super();

  @override
  List<GradientBackgroundData> lerp(double t) {
    return begin!
        .asMap()
        .map(
          (index, data) => MapEntry(
            index,
            GradientBackgroundData.lerp(data, end![index], t),
          ),
        )
        .values
        .toList();
  }
}
