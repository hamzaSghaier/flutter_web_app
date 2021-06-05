import 'package:ecommerce_admin_tut/helpers/enumerators.dart';
import 'package:ecommerce_admin_tut/locator.dart';
import 'package:ecommerce_admin_tut/pages/CDC/FollowReportPage.dart';
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
      height: 120,
      color: Colors.lightBlueAccent.withOpacity(0.2),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardItem(
              icon: Icons.monetization_on_outlined,
              title: "Depot en ligne des rapport",
              onPressed: () {
                appProvider.changeCurrentPage(DisplayedPage.ONLINEDEPOSITE);
                locator<NavigationService>().navigateTo(OnlineDepositeRoute);
              },
            ),
            CardItem(
              icon: Icons.shopping_basket_outlined,
              title: "suivi rapport",
              onPressed: () {
                appProvider.changeCurrentPage(DisplayedPage.FOLLOWREPORT);
                locator<NavigationService>().navigateTo(FollowReportRoute);
              },
            ),
            CardItem(
              icon: Icons.delivery_dining,
              title: "Téléchargement normes comptable",
              onPressed: () {
                appProvider.changeCurrentPage(
                    DisplayedPage.DOWNLOADACCOUNTINGSTANDARDS);
                locator<NavigationService>()
                    .navigateTo(DownloadAccountingStandardsRoute);
              },
            ),
            CardItem(
              icon: Icons.delivery_dining,
              title: "Gestion financière",
              onPressed: () {
                appProvider.changeCurrentPage(DisplayedPage.FINANCIELMANAGMENT);
                locator<NavigationService>()
                    .navigateTo(FinancielManagmentRoute);
              },
            ),
            CardItem(
              icon: Icons.delivery_dining,
              title: "Messageries",
              onPressed: () {
                appProvider.changeCurrentPage(DisplayedPage.COURRIERS);
                locator<NavigationService>().navigateTo(CourriersRoute);
              },
            ),
            CardItem(
              icon: Icons.delivery_dining,
              title: "E-doc",
              onPressed: () {
                appProvider.changeCurrentPage(DisplayedPage.EDOC);
                locator<NavigationService>().navigateTo(EdocRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
