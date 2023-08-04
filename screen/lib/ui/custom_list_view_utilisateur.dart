import 'package:flutter/material.dart';

class CustomListviewUtilisateur extends StatefulWidget {
  final List<String> name;
  final List<String> address;

  const CustomListviewUtilisateur(
      {super.key,
        required this.name,
        required this.address});

  @override
  State<CustomListviewUtilisateur> createState() => _CustomListviewUtilisateurState();
}

class _CustomListviewUtilisateurState extends State<CustomListviewUtilisateur> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.name.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(widget.name[index]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.address[index],
                  style: const TextStyle(fontSize: 15)),
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
                                widget.name.removeAt(index);
                                widget.address.removeAt(index);
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
