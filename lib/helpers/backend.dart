import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';

const HOST = "http://137.74.219.115:8888/";
const AUTH_TOKEN = "e74eb221af1245feaaffb4dd88081637";

class BackendService {
  static Future<String> getJwt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('jwt');
  }

  static Future<dynamic> authenticate() async {
    var request = http.MultipartRequest('POST', Uri.parse(HOST + 'authenticate'));
    request.fields.addAll({'token': AUTH_TOKEN});

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final body = await response.stream.bytesToString();
      final jsonbody = json.decode(body);
      if (jsonbody["results"] != null) {
        if (jsonbody["results"]["jwt"] != null) prefs.setString("jwt", jsonbody["results"]["jwt"]);
      }

      return {"code": response.statusCode, "body": jsonbody};
    } else {
      return {"code": response.statusCode, "body": response.reasonPhrase};
    }
  }

  static Future<dynamic> login(String login, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var headers = {'Authorization': prefs.getString('jwt'), 'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(HOST + 'association/login'));
    request.body = json.encode({
      "email": login,
      "password": password,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final body = await response.stream.bytesToString();

      final jsonbody = json.decode(body);
      if (jsonbody["results"] != null) {
        if (jsonbody["results"]["data"] != null) if (jsonbody["results"]["data"]["code"] != null)
          prefs.setString("object", jsonbody["results"]["data"]["code"]);
        prefs.setString("code", jsonbody["results"]["data"]["code"]);
        prefs.setString("raison_social", jsonbody["results"]["data"]["raison_social"]);
        prefs.setString("matricule_fiscal", jsonbody["results"]["data"]["matricule_fiscal"]);
        prefs.setString("adresse", jsonbody["results"]["data"]["adresse"]);
        prefs.setString("ville", jsonbody["results"]["data"]["ville"]);
        prefs.setString("tel", jsonbody["results"]["data"]["tel"]);
        prefs.setString("mail", jsonbody["results"]["data"]["mail"]);
      }

      // print(await response.stream.bytesToString());

      return {"code": response.statusCode, "body": jsonbody};
    } else {
      print(response.reasonPhrase);
      return {"code": response.statusCode, "body": response.reasonPhrase};
    }
  }

  static Future<dynamic> signIn(
    String raisonSocial,
    String ville,
    String gouvernorat,
    String matriculeFiscal,
    String type,
    String mail,
    String nom,
    String prenom,
    String cin,
    String tel,
    String fonction,
    // List<int> publicationJorde,
    // List<int> pvElictif,
    // List<int> status,
  ) async {
    // print("publicationJorde $publicationJorde");
    // print("pvElictif $pvElictif");
    // print("status $status");

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var headers = {'Authorization': prefs.getString('jwt'), 'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(HOST + 'association/signin'));
    request.body = json.encode(
        {"raisonSocial": raisonSocial, "ville": ville, "gouvernorat": gouvernorat, "matricule_fiscal": matriculeFiscal, "type": type, "mail": mail});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final body = await response.stream.bytesToString();

      final jsonbody = json.decode(body);
      if (jsonbody["results"] != null) {
        if (jsonbody["results"]["data"] != null) if (jsonbody["results"]["data"]["object"] != null)
          prefs.setString("object", jsonbody["results"]["data"]["object"]);
        final resultCreatePersonel = await createPersonel(nom, prenom, cin, mail, tel, fonction);
        if (resultCreatePersonel["code"] == 200) {
          return {"code": 200, "body": jsonbody};
        } else {
          print(response.reasonPhrase);
          return {"code": 400, "body": resultCreatePersonel["body"]};
        }
      } else {
        print(response.reasonPhrase);
        return {"code": response.statusCode, "body": response.reasonPhrase};
      }

      // print(await response.stream.bytesToString());

    }
  }

  static Future<dynamic> createPersonel(String nom, String prenom, String cin, String email, String tel, String fonction) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var now = DateTime.now();
    var headers = {'Content-Type': 'application/json', 'Authorization': prefs.getString('jwt')};
    var request = http.Request('POST', Uri.parse(HOST + 'personal/' + prefs.getString('object') + '/create'));

    request.body = json.encode({"nom": nom, "prenom": prenom, "cin": cin, "email": email, "tel": tel, "fonction": fonction});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final body = await response.stream.bytesToString();

      final jsonbody = json.decode(body);
      if (jsonbody["results"] != null) {
        if (jsonbody["results"]["data"] != null) if (jsonbody["results"]["data"]["object"] != null)
          // prefs.setString("object", jsonbody["results"]["data"]["object"]);
          print(jsonbody["results"]["data"]["object"]);
      }

      // print(await response.stream.bytesToString());

      return {"code": response.statusCode, "body": jsonbody};
    } else {
      print(response.reasonPhrase);
      return {"code": response.statusCode, "body": response.reasonPhrase};
    }
  }

  static Future<dynamic> uploadDocument(List<int> selectedFile, String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var now = DateTime.now();
    var headers = {'enctype': 'multipart/form-data', 'Authorization': prefs.getString('jwt')};
    var request =
        http.MultipartRequest('POST', Uri.parse(HOST + 'association/document/' + prefs.getString('object') + '/' + name + '/' + '${now.year}'));
    request.files
        .add(await http.MultipartFile.fromBytes('file', selectedFile, contentType: new MediaType('application', 'octet-stream'), filename: name));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final body = await response.stream.bytesToString();

      final jsonbody = json.decode(body);
      if (jsonbody["results"] != null) {
        if (jsonbody["results"]["data"] != null) if (jsonbody["results"]["data"]["object"] != null)
          // prefs.setString("object", jsonbody["results"]["data"]["object"]);
          print(jsonbody["results"]["data"]["object"]);
      }

      // print(await response.stream.bytesToString());

      return {"code": response.statusCode, "body": jsonbody};
    } else {
      print(response.reasonPhrase);
      return {"code": response.statusCode, "body": response.reasonPhrase};
    }
  }
}
