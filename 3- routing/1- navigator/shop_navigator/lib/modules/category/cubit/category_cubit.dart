import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shop_navigator/domains/store/models/category.dart';
import 'package:shop_navigator/domains/store/models/product.dart';
import 'package:shop_navigator/domains/store/store_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  //
  final int id;

  final StoreRepository _storeRepo;

  CategoryCubit({
    required StoreRepository storeRepo,
    required this.id,
  })  : _storeRepo = storeRepo,
        super(
          CategoryState.init(),
        ) {
    onInit();
  }

//============================Functions=================================
  Future<void> getCategory() async {
    final res = await _storeRepo.getCategory(id: id);
    emit(state.copyWith(category: res));
  }

  Future<void> getProducts() async {
    final res = await _storeRepo.getProducts(categoryId: id);
    emit(state.copyWith(products: res));
  }

//==============================Events==================================
  void onInit() async {
    emit(state.copyWith(loading: true));
    await Future.wait([
      getCategory(),
      getProducts(),
    ]);
    emit(state.copyWith(loading: false));
  }
}
