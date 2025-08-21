import 'package:flutter/material.dart' as M;
import 'package:flutter/widgets.dart';

abstract class Images {
  //
  static const logo = 'assets/logos/Amazon.png';

  static const emptyCart = 'assets/imgs/vectors/empty_cart.png';

  static const emptyFav = 'assets/imgs/vectors/empty_fav.png';
}

abstract class Icons {
  //
  static const store = 'assets/icons/store.png';
  static const checkBoxEmpty = 'assets/icons/checkbox_empty.png';
  static const checkBoxFill = 'assets/icons/checkbox_fill.png';
  static const radioEmpty = 'assets/icons/radio_empty.png';
  static const radioFill = 'assets/icons/radio_fill.png';
  static const arrowLeft = 'assets/icons/arrow_left.png';
  static const bell = 'assets/icons/bell.png';
  static const filter = 'assets/icons/filter.png';
  static const humburger = 'assets/icons/humburger.png';
  static const add = 'assets/icons/add.png';
  static const min = 'assets/icons/min.png';
  static const category = 'assets/icons/category.png';
  static const favorites = 'assets/icons/favorites.png';
  static const profile = 'assets/icons/profile.png';
  static const shopCart = 'assets/icons/shop_cart.png';
  static const required = 'assets/icons/required.png';
  static const search = 'assets/icons/search.png';
  static const clear = 'assets/icons/clear.png';
}

class Image extends M.StatelessWidget {
  //
  final String path;

  final double? height;

  final double? width;

  final Color? color;

  final BoxFit fit;

  const Image({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.contain,
  });

  const Image.icon({
    super.key,
    required this.path,
    double size = 24.0,
    this.color,
  })  : height = size,
        width = size,
        fit = BoxFit.contain;

  @override
  M.Widget build(M.BuildContext context) {
    return M.Image.asset(
      path,
      fit: fit,
      width: width,
      color: color,
      height: height,
    );
  }
}

class NetworkImage extends M.StatelessWidget {
  //
  final String url;

  final BoxFit? fit;

  const NetworkImage({
    super.key,
    required this.url,
    this.fit,
  });

  @override
  M.Widget build(M.BuildContext context) {
    return M.Image.network(
      url,
      fit: fit,
    );
  }
}
