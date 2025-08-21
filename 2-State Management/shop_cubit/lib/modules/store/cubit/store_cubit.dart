import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:shop_cubit/domains/store/models/category.dart';
import 'package:shop_cubit/domains/store/models/product.dart';
import 'package:shop_cubit/domains/store/store_repository.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  //
  final StoreRepository storeRepo;

  StoreCubit({required this.storeRepo}) : super(StoreState.init()) {
    onInit();
  }

  Future<void> onInit() async {
    emit(state.copyWith(loading: true));
    final productRes = await storeRepo.getProducts();
    final categoriesRes = await storeRepo.getCategories();
    emit(
      state.copyWith(
        loading: false,
        products: productRes,
        categories: categoriesRes,
      ),
    );
  }
}
