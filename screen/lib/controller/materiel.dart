import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:partageo/model/materiel.dart';

import '../utils/route.dart';
import '../utils/token.dart';

Future<Materiel> getAllMateriel() async {
  var client = http.Client();
  var url = Uri.https('${Route.routePath}/material/all');
  try{
    var token = await getToken();
    var response = await client.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
    Map materialMap = jsonDecode(utf8.decode(response.bodyBytes));
    return Materiel(materialMap);
  } finally {
    client.close();
  }
}

Future<Materiel> getMaterielByName(String name) async {
  var client = http.Client();
  var url = Uri.https('${Route.routePath}/material/name/$name');
  try{
    var token = await getToken();
    var response = await client.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
    Map materialMap = jsonDecode(utf8.decode(response.bodyBytes));
    return Materiel(materialMap);
  } finally {
    client.close();
  }
}

Future<Materiel> getMaterielById(int id) async {
  var client = http.Client();
  var url = Uri.https('${Route.routePath}/material/$id');
  try{
    var token = await getToken();
    var response = await client.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
    Map materialMap = jsonDecode(utf8.decode(response.bodyBytes));
    return Materiel(materialMap);
  } finally {
    client.close();
  }
}

Future<Materiel> addMateriel(String nom_materiel, int duree_utilisation, int nombre_kw, int id_user ) async {
  var client = http.Client();
  var url = Uri.https('${Route.routePath}/material/new');
  try{
    var token = await getToken();
    var response = await client.post(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    }, body: jsonEncode({
      "nom_materiel": nom_materiel,
      "duree_utilisation": duree_utilisation,
      "nombre_kw": nombre_kw,
      "id_user": id_user
    }));
    Map materialMap = jsonDecode(utf8.decode(response.bodyBytes));
    return Materiel(materialMap);
  } finally {
    client.close();
  }
}

void deleteMateriel(int id) async {
  var client = http.Client();
  var url =  Uri.https('${Route.routePath}/material/delete/$id');
  try {
    var token = await getToken();
    await client.delete(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
  } finally {
    client.close();
  }
}

Future<Materiel> updateMateriel(int id, String nom_materiel, int duree_utilisation, int nombre_kw, int id_user ) async {
  var client = http.Client();
  var url = Uri.https('${Route.routePath}/material/update/$id');
  try{
    var token = await getToken();
    var response = await client.put(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    }, body: jsonEncode({
      "nom_materiel": nom_materiel,
      "duree_utilisation": duree_utilisation,
      "nombre_kw": nombre_kw,
      "id_user": id_user
    }));
    Map materialMap = jsonDecode(utf8.decode(response.bodyBytes));
    return Materiel(materialMap);
  } finally {
    client.close();
  }
}