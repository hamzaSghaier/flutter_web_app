import 'dart:math';

import 'package:ecommerce_admin_tut/pages/home/filePickerDemo.dart';
import 'package:ecommerce_admin_tut/widgets/custom_text.dart';
import 'package:ecommerce_admin_tut/widgets/page_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnlineDepositePage extends StatefulWidget {
  @override
  _OnlineDepositePageState createState() => _OnlineDepositePageState();
}

const _chars =
    'AaBbCcDdEeFfG1234567890lMmN1234567890TtUuVvW1234567890Zz1234567890';

class _OnlineDepositePageState extends State<OnlineDepositePage> {
  final rapportNumberController = TextEditingController();

  final rneController = TextEditingController();
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

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
          Center(
            child: PageHeader(
              text: "Dépot en ligne des rapports",
            ),
          ),
          Row(
            children: [
              Text(
                "N° Rapport :  ",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                width: 20,
              ),
              CustomEditText(rapportNumberController: rapportNumberController),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: CustomText(
              text: "Rapport financière :",
              size: 30,
              weight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 300),
            child: Row(
              children: [
                CustomText(
                  text: "Charger tableau excel (balance financière) : ",
                  size: 23,
                  weight: FontWeight.bold,
                  color: Colors.black,
                ),
                FilePickerDemo(),
              ],
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
                    primary: Colors.yellow, // background
                    onPrimary: Colors.black,
                    minimumSize: Size(300, 80) // foreground
                    ),
                onPressed: () => {},
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
      color:
          odd ? Colors.blueGrey.withOpacity(0.2) : Colors.blue.withOpacity(0.2),
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
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
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
