import 'package:flutter/material.dart';
import 'package:partageo/ui/custom_list_view.dart';

class UsedDevice extends StatefulWidget {
  const UsedDevice({super.key});

  @override
  State<UsedDevice> createState() => _UsedDeviceState();
}

class _UsedDeviceState extends State<UsedDevice> {
  String monthValue = "Janvier";
  String device = "Aspirateur";
  String electricMetric = "kWh";
  String consumption = "43";

  final devices = ['Aspirateur', 'Ordinateur', 'Télévision', 'Lampe'];
  final electricMetrics = ['kWh', 'Watts', 'kWh', 'Watts'];
  final consumptions = ['43', '100', '200', '50'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajout d'appareils utilisées"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // listview of dropdown menu for month, electric consumption, and devices list
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height - 40,
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      // dropdown menu for month
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: monthValue,
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Colors.grey,
                          ),
                          items: <String>[
                            'Janvier',
                            'Février',
                            'Mars',
                            'Avril',
                            'Mai',
                            'Juin',
                            'Juillet',
                            'Août',
                            'Septembre',
                            'Octobre',
                            'Novembre',
                            'Décembre'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: const TextStyle(fontSize: 18)),
                            );
                          }).toList(),
                          // set value to selected month
                          onChanged: (String? newValue) {
                            setState(() {
                              // month = newValue!;
                              monthValue = newValue!;
                            });
                          },
                        ),
                      ),
                      // electric consumption as input text
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 20.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Consommation d\'électricité',
                          ),
                          onChanged: (text) {
                            consumption = text;
                          },
                        ),
                      ),
                      // row containing dropdown device to add and units of electric
                      Row(
                        children: [
                          // dropdown menu for devices
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, top: 20.0),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: device,
                                icon: const Icon(
                                    Icons.keyboard_arrow_down_outlined),
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 2,
                                  color: Colors.grey,
                                ),
                                // items in alphabetical order
                                items: <String>[
                                  'Aspirateur',
                                  'Cafetière',
                                  'Chauffage',
                                  'Climatiseur',
                                  'Congélateur',
                                  'Fer à repasser',
                                  'Four',
                                  'Lampe',
                                  'Lave-linge',
                                  'Lave-vaisselle',
                                  'Ordinateur',
                                  'Réfrigérateur',
                                  'Sèche-cheveux',
                                  'Sèche-linge',
                                  'Télévision',
                                  'Ventilateur',
                                  'Autre'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,
                                        style: const TextStyle(fontSize: 18)),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    device = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                          // dropdown menu for units
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, top: 20.0),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: electricMetric,
                                icon: const Icon(
                                    Icons.keyboard_arrow_down_outlined),
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 2,
                                  color: Colors.grey,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    electricMetric = newValue!;
                                  });
                                },
                                items: <String>[
                                  'kWh',
                                  'Watts',
                                  'Autre'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,
                                        style: const TextStyle(fontSize: 18)),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      // list of devices added with edit and delete button
                      Expanded(
                          flex: 2,
                          child: CustomListView(
                              devicesNames: devices,
                              electricMetrics: electricMetrics,
                              consumptions: consumptions)),
                      // button to add device
                      Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    devices.add(device);
                                    electricMetrics.add(electricMetric);
                                    consumptions.add(consumption);
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xFF1CA9C9)),
                                ),
                                child: const Text('Ajouter',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFE5E4E2))),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
