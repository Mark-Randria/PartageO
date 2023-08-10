import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:partageo/model/adresse.dart';

import '../utils/route.dart';
import '../utils/token.dart';

Future<Adresse> getAdresse() async {
  var client = http.Client();
  var url = Uri.https(Route.routePath, '/adress/all');
  try {
    var token = await getToken();
    var response = await client.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
    var result = jsonDecode(utf8.decode(response.bodyBytes));
    return Adresse.fromJson(result);
  } finally {
    client.close();
  }
}

Future<List> getOneAdresse(int id) async {
  var client = http.Client();
  var url = Uri.https(Route.routePath, '/adress/$id');
  try {
    var token = await getToken();
    var response = await client.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
    return jsonDecode(utf8.decode(response.bodyBytes));
  } finally {
    client.close();
  }
}

Future<List> addAdresse(String nom_adresse) async {
  var client = http.Client();
  var url = Uri.https(Route.routePath, '/adress/new');
  try {
    var response = await client.post(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    }, body: jsonEncode({
      "nom_address": nom_adresse
    }));
    return jsonDecode(utf8.decode(response.bodyBytes));
  } finally {
    client.close();
  }
}

Future<List> updateAdresse(int id, String nom_adresse) async {
  var client = http.Client();
  var url = Uri.https(Route.routePath, '/adress/update/$id');
  try {
    var token = await getToken();
    var response = await client.put(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    }, body: jsonEncode({
      "nom_adresse": nom_adresse
    }));
    return jsonDecode(utf8.decode(response.bodyBytes));
  } finally {
    client.close();
  }
}

