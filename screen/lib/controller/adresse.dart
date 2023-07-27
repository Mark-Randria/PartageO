import 'dart:convert';

import "../model/adresse.dart";
import 'package:http/http.dart' as http;

import '../utils/route.dart';
import '../utils/token.dart';

Future<Adresse> getAdresse() async {
  var client = http.Client();
  var url = Uri.https('${Route.routePath}/adress/all');
  try {
    var token = await getToken();
    var response = await client.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
    Map adresseMap = jsonDecode(utf8.decode(response.bodyBytes));
    return Adresse(adresseMap);
  } finally {
    client.close();
  }
}

Future<Adresse> getOneAdresse(int id) async {
  var client = http.Client();
  var url = Uri.https('${Route.routePath}/adress/$id');
  try {
    var token = await getToken();
    var response = await client.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
    Map adresseMap = jsonDecode(utf8.decode(response.bodyBytes));
    return Adresse(adresseMap);
  } finally {
    client.close();
  }
}

Future<Adresse> addAdresse(String nom_adresse) async {
  var client = http.Client();
  var url = Uri.https('${Route.routePath}/adress/new');
  try {
    var response = await client.post(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    }, body: jsonEncode({
      "nom_address": nom_adresse
    }));
    Map adresseMap = jsonDecode(utf8.decode(response.bodyBytes));
    return Adresse(adresseMap);
  } finally {
    client.close();
  }
}

Future<Adresse> updateAdresse(int id, String nom_adresse) async {
  var client = http.Client();
  var url = Uri.https('${Route.routePath}/adress/update/$id');
  try {
    var token = await getToken();
    var response = await client.put(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    }, body: jsonEncode({
      "nom_adresse": nom_adresse
    }));
    Map adresseMap = jsonDecode(utf8.decode(response.bodyBytes));
    return Adresse(adresseMap);
  } finally {
    client.close();
  }
}

