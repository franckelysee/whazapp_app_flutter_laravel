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
  static const spaceSmall = SizedBox(height: 25,);
  static final spaceMedium = SizedBox(height: screenHeight! * 0.05,);
  static final spaceLarge = SizedBox(height: screenHeight! * 0.08,);


  // textForm field border
  static const outlinedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );
  static const focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.greenAccent),
  );
  static const errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.redAccent),
  );

  static const primaryColor = Colors.greenAccent;
}