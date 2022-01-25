import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  //text fontSize to be calculated by screen width
  static double smallText1;
  static double smallText2;
  static double mediumText1;
  static double mediumText2;
  static double largeText1;
  static double largeText2;

  static double simpleBorderRadius;
  static double normalpadding;
  static bool isTablet;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 300;
    blockSizeVertical = screenHeight / 300;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 200;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 200;

    //for devices with large width (tablets)
    if (blockSizeHorizontal > 5) {
      smallText1 = blockSizeHorizontal * 1.3;
      smallText2 = blockSizeHorizontal * 2;
      mediumText1 = blockSizeHorizontal * 2.5;
      mediumText2 = blockSizeHorizontal * 3.2;
      largeText1 = blockSizeHorizontal * 3.6;
      largeText2 = blockSizeHorizontal * 4.1;
      simpleBorderRadius = blockSizeHorizontal * 0.4;
      normalpadding = blockSizeHorizontal * 1;
      isTablet = true;
    } else {
      simpleBorderRadius = blockSizeHorizontal * 2;
      normalpadding = blockSizeHorizontal;
      smallText1 = blockSizeHorizontal * 3.3;
      smallText2 = blockSizeHorizontal * 4;
      mediumText1 = blockSizeHorizontal * 4.5;
      mediumText2 = blockSizeHorizontal * 5.2;
      largeText1 = blockSizeHorizontal * 5.6;
      largeText2 = blockSizeHorizontal * 6.1;
      isTablet = false;
    }
  }
}
