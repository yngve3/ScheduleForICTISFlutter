import 'package:flutter/material.dart';

abstract class CustomIcons {
  static Image backArrow = Image.asset("assets/icons/ic_back_arrow.png", width: 30, height: 30);
  static Image add = Image.asset("assets/icons/ic_add_black.png", width: 30, height: 30);
  static Image addWhite = Image.asset("assets/icons/ic_add_white.png", width: 30, height: 30);
  static Image close = Image.asset("assets/icons/ic_close.png", width: 30, height: 30);
  static Image task = Image.asset("assets/icons/ic_task.png", width: 30, height: 30);
  static Image event = Image.asset("assets/icons/ic_event.png", width: 30, height: 30);

  static TwoColorsImageAsset home = TwoColorsImageAsset("assets/icons/ic_home");
  static TwoColorsImageAsset schedule = TwoColorsImageAsset("assets/icons/ic_schedule");
  static TwoColorsImageAsset settings = TwoColorsImageAsset("assets/icons/ic_settings");
}

abstract class ImageAsset {
  ImageAsset(this.path);

  final String path;
}

class TwoColorsImageAsset extends ImageAsset{
  TwoColorsImageAsset(String path): super(path);

  Image image({
    double width = 27,
    double height = 27,
    bool active = false
  }) {
    String assetName = '$path/${path.split("/").last}${active ? "_active": ""}.png';

    return Image.asset(assetName, width: width, height: height);
  }
}


