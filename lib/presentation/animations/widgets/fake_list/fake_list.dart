import 'package:flutter/material.dart';

import 'fake_list_item.dart';

class FakeList extends StatelessWidget {
  final int bigItemPeriod;

  const FakeList({
    super.key,
    this.bigItemPeriod = 2,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      itemCount: 25,
      itemBuilder: (context, index) {
        return FakeListItem(isBig: index % bigItemPeriod.clamp(2, 10) == 0);
      },
    );
  }
}
