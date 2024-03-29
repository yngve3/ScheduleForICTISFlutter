/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_add.png
  AssetGenImage get icAdd => const AssetGenImage('assets/icons/ic_add.png');

  /// File path: assets/icons/ic_back_arrow.png
  AssetGenImage get icBackArrow =>
      const AssetGenImage('assets/icons/ic_back_arrow.png');

  /// File path: assets/icons/ic_event.png
  AssetGenImage get icEvent => const AssetGenImage('assets/icons/ic_event.png');

  /// File path: assets/icons/ic_home.png
  AssetGenImage get icHome => const AssetGenImage('assets/icons/ic_home.png');

  /// File path: assets/icons/ic_list.png
  AssetGenImage get icList => const AssetGenImage('assets/icons/ic_list.png');

  /// File path: assets/icons/ic_schedule.png
  AssetGenImage get icSchedule =>
      const AssetGenImage('assets/icons/ic_schedule.png');

  /// File path: assets/icons/ic_settings.png
  AssetGenImage get icSettings =>
      const AssetGenImage('assets/icons/ic_settings.png');

  /// File path: assets/icons/ic_task.png
  AssetGenImage get icTask => const AssetGenImage('assets/icons/ic_task.png');

  /// File path: assets/icons/ic_time.png
  AssetGenImage get icTime => const AssetGenImage('assets/icons/ic_time.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        icAdd,
        icBackArrow,
        icEvent,
        icHome,
        icList,
        icSchedule,
        icSettings,
        icTask,
        icTime
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width = 30,
    double? height = 30,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
