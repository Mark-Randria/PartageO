import 'package:flutter/material.dart';
import 'package:partageo/utils/token.dart';

import './controller/utilisateur.dart';
import 'ui/customtextfield.dart';

Color primaryColor = const Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

void main() => runApp(LoginScreen());

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    void loginUser() async {
      if (nameController.text.isEmpty || passwordController.text.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erreur'),
              content: Text('Veuillez completer les champs.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        return;
      }

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 16.0),
                Text('Veuillez patienter...'),
              ],
            ),
          );
        },
      );

      final connect = await login(nameController.text, passwordController.text);

      if (connect) {
        final token = getToken();
        final decodedToken = decodeToken(token);
        if (decodedToken['role'] == true) {
          Navigator.pushNamed(context, '/facture');
        }
        else {
          Navigator.pushNamed(context, '/moderatorscreen');
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erreur'),
              content: Text('Connexion echoue. Verifier les valeurs inserés'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: ListView(
          children: <Widget>[
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0.0, 0, 0, 0),
                            child: Text(
                              "Bienvenue !",
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
                                EdgeInsetsDirectional.fromSTEB(0.0, 0, 0, 0),
                            child: Text(
                              "Connectez-vous pour continuer",
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
                            label: 'Mot de passe',
                            controller: passwordController,
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: SizedBox(
                          // flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 40.0),
                            child: FilledButton(
                              onPressed: () {
                                loginUser();
                              },
                              style: ButtonStyle(
                                maximumSize: const MaterialStatePropertyAll(
                                    Size(double.infinity, 40)),
                                backgroundColor:
                                    MaterialStatePropertyAll(primaryColor),
                                foregroundColor: const MaterialStatePropertyAll(
                                    Colors.white),
                              ),
                              child: const Expanded(
                                  child: Text(
                                'Se connecter',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
