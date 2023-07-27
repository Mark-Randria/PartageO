import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:partageo/model/utilisateur.dart';
import '../utils/route.dart';
import '../utils/token.dart';

void login(String username, String password) async {
  var client = http.Client();
  var url = Uri.https('${Route.routePath}/login');
  try{
    var response = await client.post(url, headers: {
      "Content-type": "application/x-www-form-urlencoded",
      "Accept": "application/x-www-form-urlencoded"
    },body:{
      'username': username,
      'password': password
    });
    if(response.statusCode == 200) {
      Map loginMap = jsonDecode(utf8.decode(response.bodyBytes));
      var tokenMap = Token(loginMap);
      setToken(tokenMap.access_token);
    }
  } finally {
    client.close();
  }
}

void deconnect() async {
  deleteToken();
}

Future<Utilisateur> getAllUser() async {
  var client = http.Client();
  var url = Uri.https('${Route.routePath}/user/all');
  try{
    var token = await getToken();
    var response = await client.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
    Map userMap = jsonDecode(utf8.decode(response.bodyBytes));
    return Utilisateur(userMap);
  } finally{
    client.close();
  }
}

Future<Utilisateur> getOneUserByName(String name) async {
  var client = http.Client();
  var url = Uri.https('${Route.routePath}/user/name/$name');
  try{
    var token = await getToken();
    var response = await client.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
    Map userMap = jsonDecode(utf8.decode(response.bodyBytes));
    return Utilisateur(userMap);
  } finally {
    client.close();
  }
}

Future<Utilisateur> getOneUserByRole(Bool role) async {
  var client = http.Client();
  var url = Uri.https('${Route.routePath}/user/role/$role');
  try{
    var token = await getToken();
    var response = await client.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
    Map userMap = jsonDecode(utf8.decode(response.bodyBytes));
    return Utilisateur(userMap);
  } finally{
    client.close();
  }
}

Future<Utilisateur> getOneUserById(int id) async {
  var client = http.Client();
  var url = Uri.https('${Route.routePath}/user/$id');
  try{
    var token = await getToken();
    var response = await client.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
    Map userMap = jsonDecode(utf8.decode(response.bodyBytes));
    return Utilisateur(userMap);
  } finally{
    client.close();
  }
}

Future<Utilisateur> addUser(String E_mail, String nom_utilisateur, String mot_de_passe, int id_adresse, bool role) async {
  var client = http.Client();
  var url = Uri.https('${Route.routePath}/user/new');
  try{
    var response = await client.post(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    }, body: jsonEncode({
        "E_mail": E_mail,
        "nom_utilisateur": nom_utilisateur,
        "mot_de_passe": mot_de_passe,
        "id_adresse": id_adresse,
        "role": role
    }));
    Map userMap = jsonDecode(utf8.decode(response.bodyBytes));
    return Utilisateur(userMap);
  } finally {
    client.close();
  }
}

void deleteUser(int id) async {
  var client = http.Client();
  var url = Uri.https('${Route.routePath}/user/delete/$id');
  try{
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

Future<Utilisateur> updateUser(int id, String E_mail, String nom_utilisateur, String mot_de_passe, int id_adresse, bool role) async {
  var client = http.Client();
  var url = Uri.https('${Route.routePath}/user/update/$id');
  try{
    var token = await getToken();
    var response = await client.put(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    },body: jsonEncode({
      "E_mail": E_mail,
      "nom_utilisateur": nom_utilisateur,
      "mot_de_passe": mot_de_passe,
      "id_adresse": id_adresse,
      "role": role
    }));
    Map userMap = jsonDecode(utf8.decode(response.bodyBytes));
    return Utilisateur(userMap);
  } finally {
    client.close();
  }
}
