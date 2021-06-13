import 'package:ecommerce_admin_tut/locator.dart';
import 'package:ecommerce_admin_tut/pages/home/RowHeader.dart';
import 'package:ecommerce_admin_tut/provider/auth.dart';
import 'package:ecommerce_admin_tut/rounting/route_names.dart';
import 'package:ecommerce_admin_tut/services/navigation_service.dart';
import 'package:ecommerce_admin_tut/widgets/custom_text.dart';
import 'package:ecommerce_admin_tut/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AfterRegistration extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(15, 67, 88, 1),
        Color.fromRGBO(10, 54, 71, 1)
      ])),
      child: authProvider.status == Status.Authenticating
          ? Loading()
          : Scaffold(
              key: _key,
              backgroundColor: Colors.transparent,
              body: Center(
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RowHeader(),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0, 3),
                                  blurRadius: 24)
                            ]),
                        height: 400,
                        width: 1200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text:
                                  "Votre demande d'inscription  est enregistrer et en cours de traitement. ",
                              size: 22,
                              weight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text:
                                  "Nous vous enverrons votre mot de passe sur votre e-mail sous peu . Il vous suffira ensuite de se connecter ",
                              size: 20,
                              color: Colors.grey.shade800,
                              weight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text:
                                  "Nous vous enverrons un message si nous avons besoin d'informations supplémentaires de votre part. ",
                              size: 18,
                              color: Colors.grey.shade800,
                              weight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                decoration: BoxDecoration(color: Colors.indigo),
                                // ignore: deprecated_member_use
                                child: FlatButton(
                                  onPressed: () async {
                                    // if (!await authProvider.signIn()) {
                                    //   ScaffoldMessenger.of(context)
                                    //       .showSnackBar(SnackBar(
                                    //           content: Text(
                                    //               "Échec de la connexion")));
                                    //   return;
                                    // }
                                    // authProvider.clearController();

                                    locator<NavigationService>()
                                        .globalNavigateTo(LoginRoute, context);
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text: "Retour",
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
