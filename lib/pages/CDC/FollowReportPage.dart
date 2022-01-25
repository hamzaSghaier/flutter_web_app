import 'dart:convert';

import 'package:ecommerce_admin_tut/helpers/backend.dart';
import 'package:ecommerce_admin_tut/helpers/loaders.dart';
import 'package:ecommerce_admin_tut/main.dart';
import 'package:ecommerce_admin_tut/widgets/custom_text.dart';
import 'package:ecommerce_admin_tut/widgets/page_header.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FollowReportPage extends StatefulWidget {
  @override
  State<FollowReportPage> createState() => _FollowReportPageState();
}

class _FollowReportPageState extends State<FollowReportPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // shrinkWrap: true,
        children: [
          Container(
            child: Center(
              child: PageHeader(
                text: "Suivi rapports (E-doc)",
              ),
            ),
          ),
          FutureBuilder<dynamic>(
              future: BackendService.rapports(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    return ColorLoader2();
                  case ConnectionState.done:
                    // print("user Exist code ${snapshot.data.data["code"]}");
                    if (snapshot.hasData) if (snapshot.data["code"] == 200) {
                      var list = [];
                      var list_Keys = [];
                      var results = snapshot.data['body']['results'];
                      // Map<dynamic, dynamic> ress = jsonDecode(results);
                      //List<String> keys = results.keys;
                      results.forEach((k, v) => {print("kkkkkk $k vvvvvvv $v"), list.add(v), list_Keys.add(k)});
                      //  return Text("snapshot.data ${results.toString()}");
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List<Widget>.generate(
                            list.length,
                            (index) => EDocCard(
                              alias: '${list_Keys.elementAt(index)}',
                              data: list.elementAt(index),
                              backcolor: Colors.white70,
                            ),
                          ));
                      //         return Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     EDocCard(
                      //       annee: '2019',
                      //       backcolor: Colors.white70,
                      //     ),
                      //     EDocCard(
                      //       annee: '2020',
                      //       backcolor: Colors.white70,
                      //     ),
                      //     EDocCard(
                      //       annee: '2021',
                      //       backcolor: Colors.green.shade100,
                      //     ),
                      //   ],
                      // );
                      // return FutureBuilder<Object>(
                      //     future: BackendService.getJwt(),
                      //     builder: (context, snapshot2) {
                      //       switch (snapshot2.connectionState) {
                      //         case ConnectionState.none:
                      //         case ConnectionState.active:
                      //         case ConnectionState.waiting:
                      //           return ColorLoader2();
                      //         case ConnectionState.done:
                      //           return Text("snapshot.data ${snapshot2.data}");
                      //           break;
                      //         default:
                      //           return ColorLoader2();
                      //       }
                      //     });
                    } else {
                      //return FailedWs(() => setState(() => {}));
                      return Text("Vous n'avez pas encore des rapports déposer.");
                    }
                    else {
                      return Center(child: Text("Erreur de chargement des rapports."));
                      // return FailedWs(() => setState(() => {}));
                    }

                    break;
                  default:
                    return ColorLoader2();
                }
              })
        ],
      ),
    );
  }
}

class EDocCard extends StatelessWidget {
  final dynamic data;
  final String alias;
  final Color backcolor;
  const EDocCard({
    Key key,
    @required this.data,
    @required this.backcolor,
    @required this.alias,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      // height: 400,
      // width: 600,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: backcolor,
        elevation: 50,
        child: Container(
          margin: EdgeInsets.all(50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomText(
                text: "Rapport ${data.elementAt(0)["anne"]} ",
                size: 30,
                weight: FontWeight.bold,
                color: Colors.black,
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: "N° dossier : $alias ",
                size: 25,
                weight: FontWeight.bold,
                color: Colors.black,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'images/edoc.png',
                  fit: BoxFit.contain,
                  height: 120,
                ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    data.length,
                    (index) => Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Text(
                            getRapportLabelFromName(data.elementAt(index)["type"]),
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent, // background
                                onPrimary: Colors.transparent,
                                minimumSize: Size(50, 50) // foreground
                                ),
                            onPressed: () async {
                              var url =
                                  "$HOST2/association${data.elementAt(index)["document_path"]}/${data.elementAt(index)["nom_document"]}/download";
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.file_download,
                                  color: Colors.redAccent,
                                  size: 30.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              // Text(
              //   "Voir Plus",
              //   style: TextStyle(
              //     fontSize: 25,
              //     color: Colors.blueAccent,
              //     fontWeight: FontWeight.bold,
              //     decoration: TextDecoration.underline,
              //   ),
              // ),
              // CustomText(
              //   text: "Voir Plus",
              //   size: 25,
              //   weight: FontWeight.bold,

              //   color: Colors.blueAccent,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

String getRapportLabelFromName(String name) {
  switch (name) {
    case "finance":
      return "Etats financiers";
      break;

    case "balance":
      return "Balance";
      break;

    case "clarification":
      return "Tableaux d'éclairsissement";
      break;

    case "financial_analysis":
      return "Notes d'analye financière";
      break;

    case "RFM":
      return "PV d'approbation du RFM";
      break;

    case "auther":
      return "Autre doc";
      break;
    case "moral_analyse":
      return "Rapport d'analyse";
      break;
    case "moral_note":
      return "Note Rapport";
      break;
    case "moral_approbation":
      return "Pv d'approbation";
      break;

    default:
      return " ";
  }
}
