import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final int itemCount;

  const CustomListView({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Column(
          children: [ListTile(title: Text('Item $index')), const Divider()],
        );
      },
    );
  }
}
