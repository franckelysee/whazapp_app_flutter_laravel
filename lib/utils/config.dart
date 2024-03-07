import 'package:flutter/material.dart';

class Config {
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;


  void init(BuildContext context){
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    screenHeight = mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
  }

  static get widthSize{
    return screenWidth;
  }
  static get heightSize{
    return screenHeight;
  }
  static get blockSizeHorizontalSize{
    return blockSizeHorizontal;
  }
  static get blockSizeVerticalSize{
    return blockSizeVertical;
  }

  // definir la hauteur des espacement
  static const spanceSmall = SizedBox(height: 25,);
  static final spanceMedium = SizedBox(height: screenHeight! * 0.05,);
  static final spanceLarge = SizedBox(height: screenHeight! * 0.1,);


  // textForm field border

}