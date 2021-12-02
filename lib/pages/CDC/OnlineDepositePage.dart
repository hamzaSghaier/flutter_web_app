import 'dart:math';

import 'package:ecommerce_admin_tut/pages/home/filePickerDemo.dart';
import 'package:ecommerce_admin_tut/widgets/custom_text.dart';
import 'package:ecommerce_admin_tut/widgets/page_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:percent_indicator/percent_indicator.dart';

class OnlineDepositePage extends StatefulWidget {
  @override
  _OnlineDepositePageState createState() => _OnlineDepositePageState();
}

const _chars = 'AaBbCcDdEeFfG1234567890lMmN1234567890TtUuVvW1234567890Zz1234567890';

class _OnlineDepositePageState extends State<OnlineDepositePage> {
  final rapportNumberController = TextEditingController();

  final rneController = TextEditingController();
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  String _pickingType;

  @override
  void initState() {
    // TODO: implement initState
    rapportNumberController.text = getRandomString(10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                  var url = "http://137.74.219.115:8888/cdc/templates/etat_financier";
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
                  var url = "http://137.74.219.115:8888/cdc/templates/eclairecissement";
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
                  var url = "http://137.74.219.115:8888/cdc/templates/subvontion";
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
                  var url = "http://137.74.219.115:8888/cdc/templates/etat_financier";
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
          // Row(
          //   children: [
          //     Text(
          //       "N° Rapport :  ",
          //       style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          //     ),
          //     SizedBox(
          //       width: 20,
          //     ),
          //     CustomEditText(rapportNumberController: rapportNumberController),
          //   ],
          // ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
          ),
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
          // Container(
          //   margin: EdgeInsets.only(left: 300),
          //   child: Row(
          //     children: [
          //       CustomText(
          //         text: "Charger tableau excel (balance financière) : ",
          //         size: 23,
          //         weight: FontWeight.bold,
          //         color: Colors.black,
          //       ),
          //       FilePickerDemo(),
          //     ],
          //   ),
          // ),
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
          RowUploadFile(
            title: "Etats financiers",
            odd: true,
          ),
          RowUploadFile(
            title: "Tableaux d'éclairsissement",
            odd: false,
          ),
          RowUploadFile(
            title: "Notes d'analye financière",
            odd: true,
          ),
          RowUploadFile(
            title: "PV d'approbation du RFM",
            odd: false,
          ),
          RowUploadFile(
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
          RowUploadFile(
            title: "Rapport d'analyse",
            odd: true,
          ),
          RowUploadFile(
            title: "Note Rapport",
            odd: false,
          ),
          RowUploadFile(
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
                onPressed: () => {_showDechargeDialog()},
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
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                        //  color: Colors.red,
                        // margin: EdgeInsets.only(
                        //   left: 200,
                        // ),
                        child: LinearPercentIndicator(
                          //  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                          width: 400.0,
                          animation: true,
                          animationDuration: 8000,
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
              child: new Text("Annuler", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDechargeDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Container(
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
                        Container(
                          child: Column(
                            children: [
                              Text("Le 20/11/2021", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 24)),
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
                                        controller: rapportNumberController,
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
                                          hintStyle: TextStyle(fontSize: 16, color: Colors.white),
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
                    Text("Vous avez envoyé avec succès le rapport financier et moral le  20/11/2021",
                        style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 22)),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Je vous prie d'agréer, l'assurance de ma haute considération.",
                        style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 18)),
                  ],
                ),
              ),
            ),
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
                var url = "https://we.tl/t-jmROwi4lkV";
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
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
}

class RowUploadFile extends StatelessWidget {
  final String title;
  final bool odd;
  const RowUploadFile({
    Key key,
    this.title,
    this.odd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 200, right: 200, top: 20, bottom: 20),
      color: odd ? Colors.blueGrey.withOpacity(0.2) : Colors.blue.withOpacity(0.2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            size: 23,
            weight: FontWeight.bold,
            color: Colors.black,
          ),
          FilePickerDemo(),
        ],
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
