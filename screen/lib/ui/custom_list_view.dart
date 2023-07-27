import 'package:flutter/material.dart';
import 'package:partageo/modification_page.dart';

class CustomListView extends StatefulWidget {
  final List<String> devicesNames;
  final List<String> consumptions;
  final List<String> electricMetrics;

  const CustomListView(
      {super.key,
      required this.devicesNames,
      required this.consumptions,
      required this.electricMetrics});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.devicesNames.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(widget.devicesNames[index]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.consumptions[index],
                  style: const TextStyle(fontSize: 20)),
              Text(widget.electricMetrics[index]),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ModificationPage(
                        deviceName: widget.devicesNames[index],
                        consumption:
                            '${widget.consumptions[index]} ${widget.electricMetrics[index]}',
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Suppression'),
                        content: const Text('Supprimer cet élément ?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Annuler'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                widget.devicesNames.removeAt(index);
                                widget.consumptions.removeAt(index);
                                widget.electricMetrics.removeAt(index);
                              });
                              Navigator.of(context).pop();
                            },
                            child: const Text('Confirmer'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
