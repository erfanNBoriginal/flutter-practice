import '/models/product.dart';

class ShopItem {
  //
  final Product product;

  int count;

  ShopItem({
    required this.product,
  }) : count = 1;
}
