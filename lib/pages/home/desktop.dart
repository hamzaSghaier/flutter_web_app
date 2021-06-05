import 'package:ecommerce_admin_tut/pages/home/filePickerDemo.dart';
import 'package:ecommerce_admin_tut/widgets/cards/cards_list.dart';
import 'package:ecommerce_admin_tut/widgets/custom_text.dart';
import 'package:ecommerce_admin_tut/widgets/page_header.dart';
import 'package:ecommerce_admin_tut/widgets/charts/sales_chart.dart';
import 'package:ecommerce_admin_tut/widgets/top_buyer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageDesktop extends StatefulWidget {
  @override
  _HomePageDesktopState createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop> {
  final rapportNumberController = TextEditingController();
  String _pickingType;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: PageHeader(
            text: "Dépot en ligne des rapport",
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
        Padding(
          padding: const EdgeInsets.all(14),
          child: CustomText(
            text: "Informations générale :",
            size: 30,
            weight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nom Association  ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomEditText(
                    rapportNumberController: rapportNumberController),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date de creation  ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomEditText(
                    rapportNumberController: rapportNumberController),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Type Association  ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: DropdownButton<String>(
                      hint: Container(
                        width: 300,
                        child: Text(
                          "   Type Association    ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      value: _pickingType,
                      items: <DropdownMenuItem<String>>[
                        DropdownMenuItem(
                          child: const Text('Type 1'),
                          value: "FileType.audio",
                        ),
                        DropdownMenuItem(
                          child: const Text('Type 2'),
                          value: "FileType.image",
                        ),
                        DropdownMenuItem(
                          child: const Text('Type 3'),
                          value: "FileType.video",
                        ),
                        DropdownMenuItem(
                          child: const Text('Type 4'),
                          value: "FileType.media",
                        ),
                        DropdownMenuItem(
                          child: const Text('Type 5'),
                          value: "FileType.any",
                        ),
                        DropdownMenuItem(
                          child: const Text('Type 6'),
                          value: "FileType.custom",
                        ),
                      ],
                      onChanged: (value) => setState(() {
                            _pickingType = value;
                          })),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Matricule cnss  ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomEditText(
                    rapportNumberController: rapportNumberController),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Matricule fiscale  ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomEditText(
                    rapportNumberController: rapportNumberController),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email Association  ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomEditText(
                    rapportNumberController: rapportNumberController),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Numero RNE  ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomEditText(
                    rapportNumberController: rapportNumberController),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fax Association  ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomEditText(
                    rapportNumberController: rapportNumberController),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(14),
          child: CustomText(
            text: "Informations responsable :",
            size: 30,
            weight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nom et prénom  ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomEditText(
                    rapportNumberController: rapportNumberController),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cin  ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomEditText(
                    rapportNumberController: rapportNumberController),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email  ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomEditText(
                    rapportNumberController: rapportNumberController),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Téléphone  ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomEditText(
                    rapportNumberController: rapportNumberController),
              ],
            ),
          ],
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
          readOnly: false,
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
