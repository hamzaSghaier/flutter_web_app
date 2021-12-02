import 'dart:async';
import 'dart:convert';

import 'package:ecommerce_admin_tut/pages/CDC/association_entity.dart';
import 'package:ecommerce_admin_tut/pages/CDC/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'configuration.dart';

enum DataStatus { Uninitialized, Loading, Loaded, Failed }

class BackendState with ChangeNotifier {
  DataStatus _status = DataStatus.Uninitialized;
  DataStatus get status => _status;

  void init() async {
    //Add a delay to block widget rebuild as the method is called inside widget: https://stackoverflow.com/questions/59378267/flutter-provider-setstate-or-markneedsbuild-called-during-build
    print("trying ton retrieive data from ws");
    // await Future.delayed(const Duration(seconds: 1), () => "1");
    _status = DataStatus.Loading;
    notifyListeners();
    try {
      await BackendService2.initBackendData();
      _status = DataStatus.Loaded;
      notifyListeners();
    } catch (e, s) {
      _status = DataStatus.Failed;
      notifyListeners();
    }
    // reset();
  }

  void reset() async {
    _status = DataStatus.Uninitialized;
    notifyListeners();
  }
}

class BackendService2 {
  static Future<bool> initBackendData() async {
    final response1 =
        await http.get(Uri.parse(Configuration.host + 'trainingexercises/'));
    final response2 =
        await http.get(Uri.parse(Configuration.host + 'trainingevaluations/'));
    final response3 = await http
        .get(Uri.parse(Configuration.host + 'performanceevaluations/'));
    final response4 = await http
        .get(Uri.parse(Configuration.host + 'performancechallenges/'));

    if (response1.statusCode == 200 &&
        response2.statusCode == 200 &&
        response3.statusCode == 200 &&
        response4.statusCode == 200) {
      // If the server did return a 200 OK response for all backend ws,
      // then parse the JSON.

      print("success getting backend data");
      return true;
    } else {
      // If the server did not return a 200 OK response,
      // display error message to user and record to crashlytics
      print("Error reading backend data");
    }
  }
}

class BackendApi {
  static Future<Association> signIn(
      String raisonSocial,
      String ville,
      String gouvernorat,
      String matriculeFiscal,
      String type,
      String mail,
      String password) async {
    final responseAuth = await http.post(
      Uri.parse(ROOT_AUTHENTIFICATE),
      headers: <String, String>{
        // 'token': Configuration.associationToken,
      },
      body: jsonEncode(<String, String>{
        "token": Configuration.associationToken,
      }),
    );

    if (responseAuth.statusCode == 200) {
      Configuration.jwt = jsonDecode(responseAuth.body)["results"]["jwt"];
      print("${Configuration.jwt}");
      final response = await http.post(
        Uri.parse(ROOT_SINGNIN),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': Configuration.jwt,
        },
        body: jsonEncode(<String, String>{
          "raisonSocial": raisonSocial,
          "ville": ville,
          "gouvernorat": gouvernorat,
          "matricule_fiscal": matriculeFiscal,
          "type": type,
          "mail": mail,
          "password": password
          // "raisonSocial": raisonSocial,
          // "ville": ville,
          // "gouvernorat": gouvernorat,
          // "matricule_fiscal": matriculeFiscal,
          // "type": type,
          // "mail": mail,
          // "password": password
        }),
      );

      if (response.statusCode == 200) {
        Configuration.currentAssociation = new Association(
           raisonSocial: raisonSocial,
           adresse: "adresse",
          ville:  ville,
           gouvernorat: gouvernorat,
           tel: "tel",
          type:  type,
          patante:  "patante",
          matriculeFiscal:  matriculeFiscal,
           matriculeCnss: "matriculeCnss",
           numeroRne: "numeroRne",
           logo: "logo");
        print("${responseAuth.body}");
        return Association.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        throw Exception('Failed to sign in .');
      }
    } else {
      throw Exception('Failed to Authentificate.');
    }
  }
}
