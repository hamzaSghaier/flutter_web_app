import 'package:ecommerce_admin_tut/helpers/backend.dart';
import 'package:ecommerce_admin_tut/helpers/loaders.dart';
import 'package:ecommerce_admin_tut/locator.dart';
import 'package:ecommerce_admin_tut/pages/home/RowHeader.dart';
import 'package:ecommerce_admin_tut/provider/auth.dart';
import 'package:ecommerce_admin_tut/rounting/route_names.dart';
import 'package:ecommerce_admin_tut/services/navigation_service.dart';
import 'package:ecommerce_admin_tut/widgets/custom_text.dart';
import 'package:ecommerce_admin_tut/widgets/layout/layout.dart';
import 'package:ecommerce_admin_tut/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  bool _waiting = true;
  callme() async {
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      _waiting = false;
    });
    setState(() {});
  }
  TextEditingController loginController = TextEditingController();

  TextEditingController psswordController = TextEditingController();
    bool isValiData() {
    

    if (loginController.text.isNotEmpty &&
            psswordController.text.isNotEmpty 

        )
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromRGBO(15, 67, 88, 1), Color.fromRGBO(10, 54, 71, 1)])),
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
                            boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0, 3), blurRadius: 24)]),
                        height: 400,
                        width: 500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Espace association",
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
                                    controller: loginController,
                                    decoration: InputDecoration(border: InputBorder.none, hintText: 'Identifiant', icon: Icon(Icons.email_outlined)),
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
                                    controller: psswordController,
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: InputDecoration(border: InputBorder.none, hintText: 'Mot de passe', icon: Icon(Icons.lock_open)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomText(
                                    text: "Mot de passe oublié?",
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                decoration: BoxDecoration(color: Colors.indigo),
                                child: FlatButton(
                                  onPressed: () async {
                                          if (isValiData()) {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
                              _showLoadingDialog(context);
                              if (true) {
                                BackendService.login(
                                        loginController.text,
                                        psswordController.text,
                               )
                                    .then((value) => {
                                          print('valuee $value'),
                                          if (value["code"] == 200)
                                            {
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                                return  LayoutTemplate();
                                              }))
                                            }
                                          else
                                            {_showErrorDialog(context, " ")}
                                        });
                              }
                            } else {
                              _showErrorDialog(context, " ");
                            }

                                   // _showErrorDialog(context, " ");
                                    //callme();
                           
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text: "Connexion",
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
                                    text: "Vous n'avez pas de compte? ",
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        locator<NavigationService>().globalNavigateTo(RegistrationRoute, context);
                                      },
                                      child: CustomText(
                                        text: "Inscrivez-vous ici. ",
                                        size: 16,
                                        color: Colors.indigo,
                                      )),
                                ],
                              ),
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
                  child: _waiting
                      ? ColorLoader2()
                      : Text("Veuillez vérifier les données saisies. $msg",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 25)),
                )),
            actions: <Widget>[
             
              _waiting
                  ? Container()
                   // ignore: deprecated_member_use
                  : FlatButton(
                      child: Text('Réessayer', style: TextStyle(color: Colors.green, fontWeight: FontWeight.normal, fontSize: 25)),
                      onPressed: () => {Navigator.of(context).pop()},
                    ),
            ]);
      },
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
                child: Text("Veuillez vérifier les données saisies. $msg",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 25)),
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