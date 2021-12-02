import 'package:ecommerce_admin_tut/helpers/backend.dart';
import 'package:ecommerce_admin_tut/helpers/loaders.dart';
import 'package:ecommerce_admin_tut/pages/login/login.dart';
import 'package:ecommerce_admin_tut/provider/app_provider.dart';
import 'package:ecommerce_admin_tut/provider/auth.dart';
import 'package:ecommerce_admin_tut/provider/tables.dart';
import 'package:ecommerce_admin_tut/rounting/route_names.dart';
import 'package:ecommerce_admin_tut/rounting/router.dart';
import 'package:ecommerce_admin_tut/widgets/layout/layout.dart';
import 'package:ecommerce_admin_tut/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/costants.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: AppProvider.init()),
    ChangeNotifierProvider.value(value: AuthProvider.initialize()),
    ChangeNotifierProvider.value(value: TablesProvider.init()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digi 8 demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: generateRoute,
      initialRoute: PageControllerRoute,
    );
  }
}

class AppPagesController extends StatefulWidget {
  @override
  _AppPagesControllerState createState() => _AppPagesControllerState();
}

class _AppPagesControllerState extends State<AppPagesController> {
  @override
  Widget build(BuildContext context) {
    //AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // return LayoutTemplate();
    //return LoginPage();

    return FutureBuilder<dynamic>(
        future: BackendService.authenticate(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return ColorLoader2();
            case ConnectionState.done:
              // print("user Exist code ${snapshot.data.data["code"]}");
              if (snapshot.hasData) if (snapshot.data["code"] == 200) {
                //  return Text("snapshot.data ${snapshot.data}");
                return LoginPage();
                // return FutureBuilder<Object>(
                //     future: BackendService.getJwt(),
                //     builder: (context, snapshot2) {
                //       switch (snapshot2.connectionState) {
                //         case ConnectionState.none:
                //         case ConnectionState.active:
                //         case ConnectionState.waiting:
                //           return ColorLoader2();
                //         case ConnectionState.done:
                //           return Text("snapshot.data ${snapshot2.data}");
                //           break;
                //         default:
                //           return ColorLoader2();
                //       }
                //     });
              } else {
                return FailedWs(() => setState(() => {}));
              }
              else {
                return FailedWs(() => setState(() => {}));
              }

              break;
            default:
              return ColorLoader2();
          }
        });
  }
}

class FailedWs extends StatelessWidget {
  final VoidCallback refresh;
  FailedWs(this.refresh);
  @override
  Widget build(BuildContext context) {
    // By default, show a loading spinner.
    // return CircularProgressIndicator();
    return Material(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromRGBO(15, 67, 88, 1), Color.fromRGBO(10, 54, 71, 1)])),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //  Hero(tag: "Applogo", child: Image.asset("images/app_logo/logo.png", height: 50.0)),
            AlertDialog(
              content: Container(
                padding: EdgeInsets.all(30),
                child: Text("Un problème est survenu lors de la connexion aux serveurs.  Veuillez réessayer plus tard.",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 25)),
              ),
              actions: <Widget>[
                // ignore: deprecated_member_use
                FlatButton(
                  child: Text('Réessayer', style: TextStyle(color: Colors.green, fontWeight: FontWeight.normal, fontSize: 25)),
                  onPressed: refresh,
                ),
              ],
            ),
            // ColorLoader4(
            //   dotOneColor: challengesbuttoncolor.elementAt(0),
            //   dotTwoColor: challengesbuttoncolor.elementAt(3),
            //   dotThreeColor: challengesbuttoncolor.elementAt(4),
            //   dotType: DotType.circle,
            //   duration: Duration(seconds: 1),
            // )
            // CircularProgressIndicator(
            //   backgroundColor: Colors.black,
            //   valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
            // ),
          ]),
        ],
      ),
    );
  }
}
