// import 'package:ecommerce_admin_tut/app_level/constants/constants.dart';
// import 'package:ecommerce_admin_tut/bloc_example/views/bloc_example.view.dart';
// import 'package:ecommerce_admin_tut/flutter2_widgets/views/flutter2.view.dart';
// import 'package:ecommerce_admin_tut/home/home.dart';
// import 'package:ecommerce_admin_tut/codepenz/codepen.dart';
// import 'package:ecommerce_admin_tut/data_table/data_table.dart';
// import 'package:ecommerce_admin_tut/game/game.dart';
// import 'package:ecommerce_admin_tut/google/google.dart';
// import 'package:ecommerce_admin_tut/home/screens/option_desktop.dart';
// import 'package:ecommerce_admin_tut/home/screens/option_fav.dart';
// import 'package:ecommerce_admin_tut/home/screens/option_mobile.dart';
// import 'package:ecommerce_admin_tut/hooks/hooks.dart';
// import 'package:ecommerce_admin_tut/iframe/iframe.dart';
// import 'package:ecommerce_admin_tut/location/location.dart';
// import 'package:ecommerce_admin_tut/ml/ml.dart';
// import 'package:ecommerce_admin_tut/nav/nav.dart';
// import 'package:ecommerce_admin_tut/parallax/parallax.dart';
// import 'package:ecommerce_admin_tut/sample/sample.dart';
// import 'package:ecommerce_admin_tut/search/search_history.dart';
// import 'package:ecommerce_admin_tut/streams/stream_form.dart';
// import 'package:ecommerce_admin_tut/using_selector/use_selector.dart';
// import 'package:ecommerce_admin_tut/wasm/wasm.dart';

// import 'package:flutter/material.dart';

// class Router {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       //

//       case ApplevelConstants.homeRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const Home(),
//           name: ApplevelConstants.homeRoute,
//         );

//       case ApplevelConstants.favRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const OptionFav(),
//           name: ApplevelConstants.favRoute,
//         );

//       case ApplevelConstants.desktopRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const OptionDesktop(),
//           name: ApplevelConstants.desktopRoute,
//         );

//       case ApplevelConstants.mobileRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const OptionMobile(),
//           name: ApplevelConstants.mobileRoute,
//         );

//       case ApplevelConstants.googleRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const GoogleCloneScreen(),
//           name: ApplevelConstants.googleRoute,
//         );

//       case ApplevelConstants.sampleRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const SamplePage(),
//           name: ApplevelConstants.sampleRoute,
//         );

//       case ApplevelConstants.iframeRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const IframeScreen(),
//           name: ApplevelConstants.iframeRoute,
//         );

//       case ApplevelConstants.parallaxRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const ParallaxScreen(),
//           name: ApplevelConstants.parallaxRoute,
//         );

//       case ApplevelConstants.locationRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const LocationScreen(),
//           name: ApplevelConstants.locationRoute,
//         );

//       case ApplevelConstants.mlRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const MLScreen(),
//           name: ApplevelConstants.mlRoute,
//         );

//       case ApplevelConstants.gameRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const GameScreen(),
//           name: ApplevelConstants.gameRoute,
//         );

//       case ApplevelConstants.dtRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const DataTableScreen(),
//           name: ApplevelConstants.dtRoute,
//         );

//       case ApplevelConstants.hooksRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const HooksScreen(),
//           name: ApplevelConstants.hooksRoute,
//         );

//       case ApplevelConstants.codepenRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const CodepenScreen(),
//           name: ApplevelConstants.codepenRoute,
//         );

//       case ApplevelConstants.streamsRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const StreamForm(),
//           name: ApplevelConstants.streamsRoute,
//         );

//       case ApplevelConstants.selectorsRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const UseSelector(),
//           name: ApplevelConstants.selectorsRoute,
//         );

//       case ApplevelConstants.visitedPagesRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const VisitedScreens(),
//           name: ApplevelConstants.visitedPagesRoute,
//         );

//       case ApplevelConstants.searchHistoryRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const SearchHistory(),
//           name: ApplevelConstants.searchHistoryRoute,
//         );

//       case ApplevelConstants.wasmRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const WasmScreen(),
//           name: ApplevelConstants.wasmRoute,
//         );

//       case ApplevelConstants.githubSearchRoute:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const BlocExampleScreen(),
//           name: ApplevelConstants.githubSearchRoute,
//         );

//       case ApplevelConstants.flutter2Route:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const Flutter2View(),
//           name: ApplevelConstants.flutter2Route,
//         );

//       default:
//         return _NoAnimationMaterialPageRoute<dynamic>(
//           builder: (_) => const Home(),
//           name: ApplevelConstants.homeRoute,
//         );
//     }
//   }
// }

// class UndefinedView extends StatelessWidget {
//   const UndefinedView({Key key, this.name}) : super(key: key);

//   /// Name of the route....
//   final String name;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Something went wrong for $name'),
//       ),
//     );
//   }
// }

// /// A MaterialPageRoute without any transition animations.
// class _NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
//   _NoAnimationMaterialPageRoute({
//     @required WidgetBuilder builder,
//     @required String name,
//     bool maintainState = true,
//     bool fullscreenDialog = false,
//   }) : super(
//           builder: builder,
//           maintainState: maintainState,
//           settings: RouteSettings(name: name),
//           fullscreenDialog: fullscreenDialog,
//         );

//   // @override
//   // Widget buildPage(
//   //   BuildContext context,
//   //   Animation<double> animation,
//   //   Animation<double> secondaryAnimation,
//   // ) {
//   //   return builder(context);
//   // }

//   @override
//   Widget buildTransitions(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) =>
//       child;
// }
