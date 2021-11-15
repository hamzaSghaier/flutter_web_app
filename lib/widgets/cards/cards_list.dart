import 'package:ecommerce_admin_tut/helpers/enumerators.dart';
import 'package:ecommerce_admin_tut/locator.dart';
import 'package:ecommerce_admin_tut/pages/CDC/FollowReportPage.dart';
import 'package:ecommerce_admin_tut/pages/home/RowHeader.dart';
import 'package:ecommerce_admin_tut/pages/login/login.dart';
import 'package:ecommerce_admin_tut/provider/app_provider.dart';
import 'package:ecommerce_admin_tut/provider/tables.dart';
import 'package:ecommerce_admin_tut/rounting/route_names.dart';
import 'package:ecommerce_admin_tut/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'card_item.dart';

class CardsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    TablesProvider tablesProvider = Provider.of<TablesProvider>(context);

    return Container(
      height: 320,
      color: Color.fromRGBO(15, 67, 88, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RowHeader(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardItem(
                  icon: Icons.monetization_on_outlined,
                  title: "Dépot en ligne des rapports",
                  onPressed: () {
                    appProvider.changeCurrentPage(DisplayedPage.ONLINEDEPOSITE);
                    locator<NavigationService>().navigateTo(OnlineDepositeRoute);
                  },
                ),
                CardItem(
                  icon: Icons.shopping_basket_outlined,
                  title: "Suivi rapports",
                  onPressed: () {
                    appProvider.changeCurrentPage(DisplayedPage.FOLLOWREPORT);
                    locator<NavigationService>().navigateTo(FollowReportRoute);
                  },
                ),
                CardItem(
                  icon: Icons.delivery_dining,
                  title: "Téléchargement normes comptable",
                  onPressed: () {
                    appProvider.changeCurrentPage(DisplayedPage.DOWNLOADACCOUNTINGSTANDARDS);
                    locator<NavigationService>().navigateTo(DownloadAccountingStandardsRoute);
                  },
                ),

                // CardItem(
                //   icon: Icons.delivery_dining,
                //   title: "Gestion financière",
                //   onPressed: () {
                //     appProvider.changeCurrentPage(DisplayedPage.FINANCIELMANAGMENT);
                //     locator<NavigationService>()
                //         .navigateTo(FinancielManagmentRoute);
                //   },
                // ),
                CardItem(
                  icon: Icons.delivery_dining,
                  title: "Messageries",
                  onPressed: () {
                    appProvider.changeCurrentPage(DisplayedPage.COURRIERS);
                    locator<NavigationService>().navigateTo(CourriersRoute);
                  },
                ),
                CardItem(
                  icon: Icons.monetization_on_outlined,
                  title: "Mon Compte",
                  onPressed: () {
                    appProvider.changeCurrentPage(DisplayedPage.ONLINEDEPOSITE);
                    locator<NavigationService>().navigateTo(HomeRoute);
                  },
                ),
                // CardItem(
                //   icon: Icons.delivery_dining,
                //   title: "E-doc",
                //   onPressed: () {
                //     appProvider.changeCurrentPage(DisplayedPage.EDOC);
                //     locator<NavigationService>().navigateTo(EdocRoute);
                //   },
                // ),
                Container(
                  margin: EdgeInsets.only(left: 200),
                  child: Material(
                    color: Colors.transparent,
                    child: Center(
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.logout),
                          color: Colors.black,
                          iconSize: 70,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
