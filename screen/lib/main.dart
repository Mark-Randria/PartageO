import 'package:flutter/material.dart';
import 'package:partageo/addfacture.dart';
import 'package:partageo/listuser.dart';
import 'dart:io';

import 'utils/token.dart';
import 'addmateriel.dart';
import 'listfacture.dart';
import 'listmateriel.dart';
import 'listUtilisateur.dart';
import 'materielmodification.dart';
import 'moderatorfacture.dart';
import 'moderatorscreen.dart';
import 'modification_page.dart';
import 'modificationfacture.dart';
import 'modifmateriel.dart';
import 'used_device.dart';
import 'address.dart';

import 'home.dart';
import 'login.dart';
import 'signup.dart';
import 'facture.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  String? initialRoute = await determineInitialRoute();
  runApp(MyApp(initialRoute: initialRoute));
}

Future<String?> determineInitialRoute() async {
  String? token = await getToken();
  if (token != null) {
    Map<String, dynamic> decodedToken = decodeToken(token);
    if (decodedToken['role'] == false) {
      return '/moderatorscreen';
    } else if (decodedToken['role'] == true) {
      return '/facture';
    }
  } else {
    return '/home';
  }
}

class MyApp extends StatelessWidget {
  final String? initialRoute;

  const MyApp({Key? key, this.initialRoute}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Partageo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: AddMaterielScreen(),
      initialRoute: initialRoute ?? '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        // '/home': (context) => ModeratorScreen(),
        '/moderatorscreen': (context) => ModeratorScreen(),
        '/modifmateriel': (context) => EditMaterielScreen(),
        '/addfacture': (context) => AddFactureScreen(),
        '/login': (context) => LoginScreen(),
        '/facture': (context) => const FactureScreen(),
        '/signup': (context) => const SignupScreen(),
        '/addmateriel': (context) => const AddMaterielScreen(),
        '/useddevice': (context) => const UsedDevice(),
        '/listfacture': (context) => ListFactureScreen(),
        '/listmateriel': (context) => const ListMaterielScreen(),
        '/adresse': (context) => AddAdressScreen(),
        '/listuser': (context) => ListUserScreen(),
        '/listfacture': (context) => ListFactureScreen(),
      },
    );
  }
}
