import 'package:ecommerce_admin_tut/pages/home/FilePickerRegister.dart';
import 'package:ecommerce_admin_tut/pages/home/filePickerDemo.dart';
import 'package:ecommerce_admin_tut/widgets/cards/cards_list.dart';
import 'package:ecommerce_admin_tut/widgets/custom_text.dart';
import 'package:ecommerce_admin_tut/widgets/page_header.dart';
import 'package:ecommerce_admin_tut/widgets/charts/sales_chart.dart';
import 'package:ecommerce_admin_tut/widgets/top_buyer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageDesktop extends StatefulWidget {
  @override
  _HomePageDesktopState createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop> {
  final rapportNumberController = TextEditingController();
  final assocNameController = TextEditingController();
  final dateCreationController = TextEditingController();
  final typeAssocController = TextEditingController();
  final cnssController = TextEditingController();
  final matriculeController = TextEditingController();
  final mailController = TextEditingController();
  final rneController = TextEditingController();
  final telephoneController = TextEditingController();
  final cinController = TextEditingController();
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final villeController = TextEditingController();
  String representantLegale;
  bool finishLoad = false;
  void initData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    assocNameController.text = prefs.getString("raison_social");
    matriculeController.text = prefs.getString("matricule_fiscal");
    rneController.text = prefs.getString("numero_rne");
    villeController.text = prefs.getString("ville");
    telephoneController.text = prefs.getString("responsable_tel");
    mailController.text = prefs.getString("mail");
    nomController.text = prefs.getString("nom");
    prenomController.text = prefs.getString("prenom");
    cinController.text = prefs.getString("cin");
    representantLegale = prefs.getString("fonction");
    dateCreationController.text = prefs.getString("created_at");
    typeAssocController.text = prefs.getString("type");
    //_representantLegale = "Trésorerie";
    setState(() {
      finishLoad = true;
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    initData();
    super.initState();
  }

  String _pickingType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: PageHeader(
              text: "Mon compte",
            ),
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
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomEditText(rapportNumberController: assocNameController),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date de creation  ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
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
                        controller: dateCreationController,
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
                  )
                  // CustomEditText(rapportNumberController: dateCreationController),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Type Association  ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomEditText(rapportNumberController: typeAssocController),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 20.0),
                  //   child: DropdownButton<String>(
                  //       hint: Container(
                  //         width: 300,
                  //         child: Text(
                  //           "   Type Association    ",
                  //           style: TextStyle(
                  //               color: Colors.black,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 18),
                  //         ),
                  //       ),
                  //       value: _pickingType,
                  //       items: <DropdownMenuItem<String>>[
                  //         DropdownMenuItem(
                  //           child: const Text('Type 1'),
                  //           value: "FileType.audio",
                  //         ),
                  //         DropdownMenuItem(
                  //           child: const Text('Type 2'),
                  //           value: "FileType.image",
                  //         ),
                  //         DropdownMenuItem(
                  //           child: const Text('Type 3'),
                  //           value: "FileType.video",
                  //         ),

                  //         DropdownMenuItem(
                  //           child: const Text('Type 4'),
                  //           value: "FileType.media",
                  //         ),
                  //         DropdownMenuItem(
                  //           child: const Text('Type 5'),
                  //           value: "FileType.any",
                  //         ),
                  //         DropdownMenuItem(
                  //           child: const Text('Type 6'),
                  //           value: "FileType.custom",
                  //         ),
                  //       ],
                  //       onChanged: (value) => setState(() {
                  //             _pickingType = value;
                  //           })),
                  // )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Matricule cnss  ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomEditText(rapportNumberController: cnssController),
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
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomEditText(rapportNumberController: matriculeController),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email Association  ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomEditText(rapportNumberController: mailController),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Numero RNE  ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomEditText(rapportNumberController: rneController),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ville  ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomEditText(rapportNumberController: villeController),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: CustomText(
                  text: "Représentant légal :",
                  size: 30,
                  weight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 50,
              ),
              finishLoad
                  ? DropDownOfResponsableType(
                      initValue: representantLegale,
                    )
                  : Container()
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
                    "Nom  ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomEditText(rapportNumberController: nomController),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Prénom  ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomEditText(rapportNumberController: prenomController),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cin  ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomEditText(rapportNumberController: cinController),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Téléphone  ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomEditText(rapportNumberController: telephoneController),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 80,
          ),
          FilePickerRegister(name: "Statut"),
          SizedBox(
            height: 20,
          ),
          FilePickerRegister(name: "Publication jort"),
          SizedBox(
            height: 20,
          ),
          FilePickerRegister(name: "PV électif"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                      text: "Mettre à jour",
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
              SizedBox(
                width: 120,
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

class DropDownOfResponsableType extends StatefulWidget {
  final String initValue;
  const DropDownOfResponsableType({Key key, @required this.initValue}) : super(key: key);

  @override
  State<DropDownOfResponsableType> createState() => _DropDownOfResponsableTypeState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DropDownOfResponsableTypeState extends State<DropDownOfResponsableType> {
  String dropdownValue;
  @override
  void initState() {
    // TODO: implement initState
    dropdownValue = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 300,
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue,
        icon: const Icon(Icons.account_box),
        iconSize: 40,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: Colors.black,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['Trésorerie', 'Président', 'Secrétaire'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
                margin: EdgeInsets.all(10), child: Text(value, style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold))),
          );
        }).toList(),
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
