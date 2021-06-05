import 'package:ecommerce_admin_tut/helpers/enumerators.dart';
import 'package:ecommerce_admin_tut/pages/CDC/OnlineDepositePage.dart';
import 'package:ecommerce_admin_tut/pages/CDC/association_entity.dart';
import 'package:ecommerce_admin_tut/pages/CDC/backend.dart';
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
      future: BackendApi.signIn(
          raisonSocialController.text,
          villeController.text,
          gouvernoratController.text,
          matriculeController.text,
          typeController.text,
          emailController.text,
          passwordController.text),
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
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.blue, Colors.indigo.shade600])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            color: Colors.red,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 3),
                        blurRadius: 24)
                  ]),
              height: 800,
              width: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "REGISTRATION",
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'email',
                              icon: Icon(Icons.email_outlined)),
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
                          controller: passwordController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              icon: Icon(Icons.lock_open)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.indigo),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        onPressed: () async {
                          //   if (isValiData()) {
                          if (true) {
                            BackendApi.signIn(
                                    raisonSocialController.text,
                                    villeController.text,
                                    gouvernoratController.text,
                                    matriculeController.text,
                                    typeController.text,
                                    emailController.text,
                                    passwordController.text)
                                .then((value) => {
                               Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                  return OnlineDepositePage( );
                                }))
                                      // appProvider.changeCurrentPage(
                                      //     DisplayedPage.ONLINEDEPOSITE),
                                      // locator<NavigationService>()
                                      //     .navigateTo(OnlineDepositeRoute)
                                    });
                          }

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
                                text: "REGISTER",
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
                          text: "Vous etes déjà inscrit ? ",
                          size: 16,
                          color: Colors.grey,
                        ),
                        GestureDetector(
                            onTap: () {
                              locator<NavigationService>()
                                  .globalNavigateTo(LoginRoute, context);
                            },
                            child: CustomText(
                              text: "Sign in here.. ",
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
    );
  }
}
