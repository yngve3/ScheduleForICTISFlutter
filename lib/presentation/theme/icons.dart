import 'package:flutter/material.dart';

abstract class CustomIcons {
  static ImageAsset backArrow = SimpleImageAsset("assets/icons/ic_back_arrow");
  static ImageAsset add = SimpleImageAsset("assets/icons/ic_add_black");
  static ImageAsset addWhite = SimpleImageAsset("assets/icons/ic_add_white");
  static ImageAsset close = SimpleImageAsset("assets/icons/ic_close");
  static ImageAsset task = SimpleImageAsset("assets/icons/ic_task");
  static ImageAsset event = SimpleImageAsset("assets/icons/ic_event");
  static ImageAsset eventBlack = SimpleImageAsset("assets/icons/ic_event_black");
  static ImageAsset time = SimpleImageAsset("assets/icons/ic_time_black");
  static ImageAsset list = SimpleImageAsset("assets/icons/ic_list_black");

  static BottomBarImageAsset home = BottomBarImageAsset("assets/icons/ic_home");
  static BottomBarImageAsset schedule = BottomBarImageAsset("assets/icons/ic_schedule");
  static BottomBarImageAsset settings = BottomBarImageAsset("assets/icons/ic_settings");
}

abstract class ImageAsset {
  ImageAsset(this.path);

  final String path;
  Image image({double width, double height});
}

class SimpleImageAsset extends ImageAsset {
  SimpleImageAsset(super.path);

  @override
  Image image({
    double width = 30,
    double height = 30,
  }) {
    String assetName = '$path.png';
    return Image.asset(assetName, width: width, height: height);
  }
}

class BottomBarImageAsset extends ImageAsset {
  BottomBarImageAsset(super.path);

  @override
  Image image({
    double width = 27,
    double height = 27,
    bool active = false
  }) {
    String assetName = '$path/${path.split("/").last}${active ? "_active": ""}.png';

    return Image.asset(assetName, width: width, height: height);
  }
}


