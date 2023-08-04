import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:partageo/model/facture.dart';

import '../utils/route.dart';
import '../utils/token.dart';

  Future<List> getAllFacture() async {
  var client = http.Client();
  var url = Uri.https(Route.routePath, '/invoice/all');
  try{
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

Future<List> getFactureByReference(String ref_facture) async {
  var client = http.Client();
  var url = Uri.https(Route.routePath, '/invoice/reference/$ref_facture');
  try{
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

Future<List> getFactureByDate(String date) async {
  var client = http.Client();
  var url = Uri.https(Route.routePath, '/invoice/date/$date');
  try{
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

void addFacture(String ref_facture, String date, int montant, int rano, int id_adresse) async {
  var client = http.Client();
  var url = Uri.https(Route.routePath, '/invoice/new');
  try{
    var token = await getToken();
    var response = await client.post(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    }, body: jsonEncode({
      "ref_facture": ref_facture,
      "date": date,
      "rano": rano,
      "montant": montant,
      "id_adresse": id_adresse
    }));
  } finally {
    client.close();
  }
}