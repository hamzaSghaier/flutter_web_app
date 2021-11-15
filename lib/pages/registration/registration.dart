import 'package:ecommerce_admin_tut/helpers/enumerators.dart';
import 'package:ecommerce_admin_tut/pages/CDC/OnlineDepositePage.dart';
import 'package:ecommerce_admin_tut/pages/CDC/association_entity.dart';
import 'package:ecommerce_admin_tut/pages/CDC/backend.dart';
import 'package:ecommerce_admin_tut/pages/home/AfterRegister.dart';
import 'package:ecommerce_admin_tut/pages/home/FilePickerRegister.dart';
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

  bool isValiData() {
    if (raisonSocialController.text.isNotEmpty &&
        villeController.text.isNotEmpty &&
        gouvernoratController.text.isNotEmpty &&
        matriculeController.text.isNotEmpty &&
        typeController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty)
      return true;
    else
      return false;
  }

  FutureBuilder<Association> buildFutureBuilder() {
    return FutureBuilder<Association>(
      future: BackendApi.signIn(raisonSocialController.text, villeController.text, gouvernoratController.text, matriculeController.text,
          typeController.text, emailController.text, passwordController.text),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text("Connection success");
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return CircularProgressIndicator();
      },
    );
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            controller: typeController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type',
                              // icon: Icon(Icons.person_outline)
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
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
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20),
                    //   child: Container(
                    //     decoration: BoxDecoration(color: Colors.grey[200]),
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(left: 8.0),
                    //       child: TextField(
                    //         controller: passwordController,
                    //         decoration: InputDecoration(
                    //             border: InputBorder.none,
                    //             hintText: 'Password',
                    //             icon: Icon(Icons.lock_open)),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: CustomText(
                            text: "Représentant légal :",
                            size: 20,
                            weight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        DropDownOfResponsableType()
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
                                  hintText: 'Prénom',
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
                                  hintText: 'Téléphone',
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.indigo),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          onPressed: () async {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return AfterRegistration();
                            }));

                            //   if (isValiData()) {
                            // if (true) {
                            //   BackendApi.signIn(
                            //           raisonSocialController.text,
                            //           villeController.text,
                            //           gouvernoratController.text,
                            //           matriculeController.text,
                            //           typeController.text,
                            //           emailController.text,
                            //           passwordController.text)
                            //       .then((value) => {
                            //             Navigator.of(context).push(
                            //                 MaterialPageRoute(
                            //                     builder: (context) {
                            //               return OnlineDepositePage();
                            //             }))
                            //             // appProvider.changeCurrentPage(
                            //             //     DisplayedPage.ONLINEDEPOSITE),
                            //             // locator<NavigationService>()
                            //             //     .navigateTo(OnlineDepositeRoute)
                            //           });
                            // }

                            //   if (!await authProvider.signUp()) {
                            //     ScaffoldMessenger.of(context).showSnackBar(
                            //         SnackBar(
                            //             content:
                            //                 Text("Registration failed!")));
                            //     return;
                            //   }

                            //   locator<NavigationService>()
                            //       .globalNavigateTo(LayoutRoute, context);

                            //
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
                            text: "Vous ètes déjà inscrit ? ",
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

class DropDownOfResponsableType extends StatefulWidget {
  const DropDownOfResponsableType({Key key}) : super(key: key);

  @override
  State<DropDownOfResponsableType> createState() => _DropDownOfResponsableTypeState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DropDownOfResponsableTypeState extends State<DropDownOfResponsableType> {
  String dropdownValue = 'Trésorerie';

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
        items: <String>['Trésorerie', 'Président', 'Secrétaire'].map<DropdownMenuItem<String>>((String value) {
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
