import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import '/domains/store/models/category.dart';
import '/domains/store/models/product.dart';
import '/domains/store/store_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  //
  final int id;

  final CategoryData? initialData;

  final StoreRepository _storeRepo;

  CategoryCubit({
    required StoreRepository storeRepo,
    required this.id,
    this.initialData,
  })  : _storeRepo = storeRepo,
        super(
          CategoryState.init(category: initialData),
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

  void onRatingRangeChanged(double min, double max) {
    emit(state.copyWith(
      minRate: min,
      maxRate: max,
    ));
  }

  void onPriceRangeChanged(double min, double max) {
    emit(state.copyWith(
      minPrice: min.round(),
      maxPrice: max.round(),
    ));
  }

  void onSortChanged(int value) {
    emit(state.copyWith(sort: value));
  }

  void onOrderChanged(int value) {
    emit(state.copyWith(order: value));
  }

  Future<bool> onFilterApplyTapped() async {
    //
    emit(state.copyWith(filterLoading: true));
    await getProducts();
    emit(state.copyWith(filterLoading: false));
    return true;
  }
}
