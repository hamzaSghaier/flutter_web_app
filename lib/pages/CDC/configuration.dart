import 'package:ecommerce_admin_tut/helpers/backend.dart';
import 'package:ecommerce_admin_tut/pages/CDC/association_entity.dart';
import 'package:ecommerce_admin_tut/pages/CDC/constant.dart';
import 'package:flutter/cupertino.dart';

class Configuration {
  static String host = "192.168.1.105:8888/";

  static String associationToken = "e74eb221af1245feaaffb4dd88081637";
  static String urlEtatFinanciere = "$HOST2/cdc/templates/etat_financier";
  static String urlEclairsissement =  "$HOST2/cdc/templates/eclairecissement";
  static String urlSubvension = "$HOST2/cdc/templates/subvontion";
  static String urlBalance = "$HOST2/cdc/templates/balance";
  static String jwt = "";
  static Association currentAssociation;
}
