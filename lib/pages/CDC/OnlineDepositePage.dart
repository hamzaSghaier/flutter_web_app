import 'dart:math';

import 'package:ecommerce_admin_tut/helpers/backend.dart';
import 'package:ecommerce_admin_tut/pages/CDC/configuration.dart';
import 'package:ecommerce_admin_tut/pages/home/filePickerDemo.dart';
import 'package:ecommerce_admin_tut/widgets/custom_text.dart';
import 'package:ecommerce_admin_tut/widgets/page_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class OnlineDepositePage extends StatefulWidget {
  @override
  _OnlineDepositePageState createState() => _OnlineDepositePageState();
}

const _chars = '123256985478652364587456321594555874569';

class _OnlineDepositePageState extends State<OnlineDepositePage> {
  final rapportNumberController = TextEditingController();

  final rneController = TextEditingController();
  Random _rnd = Random();
  String random_alias;
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  String _pickingType;
  bool _isnowLoad;
  String etatApprouve;
  void initData() async {
    // initData();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    etatApprouve = prefs.getString("etat");
    //_representantLegale = "Trésorerie";
    setState(() {
      _isnowLoad = false;
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    _isnowLoad = true;
    initData();

    random_alias = getRandomString(5);
    rapportNumberController.text = random_alias;
    super.initState();
  }

// [finance, clarification, financial_analysis, RFM, auther, pvElictif,  publicationJorde, status, publicationJorde, rapport_moral, balance, moral_analyse, moral_note, moral_approbation]
  final GlobalKey<FilePickerDemoState> _keyfinance = new GlobalKey();
  final GlobalKey<FilePickerDemoState> _keyclarification = new GlobalKey();
  final GlobalKey<FilePickerDemoState> _keyfinancial_analysis = new GlobalKey();
  final GlobalKey<FilePickerDemoState> _keyRFM = new GlobalKey();
  final GlobalKey<FilePickerDemoState> _keyauther = new GlobalKey();

  final GlobalKey<FilePickerDemoState> _keymoral_analyse = new GlobalKey();
  final GlobalKey<FilePickerDemoState> _keymoral_note = new GlobalKey();
  final GlobalKey<FilePickerDemoState> _keymoral_approbation = new GlobalKey();
  final GlobalKey<FilePickerDemoState> _keybalance = new GlobalKey();

  bool isValiData() {
    if (_keyfinance.currentState.getFile() == null || _keymoral_analyse.currentState.getFile() == null) return false;
    // print("eeeee ${_keyfinance.currentState.getFile()}");
    //  print("bbbbb ${_keymoral_analyse.currentState.getFile()}");
    if (_keyfinance.currentState.getFile() != null || _keymoral_analyse.currentState.getFile() != null)
      return true;
    else
      return false;
  }

  bool _isNowLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amber, // background
                      onPrimary: Colors.black,
                      minimumSize: Size(300, 80) // foreground
                      ),
                  onPressed: () async {
                    var url = Configuration.urlEtatFinanciere;
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    children: [
                      Text(
                        " - Etats financier ",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.file_download,
                        color: Colors.redAccent,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amber, // background
                      onPrimary: Colors.black,
                      minimumSize: Size(300, 80) // foreground
                      ),
                  onPressed: () async {
                    var url = Configuration.urlEclairsissement;
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    children: [
                      Text(
                        " - Tableaux d'éclaircissement  ",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.file_download,
                        color: Colors.redAccent,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amber, // background
                      onPrimary: Colors.black,
                      minimumSize: Size(300, 80) // foreground
                      ),
                  onPressed: () async {
                    var url = Configuration.urlSubvension;
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    children: [
                      Text(
                        " - Tableau d'utilisation des subventions  ",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.file_download,
                        color: Colors.redAccent,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amber, // background
                      onPrimary: Colors.black,
                      minimumSize: Size(300, 80) // foreground
                      ),
                  onPressed: () async {
                    var url = Configuration.urlBalance;
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    children: [
                      Text(
                        " - Balance  ",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      SizedBox(
                        width: 20,
                      ),
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
            SizedBox(
              height: 40,
            ),
            Center(
              child: PageHeader(
                text: "Dépôt en ligne des rapports",
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            _isnowLoad
                ? CustomText(
                    text: "Loading",
                    size: 22,
                    weight: FontWeight.bold,
                    color: Colors.black,
                  )
                : etatApprouve == "waiting" || etatApprouve == "disapproved"
                    ? CustomText(
                        text: "Vous n'êtes pas autorisé à effectuer cette tâche, attendez l'approbation de la cour des comptes.",
                        size: 22,
                        weight: FontWeight.bold,
                        color: Colors.black,
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: CustomText(
                              text: "Rapport financier :",
                              size: 30,
                              weight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 300),
                            child: Row(
                              children: [
                                CustomText(
                                  text: "Choisir documents /tableaux ",
                                  size: 23,
                                  weight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          FilePickerDemo(
                            key: _keyfinance,
                            title: "Etats financiers",
                            odd: true,
                          ),
                          FilePickerDemo(
                            key: _keybalance,
                            title: "Balance",
                            odd: true,
                          ),
                          FilePickerDemo(
                            key: _keyclarification,
                            title: "Tableaux d'éclairsissement",
                            odd: false,
                          ),
                          FilePickerDemo(
                            key: _keyfinancial_analysis,
                            title: "Notes d'analye financière",
                            odd: true,
                          ),
                          FilePickerDemo(
                            key: _keyRFM,
                            title: "PV d'approbation du RFM",
                            odd: false,
                          ),
                          FilePickerDemo(
                            key: _keyauther,
                            title: "Autre doc",
                            odd: true,
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: CustomText(
                              text: "Rapport moral :",
                              size: 30,
                              weight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 300),
                            child: Row(
                              children: [
                                CustomText(
                                  text: "Choisir documents : ",
                                  size: 23,
                                  weight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          FilePickerDemo(
                            key: _keymoral_analyse,
                            title: "Rapport d'analyse",
                            odd: true,
                          ),
                          FilePickerDemo(
                            key: _keymoral_note,
                            title: "Note Rapport",
                            odd: false,
                          ),
                          FilePickerDemo(
                            key: _keymoral_approbation,
                            title: "Pv d'approbation",
                            odd: true,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.amber, // background
                                    onPrimary: Colors.black,
                                    minimumSize: Size(300, 80) // foreground
                                    ),
                                onPressed: _isNowLoading
                                    ? null
                                    : () async {
                                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                        //   return AfterRegistration();
                                        // }));
                                        // [finance, clarification, financial_analysis, RFM, auther, pvElictif,  publicationJorde, status, publicationJorde, rapport_moral, balance, moral_analyse, moral_note, moral_approbation]
                                        //   _keyfinance
                                        //   _keyclarification
                                        //   _keyfinancial_analysis
                                        //   _keyRFM
                                        //   _keyauther
                                        //   _keymoral_analyse
                                        //   _keymoral_note
                                        //   _keymoral_approbation

                                        if (isValiData() == true) {
                                          try {
                                            setState(() {
                                              _isNowLoading = true;
                                            });

                                            if (_keyfinance.currentState.getFile() != null)
                                              await BackendService.uploadDocumentWithAlias(
                                                  _keyfinance.currentState.getFile(), "finance", random_alias);
                                            if (_keybalance.currentState.getFile() != null)
                                              await BackendService.uploadBalance(
                                                _keybalance.currentState.getFile(),
                                              );

                                            if (_keyclarification.currentState.getFile() != null)
                                              await BackendService.uploadDocumentWithAlias(
                                                  _keyclarification.currentState.getFile(), "clarification", random_alias);

                                            if (_keyfinancial_analysis.currentState.getFile() != null)
                                              await BackendService.uploadDocumentWithAlias(
                                                  _keyfinancial_analysis.currentState?.getFile(), "financial_analysis", random_alias);

                                            if (_keyRFM.currentState.getFile() != null)
                                              await BackendService.uploadDocumentWithAlias(_keyRFM.currentState.getFile(), "RFM", random_alias);

                                            if (_keyauther.currentState.getFile() != null)
                                              await BackendService.uploadDocumentWithAlias(_keyauther.currentState.getFile(), "auther", random_alias);

                                            if (_keymoral_analyse.currentState.getFile() != null)
                                              await BackendService.uploadDocumentWithAlias(
                                                  _keymoral_analyse.currentState.getFile(), "moral_analyse", random_alias);

                                            if (_keymoral_note.currentState.getFile() != null)
                                              await BackendService.uploadDocumentWithAlias(
                                                  _keymoral_note.currentState.getFile(), "moral_note", random_alias);

                                            if (_keymoral_approbation.currentState.getFile() != null)
                                              await BackendService.uploadDocumentWithAlias(
                                                  _keymoral_approbation.currentState.getFile(), "moral_approbation", random_alias);
                                            // Navigator.of(context).pop(false);
                                            // Navigator.of(context).pop();
                                            _showDialog(context, random_alias);
                                          } catch (e) {
                                            _showErrorDialog(context, "$e");
                                          }

                                          //  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                          //                     return AfterRegistration();
                                          //                   }))
                                        } else {
                                          _showErrorDialog(context, " ");
                                        }
                                        setState(() {
                                          _isNowLoading = false;
                                        });
                                      },
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: "Envoyer",
                                      size: 22,
                                      weight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 60,
                          ),
                        ],
                      ),
          ],
        ),
      ),
    );
  }
}

class CustomEditText extends StatelessWidget {
  const CustomEditText({
    Key key,
    @required this.rapportNumberController,
  }) : super(key: key);

  final TextEditingController rapportNumberController;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top:10, bottom: 10),
      width: 300,
      child: Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus == false) {
            //   PlayerProfileService.updateFullName(
            //       widget.email,
            //       fullNameController.text);
          }
        },
        child: TextField(
          onEditingComplete: () => {
            // PlayerProfileService.updateFullName(
            //     widget.email,
            //     fullNameController.text),
            FocusScope.of(context).requestFocus(new FocusNode())
          },
          readOnly: true,
          maxLines: 1,
          controller: rapportNumberController,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.black),
            ),
            hintStyle: TextStyle(fontSize: 16, color: Colors.white),
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

void _showErrorDialog(BuildContext context, String msg) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
          content: Container(
              height: 200,
              width: 1000,
              child: // Load a Lottie file from a remote url
                  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Veuillez vérifier l'insertion des documents.",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 25)),
                  Text(" \n  *Documents obligatoires : états financiers et rapport d'analyse. ",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16)),
                  msg != null
                      ? msg.trim().length > 0
                          ? Text("Erreur d'envoi : $msg", style: TextStyle(color: Colors.red, fontWeight: FontWeight.normal, fontSize: 12))
                          : SizedBox(
                              height: 10,
                            )
                      : SizedBox(
                          height: 10,
                        ),
                ],
              )),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              child: Text('Réessayer', style: TextStyle(color: Colors.green, fontWeight: FontWeight.normal, fontSize: 25)),
              onPressed: () => {Navigator.of(context).pop()},
            ),
          ]);
    },
  );
}

void _showDialog(BuildContext context, String random_alias) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      // return object of type Dialog
      return AlertDialog(
        content: Container(
          height: 500,
          width: 1000,
          child: // Load a Lottie file from a remote url
              Center(
            child: Container(
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.network('https://assets10.lottiefiles.com/packages/lf20_iu3iarbe.json', height: 150, width: 300),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Container(
                      child: LinearPercentIndicator(
                        width: 400.0,
                        onAnimationEnd: () => {Navigator.of(ctx).pop(), _showDechargeDialog(context, random_alias)},
                        animation: true,
                        animationDuration: 2000,
                        lineHeight: 30.0,
                        leading: Container(),
                        trailing: Container(),
                        percent: 1,
                        center: Text(" "),
                        linearStrokeCap: LinearStrokeCap.butt,
                        progressColor: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          // ignore: deprecated_member_use
          new FlatButton(
            child: new Text(" ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<Uint8List> _generatePdf(PdfPageFormat format, String alias) async {
  final pdf = pw.Document(compress: true);
  //final font = await PdfGoogleFonts.nunitoExtraLight();
  DateTime now = DateTime.now();

  String convertedDate = "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year.toString()}";

  pdf.addPage(
    pw.Page(
      pageFormat: format,
      build: (context) {
        return pw.Container(
            height: 500,
            //width: 1000,
            child: // Load a Lottie file from a remote url
                pw.Center(
                    child: pw.Container(
              margin: pw.EdgeInsets.all(40),
              //width: 400,
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text("République tunisienne ",
                              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColors.black, fontSize: 24)),
                          pw.Text("La cour des comptes ", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColors.black, fontSize: 24)),
                        ],
                      ),
                      pw.Container(
                        child: pw.Column(
                          children: [
                            pw.Text("Le $convertedDate", style: pw.TextStyle(fontWeight: pw.FontWeight.normal, color: PdfColors.black, fontSize: 24)),
                            pw.Container(
                              child: pw.Row(
                                children: [
                                  pw.Text(
                                    "N° Dossier :  ",
                                    style: pw.TextStyle(color: PdfColors.black, fontWeight: pw.FontWeight.bold, fontSize: 18),
                                  ),
                                  pw.SizedBox(
                                    width: 5,
                                  ),
                                  pw.Container(
                                    width: 110,
                                    child: pw.Text(
                                      alias,

                                      // controller: rapportNumberController,

                                      style: pw.TextStyle(color: PdfColors.black, fontWeight: pw.FontWeight.bold, fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  pw.SizedBox(
                    height: 100,
                  ),
                  pw.Text("Monsieur/Madame", style: pw.TextStyle(fontWeight: pw.FontWeight.normal, color: PdfColors.black, fontSize: 22)),
                  pw.SizedBox(
                    height: 30,
                  ),
                  pw.Text("Vous avez envoyé avec succès le rapport financier et moral le  $convertedDate",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.normal, color: PdfColors.black, fontSize: 22)),
                  pw.SizedBox(
                    height: 20,
                  ),
                  pw.Text("Je vous prie d'agréer, l'assurance de ma haute considération.",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.normal, color: PdfColors.black, fontSize: 18)),
                ],
              ),
            )));
      },
    ),
  );

  return pdf.save();
}

void _showDechargeDialog(BuildContext context, String alias) {
  // flutter defined function

  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        content: DechargeWidget(
          alias: alias,
        ),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          // ignore: deprecated_member_use
          new FlatButton(
            child: Row(
              children: [
                Icon(
                  Icons.print,
                  color: Colors.black,
                  size: 40.0,
                ),
                Text("Imprimer", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22)),
              ],
            ),
            onPressed: () async {
              Printing.layoutPdf(name: "Decharge", onLayout: (_) => _generatePdf(PdfPageFormat.a4, alias));
            },
            // onPressed: () {
            //   Navigator.of(context).pop();
            // },
          ),
        ],
      );
    },
  );
}
// void _showDechargeDialog(BuildContext context, String alias) {
//   // flutter defined function

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       // return object of type Dialog
//       return AlertDialog(
//         content: DechargeWidget(
//           alias: alias,
//         ),
//         actions: <Widget>[
//           // usually buttons at the bottom of the dialog
//           // ignore: deprecated_member_use
//           new FlatButton(
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.print,
//                   color: Colors.black,
//                   size: 40.0,
//                 ),
//                 Text("Imprimer", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22)),
//               ],
//             ),
//             onPressed: () async {
//               var url = "$HOST/cdc/templates/subvontion";
//               if (await canLaunch(url)) {
//                 await launch(url);
//               } else {
//                 throw 'Could not launch $url';
//               }
//             },
//             // onPressed: () {
//             //   Navigator.of(context).pop();
//             // },
//           ),
//         ],
//       );
//     },
//   );
// }

class DechargeWidget extends StatelessWidget {
  const DechargeWidget({
    Key key,
    @required this.alias,
  }) : super(key: key);

  final String alias;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String convertedDate = "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year.toString()}";

    return Container(
      height: 500,
      width: 1000,
      child: // Load a Lottie file from a remote url
          Center(
        child: Container(
          margin: EdgeInsets.all(40),
          //width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("République tunisienne ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24)),
                      Text("La cour des comptes ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24)),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Le $convertedDate", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 24)),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "N° Dossier :  ",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 110,
                                child: TextField(
                                  onEditingComplete: () => {
                                    // PlayerProfileService.updateFullName(
                                    //     widget.email,
                                    //     fullNameController.text),
                                    FocusScope.of(context).requestFocus(new FocusNode())
                                  },
                                  readOnly: true,
                                  maxLines: 1,
                                  // controller: rapportNumberController,
                                  textAlign: TextAlign.start,

                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(width: 1, color: Colors.white),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(width: 1, color: Colors.white),
                                    ),
                                    hintText: alias,
                                    hintStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Text("Monsieur/Madame", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 22)),
              SizedBox(
                height: 30,
              ),
              Text("Vous avez envoyé avec succès le rapport financier et moral le  $convertedDate",
                  style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 18)),
              SizedBox(
                height: 20,
              ),
              Text("Je vous prie d'agréer, l'assurance de ma haute considération.",
                  style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}

class DechargeWidgetPW extends StatelessWidget {
  const DechargeWidgetPW({
    Key key,
    @required this.alias,
  }) : super(key: key);

  final String alias;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String convertedDate = "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year.toString()}";

    return Container();
  }
}
