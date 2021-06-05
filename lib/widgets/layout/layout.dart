import 'package:ecommerce_admin_tut/helpers/Configuration.dart';
import 'package:ecommerce_admin_tut/rounting/route_names.dart';
import 'package:ecommerce_admin_tut/rounting/router.dart';
import 'package:ecommerce_admin_tut/services/navigation_service.dart';
import 'package:ecommerce_admin_tut/widgets/cards/cards_list.dart';
import 'package:ecommerce_admin_tut/widgets/side_menu/side_menu.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';
import '../navbar/navigation_bar.dart';

class LayoutTemplate extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      drawer: Container(
        color: Colors.white,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountEmail: Text((Configuration.email != null)
                  ? Configuration.email
                  : "associations@gmail.com"),
              accountName:
                  Text((Configuration.name != null) ? Configuration.name : " "),
            ),
            ListTile(
              title: Text("profile"),
              leading: Icon(Icons.book),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          CardsList(),
          Expanded(
            child: Column(
              children: [
                NavigationBar(),
                Expanded(
                  child: Navigator(
                    key: locator<NavigationService>().navigatorKey,
                    onGenerateRoute: generateRoute,
                    initialRoute: HomeRoute,
                  ),
                )
              ],
            ),
          )
          // Row(
          //   children: [
          //   //  SideMenu(),
          //     Expanded(
          //       child: Column(
          //         children: [
          //           NavigationBar(),
          //           Expanded(
          //             child: Navigator(
          //               key: locator<NavigationService>().navigatorKey,
          //               onGenerateRoute: generateRoute,
          //               initialRoute: HomeRoute,
          //             ),
          //           )
          //         ],
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
