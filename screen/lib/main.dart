import 'package:flutter/material.dart';
import 'package:partageo/used_device.dart';
import 'dart:io';

import 'utils/token.dart';
import 'home.dart';
import 'login.dart';
import 'signup.dart';
import 'signuptype.dart';
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
    // Check for any conditions based on the decoded token if needed
    // For example, check token expiration, user roles, etc.
    // If the token is valid and meets your condition, return '/facture' route.
    return '/facture';
  } else {
    // If the token doesn't exist, return the default route '/home'.
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
      initialRoute: initialRoute ?? '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/facture': (context) => const FactureScreen(),
        '/signuptype': (context) => const SignUpTypeScreen(),
        '/signup': (context) => const SignupScreen(),
      },
    );
  }
}
