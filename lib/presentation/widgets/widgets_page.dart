import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WidgetsPage extends StatelessWidget {
  const WidgetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [
          WidgetsListTile(
            image: AssetImage("assets/images/widgets_example.png"),
            title: "Widget",
            description: Text(
              "Flutter widgets are built using a modern framework that takes inspiration from React.\n"
              "The central idea is that you build your UI out of widgets.\n"
              "Widgets describe what their view should look like given their current configuration and state.\n"
              "When a widget’s state changes, the widget rebuilds its description, which the framework diffs against the previous description in order to determine the minimal changes needed in the underlying render tree to transition from one state to the next.",
            ),
          ),
          WidgetsListTile(
            image: AssetImage("assets/images/flutter_trees.png"),
            title: "Trees",
            description: TreesDescription(),
          ),
          WidgetsListTile(
            image: AssetImage("assets/images/widget_of_the_week.png"),
            title: "Examples",
            description: WidgetExamplesDescription(),
          ),
        ],
      ),
    );
  }
}

class WidgetsListTile extends StatelessWidget {
  final String title;
  final Widget description;
  final ImageProvider image;

  const WidgetsListTile({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(16)),
            child: SizedBox(
              height: 226,
              child: Image(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 8),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodyMedium!,
                  child: description,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TreesDescription extends StatelessWidget {
  const TreesDescription({
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium,
        children: const [
          TextSpan(
            text:
                "Flutter framework has 3 different trees that are responsible for app widget composition, layout, rendering.",
          ),
          TextSpan(text: " Which are:\n"),
          TextSpan(
            text: " · Widget tree\n",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: "   Immutable composition of all widgets built in your app\n",
          ),
          TextSpan(
            text: " · Element tree\n",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            style: TextStyle(),
            text:
                "   Mutable representation of widget tree that configures specific tree location\n",
          ),
          TextSpan(
            text: " · Render tree\n",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            style: TextStyle(),
            text:
                "   Stores the geometry of the user interface and uses it during painting and hit testing",
          ),
        ],
      ),
    );
  }
}

class WidgetExamplesDescription extends StatelessWidget {
  const WidgetExamplesDescription({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          " · Text\n"
          " · Row\n"
          " · Column\n"
          " · Stack\n"
          " · Container\n",
        ),
        WidgetExamplesDescriptionAction(
          text: "Widget catalog",
          onTap: () => launchUrlString(
            "https://docs.flutter.dev/development/ui/widgets",
          ),
        ),
        WidgetExamplesDescriptionAction(
          text: "Widget of the week",
          onTap: () => launchUrlString(
            "https://www.youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG",
          ),
        ),
      ],
    );
  }
}

class WidgetExamplesDescriptionAction extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const WidgetExamplesDescriptionAction({
    super.key,
    required this.text,
    required this.onTap,
  }) : super();

  @override
  State<WidgetExamplesDescriptionAction> createState() =>
      _WidgetExamplesDescriptionActionState();
}

class _WidgetExamplesDescriptionActionState
    extends State<WidgetExamplesDescriptionAction> {
  var _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    final color =
        _isPressed ? titleSmall?.color?.withOpacity(0.4) : titleSmall?.color;

    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: Container(
        constraints: const BoxConstraints(minHeight: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: titleSmall?.copyWith(color: color),
            ),
            Icon(Icons.navigate_next, color: color),
          ],
        ),
      ),
    );
  }
}
