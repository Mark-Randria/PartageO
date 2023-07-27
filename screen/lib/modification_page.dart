import 'package:flutter/material.dart';

class ModificationPage extends StatefulWidget {
  final String deviceName;
  final String consumption;

  const ModificationPage(
      {super.key, required this.deviceName, required this.consumption});

  @override
  State<ModificationPage> createState() => _ModificationPageState();
}

class _ModificationPageState extends State<ModificationPage> {
  final _deviceNameController = TextEditingController();
  final _consumptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _deviceNameController,
              decoration: InputDecoration(
                hintText: widget.deviceName,
                labelText: 'Nom du périphérique',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _consumptionController,
              decoration: InputDecoration(
                hintText: widget.consumption,
                labelText: 'Consommation',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF1CA9C9)),
            ),
            child: const Text('Valider',
                style: TextStyle(fontSize: 18, color: Color(0xFFE5E4E2))),
          ),
        ],
      ),
    );
  }
}
