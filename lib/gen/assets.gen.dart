/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/back_img.png
  AssetGenImage get backImg =>
      const AssetGenImage('assets/images/back_img.png');

  /// File path: assets/images/ic_megafon.png
  AssetGenImage get icMegafon =>
      const AssetGenImage('assets/images/ic_megafon.png');

  /// File path: assets/images/photo_first_recipe.png
  AssetGenImage get photoFirstRecipe =>
      const AssetGenImage('assets/images/photo_first_recipe.png');

  /// File path: assets/images/photo_five_recipe.png
  AssetGenImage get photoFiveRecipe =>
      const AssetGenImage('assets/images/photo_five_recipe.png');

  /// File path: assets/images/photo_four_recipe.png
  AssetGenImage get photoFourRecipe =>
      const AssetGenImage('assets/images/photo_four_recipe.png');

  /// File path: assets/images/photo_second_recipe.png
  AssetGenImage get photoSecondRecipe =>
      const AssetGenImage('assets/images/photo_second_recipe.png');

  /// File path: assets/images/photo_seven_recipe.png
  AssetGenImage get photoSevenRecipe =>
      const AssetGenImage('assets/images/photo_seven_recipe.png');

  /// File path: assets/images/photo_six_recipe.png
  AssetGenImage get photoSixRecipe =>
      const AssetGenImage('assets/images/photo_six_recipe.png');

  /// File path: assets/images/photo_third_recipe.png
  AssetGenImage get photoThirdRecipe =>
      const AssetGenImage('assets/images/photo_third_recipe.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        backImg,
        icMegafon,
        photoFirstRecipe,
        photoFiveRecipe,
        photoFourRecipe,
        photoSecondRecipe,
        photoSevenRecipe,
        photoSixRecipe,
        photoThirdRecipe
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
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
    double? width,
    double? height,
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
