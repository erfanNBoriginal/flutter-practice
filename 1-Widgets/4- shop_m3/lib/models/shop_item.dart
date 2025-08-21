import 'package:shop_m3/models/product.dart';

class ShopItem {
  //
  final Product product;

  int count;

  ShopItem({
    required this.product,
  }) : count = 1;
}
