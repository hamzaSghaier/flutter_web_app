import 'package:ecommerce_admin_tut/helpers/backend.dart';
import 'package:ecommerce_admin_tut/helpers/enumerators.dart';
import 'package:ecommerce_admin_tut/helpers/loaders.dart';
import 'package:ecommerce_admin_tut/pages/CDC/OnlineDepositePage.dart';
import 'package:ecommerce_admin_tut/pages/CDC/association_entity.dart';
import 'package:ecommerce_admin_tut/pages/home/AfterRegister.dart';
import 'package:ecommerce_admin_tut/pages/home/FilePickerRegister.dart';
import 'package:ecommerce_admin_tut/pages/login/login.dart';
import 'package:ecommerce_admin_tut/provider/app_provider.dart';
import 'package:ecommerce_admin_tut/provider/auth.dart';
import 'package:ecommerce_admin_tut/rounting/route_names.dart';
import 'package:ecommerce_admin_tut/services/navigation_service.dart';
import 'package:ecommerce_admin_tut/widgets/custom_text.dart';
import 'package:ecommerce_admin_tut/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController raisonSocialController = TextEditingController();

  TextEditingController villeController = TextEditingController();
  TextEditingController gouvernoratController = TextEditingController();
  TextEditingController matriculeController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController cinController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController otherTypeController = TextEditingController();
  final GlobalKey<FilePickerRegisterState> _keypublicationJorde = GlobalKey();
  final GlobalKey<FilePickerRegisterState> _keypvElictif = GlobalKey();
  final GlobalKey<FilePickerRegisterState> _keystatus = GlobalKey();
  final GlobalKey<DropDownOfResponsableTypeState> _keyResponsable = GlobalKey();
  final GlobalKey<DropDownOfTypeAssocState> _keyTypeAssoc = GlobalKey();
  final GlobalKey<FilePickerRegisterState> _keyCinRecto = GlobalKey();
  final GlobalKey<FilePickerRegisterState> _keyCinVerso = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    // raisonSocialController.text = "Hilalo";
    // villeController.text = "mahdia";
    // gouvernoratController.text = "chebba";
    // matriculeController.text = "CH123456";
    // emailController.text = "chebba@mail.tn";
    // nomController.text = "Hamza";
    // cinController.text = "12345645";
    // prenomController.text = "Sghaier";
    // telephoneController.text = "50145579";
    super.initState();
  }

  bool isValiData() {
    //print("111 ${_keypublicationJorde.currentState.getPath()}");

    if (raisonSocialController.text.isNotEmpty &&
            villeController.text.isNotEmpty &&
            gouvernoratController.text.isNotEmpty &&
            matriculeController.text.isNotEmpty &&
            emailController.text.isNotEmpty &&
            nomController.text.isNotEmpty &&
            cinController.text.isNotEmpty &&
            prenomController.text.isNotEmpty &&
            telephoneController.text.isNotEmpty &&
            _keypublicationJorde.currentState.getFile() != null &&
            _keypublicationJorde.currentState.getFile() != null &&
            _keypublicationJorde.currentState.getFile() != null &&
            _keyCinRecto.currentState.getFile() != null &&
            _keyCinVerso.currentState.getFile() != null
        // _keystatus.currentState.directoryPath != null
        )
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromRGBO(15, 67, 88, 1), Color.fromRGBO(10, 54, 71, 1)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            color: Colors.red,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0, 3), blurRadius: 24)]),
              height: 1200,
              width: 800,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    CustomText(
                      text: "Demande d'inscription",
                      size: 22,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            controller: raisonSocialController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Raison social',
                              // icon: Icon(Icons.person_outline)
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            controller: villeController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Ville',
                              //icon: Icon(Icons.person_outline)
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            controller: gouvernoratController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Gouvernorat',
                              //icon: Icon(Icons.person_outline)
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            controller: matriculeController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Matricule Fiscale',
                              //icon: Icon(Icons.person_outline)
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: CustomText(
                          text: "Type :",
                          size: 16,
                          weight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      DropDownOfTypeAssoc(
                        key: _keyTypeAssoc,
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            controller: otherTypeController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'autre',
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20),
                    //   child: Container(
                    //     decoration: BoxDecoration(color: Colors.grey[200]),
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(left: 8.0),
                    //       child: TextField(
                    //         controller: typeController,
                    //         decoration: InputDecoration(
                    //           border: InputBorder.none,
                    //           hintText: 'Type',
                    //           // icon: Icon(Icons.person_outline)
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // DropDownOfTypeAssoc(),
                    SizedBox(
                      height: 20,
                    ),
                    FilePickerRegister(
                      name: "Statut",
                      key: _keystatus,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FilePickerRegister(
                      name: "Publication jort",
                      key: _keypublicationJorde,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FilePickerRegister(
                      name: "PV ??lectif",
                      key: _keypvElictif,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: CustomText(
                            text: "Repr??sentant l??gal :",
                            size: 20,
                            weight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        DropDownOfResponsableType(
                          key: _keyResponsable,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: 350,
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextField(
                                controller: nomController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Nom',
                                  // icon: Icon(Icons.person_outline)
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: 350,
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextField(
                                controller: prenomController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Pr??nom',
                                  // icon: Icon(Icons.person_outline)
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: 350,
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextField(
                                controller: cinController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Cin',
                                  // icon: Icon(Icons.person_outline)
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: 350,
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextField(
                                controller: telephoneController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'T??l??phone',
                                  // icon: Icon(Icons.person_outline)
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(border: InputBorder.none, hintText: 'email', icon: Icon(Icons.email_outlined)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FilePickerRegister(
                      name: "Carte d'identit?? (Recto) ",
                      key: _keyCinRecto,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FilePickerRegister(
                      name: "Carte d'identit?? (Verso) ",
                      key: _keyCinVerso,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.indigo),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          onPressed: () async {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            //   return AfterRegistration();
                            // }));

                            if (isValiData()) {
                              _showLoadingDialog(context);
                              if (true) {
                                BackendService.signIn(
                                        raisonSocialController.text,
                                        villeController.text,
                                        gouvernoratController.text,
                                        matriculeController.text,
                                        otherTypeController.text.isEmpty ? _keyTypeAssoc.currentState.getTypeAssoc() : otherTypeController.text,
                                        emailController.text,
                                        nomController.text,
                                        prenomController.text,
                                        cinController.text,
                                        telephoneController.text,
                                        _keyResponsable.currentState.getResponsable(),
                                        _keypublicationJorde.currentState.getFile()
                                        // _keypvElictif.currentState.getPath(),
                                        // _keystatus.currentState.getPath()
                                        )
                                    //  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                    //                     return AfterRegistration();
                                    //                   }))
                                    .then((value) => {
                                          print('value of sign in  $value'),
                                          if (value["code"] == 200)
                                            {
                                              BackendService.uploadDocument(_keypublicationJorde.currentState.getFile(), "publicationJorde")
                                                  .then((value) => {
                                                        print('value of uploadDocument  $value'),
                                                        if (value["code"] == 200)
                                                          {
                                                            BackendService.uploadDocument(_keypvElictif.currentState.getFile(), "pvElictif")
                                                                .then((value) => {
                                                                      print('value of uploadDocument  $value'),
                                                                      if (value["code"] == 200)
                                                                        {
                                                                          BackendService.uploadDocument(_keystatus.currentState.getFile(), "status")
                                                                              .then((value) => {
                                                                                    print('value of uploadDocument  $value'),
                                                                                    if (value["code"] == 200)
                                                                                      {
                                                                                        BackendService.uploadDocument(
                                                                                                _keyCinRecto.currentState.getFile(), "cin_recto")
                                                                                            .then((value) => {
                                                                                                  print('value of uploadDocument  $value'),
                                                                                                  if (value["code"] == 200)
                                                                                                    {
                                                                                                      BackendService.uploadDocument(
                                                                                                              _keyCinVerso.currentState.getFile(),
                                                                                                              "cin_verso")
                                                                                                          .then((value) => {
                                                                                                                print(
                                                                                                                    'value of uploadDocument  $value'),
                                                                                                                if (value["code"] == 200)
                                                                                                                  {
                                                                                                                    Navigator.of(context).push(
                                                                                                                        MaterialPageRoute(
                                                                                                                            builder: (context) {
                                                                                                                      return AfterRegistration();
                                                                                                                    }))
                                                                                                                  }
                                                                                                                else
                                                                                                                  {
                                                                                                                    _showErrorDialog(
                                                                                                                        context, value["body"])
                                                                                                                  }
                                                                                                              }),
                                                                                                    }
                                                                                                  else
                                                                                                    {_showErrorDialog(context, value["body"])}
                                                                                                }),
                                                                                      }
                                                                                    else
                                                                                      {_showErrorDialog(context, value["body"])}
                                                                                  }),
                                                                        }
                                                                      else
                                                                        {_showErrorDialog(context, value["body"])}
                                                                    }),
                                                          }
                                                        else
                                                          {_showErrorDialog(context, value["body"])}
                                                      }),
                                            }
                                          else
                                            {_showErrorDialog(context, value["body"])}
                                        });
                              }
                            } else {
                              _showErrorDialog(context, " ");
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: "Envoyer",
                                  size: 22,
                                  color: Colors.white,
                                  weight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Vous ??tes d??j?? inscrit ? ",
                            size: 16,
                            color: Colors.grey,
                          ),
                          GestureDetector(
                              onTap: () {
                                locator<NavigationService>().globalNavigateTo(LoginRoute, context);
                              },
                              child: CustomText(
                                text: "Se connecter.. ",
                                size: 16,
                                color: Colors.indigo,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DropDownOfTypeAssoc extends StatefulWidget {
  const DropDownOfTypeAssoc({Key key}) : super(key: key);

  @override
  State<DropDownOfTypeAssoc> createState() => DropDownOfTypeAssocState();
}

/// This is the private State class that goes with MyStatefulWidget.
class DropDownOfTypeAssocState extends State<DropDownOfTypeAssoc> {
  String dropdownValue = 'Citoyennet?? et gouvernance';

  String getTypeAssoc() {
    return dropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue,
        icon: const Icon(Icons.account_box),
        iconSize: 1,
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
        items: <String>[
          'Agriculture',
          'Aide aux handicap??s',
          'Aide humanitaire',
          "Arts / Culture",
          "Citoyennet?? et gouvernance",
          "Droit de l\'enfant",
          "Droit des femmes"
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
                margin: EdgeInsets.all(7), child: Text(value, style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold))),
          );
        }).toList(),
      ),
    );
  }
}

class DropDownOfResponsableType extends StatefulWidget {
  const DropDownOfResponsableType({Key key}) : super(key: key);

  @override
  State<DropDownOfResponsableType> createState() => DropDownOfResponsableTypeState();
}

/// This is the private State class that goes with MyStatefulWidget.
class DropDownOfResponsableTypeState extends State<DropDownOfResponsableType> {
  String dropdownValue = 'Tr??sorerie';

  String getResponsable() {
    return dropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue,
        icon: const Icon(Icons.account_box),
        iconSize: 30,
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
        items: <String>['Tr??sorerie', 'Pr??sident', 'Secr??taire'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
                margin: EdgeInsets.all(7), child: Text(value, style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold))),
          );
        }).toList(),
      ),
    );
  }
}

void _showLoadingDialog(BuildContext context) {
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
              // margin: EdgeInsets.all(40),
              //width: 400,
              child: ColorLoader2(),
            ),
          ),
        ),
      );
    },
  );
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
                  Center(
                child: Text("Veuillez v??rifier les donn??es saisies. $msg",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 25)),
              )),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              child: Text('R??essayer', style: TextStyle(color: Colors.green, fontWeight: FontWeight.normal, fontSize: 25)),
              onPressed: () => {Navigator.of(context).pop()},
            ),
          ]);
    },
  );
}
