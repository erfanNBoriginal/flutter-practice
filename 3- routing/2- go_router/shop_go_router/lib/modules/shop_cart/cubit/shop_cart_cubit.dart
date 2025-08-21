import 'dart:async';

import 'package:bloc/bloc.dart';
import '/domains/store/models/product.dart';
import '/domains/store/models/shop_item.dart';
import '/domains/store/store_repository.dart';

part 'shop_cart_state.dart';

class ShopCartCubit extends Cubit<ShopCartState> {
  //
  final StoreRepository storeRepo;

  Timer? updateTimer;

  ShopCartCubit({required this.storeRepo}) : super(ShopCartState.init()) {
    onInit();
  }

  Future<void> onInit() async {
    emit(state.copyWith(loading: true));

    final res = await storeRepo.getShopItems();

    emit(state.copyWith(shopItems: res));
    final total = await getTotal();
    emit(state.copyWith(loading: false, totalCost: total));
  }

  Future<int> getTotal() async {
    final res = state.shopItems;
    int totalTemp = 0;

    for (var i = 0; i < res.length; i++) {
      totalTemp = totalTemp + (res[i].product.price * res[i].count);
    }

    // emit(state.copyWith(totalCost: totalTemp));
    return totalTemp;
  }

  Future<void> onRefresh() async {
    emit(state.copyWith(loading: true));
    final res = await storeRepo.getShopItems();
    emit(state.copyWith(shopItems: res));
    final total = await getTotal();
    emit(state.copyWith(loading: false, totalCost: total));
  }

  void onTotalChanged() {}

  void onAddToShopCartPressed(Product data) async {
    //
    final shopItemsTemp = [...state.shopItems];

    final dataInex = shopItemsTemp.indexWhere((e) => e.product == data);
    if (dataInex == -1) {
      shopItemsTemp.add(ShopItem(product: data));
    } else {
      final temp = shopItemsTemp[dataInex];
      if (temp.count + 1 <= 10) {
        temp.count = temp.count + 1;
        shopItemsTemp.removeAt(dataInex);
        shopItemsTemp.insert(dataInex, temp);
      }
    }
    emit(state.copyWith(shopItems: shopItemsTemp));
    final total = await getTotal();
    emit(state.copyWith(totalCost: total));
    updateTimer?.cancel();
    updateTimer = Timer(const Duration(seconds: 1), () async {
      await storeRepo.updateShopItems(state.shopItems);
      final res = await storeRepo.getShopItems();

      emit(state.copyWith(shopItems: res));
    });
  }

  void onRemoveFromShopCartPressed(Product data) async {
    //
    final shopItemsTemp = [...state.shopItems];
    final temp = shopItemsTemp.firstWhere((element) => element.product == data);
    if (temp.count <= 1) {
      shopItemsTemp.remove(temp);
    } else {
      temp.count = temp.count - 1;
      final dataIndex = shopItemsTemp.indexWhere((e) => e.product == data);
      shopItemsTemp.removeAt(dataIndex);
      shopItemsTemp.insert(dataIndex, temp);
    }
    emit(state.copyWith(shopItems: shopItemsTemp));
    final total = await getTotal();
    emit(state.copyWith(totalCost: total));
    updateTimer?.cancel();
    updateTimer = Timer(const Duration(seconds: 1), () async {
      await storeRepo.updateShopItems(state.shopItems);
      final res = await storeRepo.getShopItems();
      final total = await getTotal();
      emit(state.copyWith(shopItems: res, totalCost: total));
    });
  }

  @override
  Future<void> close() {
    updateTimer?.cancel();
    return super.close();
  }
}
