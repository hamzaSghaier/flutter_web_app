import 'package:ecommerce_admin_tut/main.dart';
import 'package:ecommerce_admin_tut/pages/CDC/CourriersPage.dart';
import 'package:ecommerce_admin_tut/pages/CDC/DownloadAccountingStandardsPage.dart';
import 'package:ecommerce_admin_tut/pages/CDC/EdocPage.dart';
import 'package:ecommerce_admin_tut/pages/CDC/FinancielManagmentPage.dart';
import 'package:ecommerce_admin_tut/pages/CDC/FollowReportPage.dart';
import 'package:ecommerce_admin_tut/pages/CDC/OnlineDepositePage.dart';
import 'package:ecommerce_admin_tut/pages/brands/brands_page.dart';
import 'package:ecommerce_admin_tut/pages/categories/categories_page.dart';
import 'package:ecommerce_admin_tut/pages/login/login.dart';
import 'package:ecommerce_admin_tut/pages/registration/registration.dart';
import 'package:ecommerce_admin_tut/widgets/layout/layout.dart';

import '../pages/home/home_page.dart';
import '../pages/orders/orders_page.dart';
import '../pages/products/products_page.dart';
import '../pages/users/users_page.dart';
import 'package:ecommerce_admin_tut/rounting/route_names.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomePage());
    case UsersRoute:
      return _getPageRoute(UsersPage());
    case ProductsRoute:
      return _getPageRoute(ProductsPage());
    case OrdersRoute:
      return _getPageRoute(OrdersPage());
    case LoginRoute:
      return _getPageRoute(LoginPage());
    case RegistrationRoute:
      return _getPageRoute(RegistrationPage());
    case LayoutRoute:
      return _getPageRoute(LayoutTemplate());
    case CategoriesRoute:
      return _getPageRoute(CategoriesPage());
    case BrandsRoute:
      return _getPageRoute(BrandsPage());
    case PageControllerRoute:
      return _getPageRoute(AppPagesController());

    case OnlineDepositeRoute:
      return _getPageRoute(OnlineDepositePage());
    case FollowReportRoute:
      return _getPageRoute(FollowReportPage());

    case DownloadAccountingStandardsRoute:
      return _getPageRoute(DownloadAccountingStandardsPage());
    case FinancielManagmentRoute:
      return _getPageRoute(FinancielManagmentPage());
    case CourriersRoute:
      return _getPageRoute(CourriersPage());
    case EdocRoute:
      return _getPageRoute(EdocPage());

    default:
      return _getPageRoute(LoginPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    fullscreenDialog: true,
    builder: (context) => child,
  );
}
