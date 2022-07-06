import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lnu2022mettup/presentation/animations/widgets/fake_list/fake_list.dart';
import 'package:lnu2022mettup/presentation/shared/Scale.dart';

import 'widgets/gradient_background/gradient_background.dart';
import 'widgets/gradient_background/gradient_background_data.dart';

class AnimationsPage extends StatefulWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  State<AnimationsPage> createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage>
    with TickerProviderStateMixin {
  // For demo purposes placed into static property
  // Can be passed as a constructor arg or constructed based on current Theme.
  static const List<GradientBackgroundData> _data = [
    GradientBackgroundData(
      bgColor: Color(0xffffecd2),
      gradientColor: Color(0xfffcb69f),
      scale: Scale(1.4, 2),
      center: FractionalOffset(0.1, 0.15),
    ),
    GradientBackgroundData(
      bgColor: Color(0xffa1c4fd),
      gradientColor: Color(0xffc2e9fb),
      scale: Scale(1.6, 1.2),
      center: FractionalOffset.center,
    ),
    GradientBackgroundData(
      bgColor: Color(0xffff9a9e),
      gradientColor: Color(0xfffecfef),
      scale: Scale(1.4, 1.7),
      center: FractionalOffset(0.7, 0.25),
    ),
  ];

  static const Duration _defaultDuration = Duration(milliseconds: 200);

  late PageController _pageController;

  late AnimationController _saturationChangeController;
  late Animation<List<GradientBackgroundData>> _saturationAnimation;

  // 0 -> List is visible
  late AnimationController _listVisibilityController;

  var _useSaturatedColors = false;
  var _showList = true;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _saturationChangeController = AnimationController(
      duration: _defaultDuration,
      vsync: this,
    );
    _saturationAnimation = GradientBackgroundDataListTween(
      begin: _data,
      end: _applyMaxSaturation(_data),
    ).animate(_saturationChangeController);

    _listVisibilityController = AnimationController(
      duration: _defaultDuration,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _saturationChangeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animations"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
                animation: _saturationAnimation,
                builder: (context, _) {
                  final data = _saturationAnimation.value;

                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, _) {
                      final progress = _pageController.hasClients
                          ? _pageController.page ?? 0.0
                          : 0.0;

                      return InterpolateGradientBackground(
                        progress: progress,
                        data: data,
                      );
                    },
                  );
                }),
          ),
          PageView.builder(
            controller: _pageController,
            itemCount: _data.length,
            itemBuilder: (context, index) => AnimatedOpacity(
              duration: _defaultDuration,
              opacity: _showList ? 1 : 0,
              child: FakeList(
                bigItemPeriod: index + 3,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            tooltip:
                _useSaturatedColors ? "Desaturate list" : "Saturate colors",
            heroTag: null,
            child: Icon(
              _useSaturatedColors
                  ? Icons.color_lens
                  : Icons.color_lens_outlined,
            ),
            onPressed: () => setState(() {
              _useSaturatedColors = !_useSaturatedColors;

              _saturationChangeController
                  .animateTo(_useSaturatedColors ? 1 : 0);
            }),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            tooltip: _showList ? "Hide list" : "Show list",
            heroTag: null,
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _listVisibilityController,
            ),
            onPressed: () => setState(() {
              _showList = !_showList;

              _listVisibilityController.animateTo(_showList ? 0 : 1);
            }),
          ),
        ],
      ),
    );
  }

  List<GradientBackgroundData> _applyMaxSaturation(
    List<GradientBackgroundData> data,
  ) {
    saturateColor(Color color) =>
        HSVColor.fromColor(color).withSaturation(1.0).toColor();

    return data
        .map(
          (e) => GradientBackgroundData(
            bgColor: saturateColor(e.bgColor),
            gradientColor: saturateColor(e.gradientColor),
            scale: e.scale,
            center: e.center,
          ),
        )
        .toList();
  }
}
