import 'package:bloc/bloc.dart';
import '/domains/store/models/category.dart';
import '/domains/store/models/product.dart';
import '/domains/store/store_repository.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  //
  final StoreRepository storeRepo;

  final int? initialProductId;

  StoreCubit({
    required this.storeRepo,
    this.initialProductId,
  }) : super(StoreState.init()) {
    onInit();
  }

  Future<void> onInit() async {
    emit(state.copyWith(loading: true));
    final productRes = await storeRepo.getProducts();
    final categoriesRes = await storeRepo.getCategories();
    Product? initialProduct;
    if (initialProductId != null) {
      initialProduct = await storeRepo.getProduct(id: initialProductId!);
    }
    emit(
      state.copyWith(
        loading: false,
        products: productRes,
        categories: categoriesRes,
        initialProduct: initialProduct,
      ),
    );
  }
}
