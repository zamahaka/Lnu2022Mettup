import 'package:flutter/material.dart';
import 'package:lnu2022mettup/presentation/routes.dart';

import 'widgets/home_grid_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LNU Summer School"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Welcome to Flutter",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Today we'll learn how to develop cross-platform mobile app using Flutter",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: Center(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                shrinkWrap: true,
                padding: const EdgeInsets.all(4),
                children: [
                  HomeGridTile(
                    title: "My first widget",
                    icon: Icons.widgets_rounded,
                    background: const AssetImage(
                      "assets/images/widgets.jpeg",
                    ),
                    onTap: () => Navigator.of(context).pushNamed(
                      Routes.widgets,
                    ),
                  ),
                  HomeGridTile(
                    title: "State management",
                    icon: Icons.settings_rounded,
                    background: const AssetImage(
                      "assets/images/state_management.jpeg",
                    ),
                    onTap: () => Navigator.of(context).pushNamed(
                      Routes.stateManagement,
                    ),
                  ),
                  HomeGridTile(
                    title: "Widget animations",
                    icon: Icons.animation_rounded,
                    background: const AssetImage(
                      "assets/images/animation.gif",
                    ),
                    onTap: () => Navigator.of(context).pushNamed(
                      Routes.animations,
                    ),
                  ),
                  HomeGridTile(
                    title: "Platform interop",
                    icon: Icons.phonelink_setup_rounded,
                    background: const AssetImage(
                      "assets/images/platform_interop.jpeg",
                    ),
                    onTap: () => Navigator.of(context).pushNamed(
                      Routes.platformInterop,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
