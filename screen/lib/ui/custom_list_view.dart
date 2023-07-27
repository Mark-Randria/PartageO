import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final List<String> devicesNames;
  final List<String> consumptions;
  final List<String> electricMetrics;

  const CustomListView(
      {super.key,
      required this.devicesNames,
      required this.consumptions,
      required this.electricMetrics});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: devicesNames.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(devicesNames[index]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(consumptions[index], style: const TextStyle(fontSize: 20)),
              Text(electricMetrics[index]),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
