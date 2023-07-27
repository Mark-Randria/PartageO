import 'package:flutter/material.dart';

import 'ui/customtextfield.dart';

Color primaryColor = const Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.grey.shade900),
                              child: const Icon(Icons.arrow_back, size: 32),
                            ),
                          ),
                        ],
                      )),
                  const Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(40.0, 0, 0, 0),
                          child: Text(
                            "S'inscrire",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(40.0, 0, 0, 0),
                          child: Text(
                            "Créer un nouveau compte",
                            style: TextStyle(
                              color: Color(0xFF696969),
                              height: 1.4,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: CustomTextField(
                          label: 'Nom',
                          controller: nameController,
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: CustomTextField(
                          label: 'E-mail',
                          controller: emailController,
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: CustomTextField(
                          label: 'Mot de passe',
                          controller: passwordController,
                        ),
                      )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: DropdownButtonFormField(
                        hint: const Text('Adresse'),
                        items: [
                          ...List.generate(
                            5,
                            (index) => DropdownMenuItem(
                              value: 'Option ${index + 1}',
                              child: Text('Option ${index + 1}'),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 50.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            // addUser(emailController.text, nameController.text, passwordController.text, addressController.text, true);
                          },
                          style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder(),
                            side: BorderSide(width: 1, color: primaryColor),
                          ),
                          child: const Text(
                            "S'inscrire",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
