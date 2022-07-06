import 'package:flutter/material.dart';

class HomeGridTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final ImageProvider background;
  final VoidCallback? onTap;

  const HomeGridTile({
    super.key,
    required this.title,
    required this.icon,
    required this.background,
    this.onTap,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          color: Colors.green,
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.black54,
              title: Text(title),
              leading: Icon(icon),
            ),
            child: Ink(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: background,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
