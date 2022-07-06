import 'package:flutter/material.dart';
import 'package:lnu2022mettup/presentation/animations/animations_page.dart';
import 'package:lnu2022mettup/presentation/home/home_page.dart';
import 'package:lnu2022mettup/presentation/platform_interop/widgets_page.dart';
import 'package:lnu2022mettup/presentation/routes.dart';
import 'package:lnu2022mettup/presentation/state_management/state_management_page.dart';
import 'package:lnu2022mettup/presentation/widgets/widgets_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}) : super();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LNU Summer School',
      theme: ThemeData(),
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => const HomePage(),
        Routes.widgets: (context) => const WidgetsPage(),
        Routes.animations: (context) => const AnimationsPage(),
        Routes.stateManagement: (context) => const StateManagementPage(),
        Routes.platformInterop: (context) => const PlatformInteropPage(),
      },
    );
  }
}
