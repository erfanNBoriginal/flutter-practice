import 'package:bloc/bloc.dart';
import '/domains/store/models/category.dart';
import '/domains/store/store_repository.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  //
  final StoreRepository storeRepo;

  CategoriesCubit({required this.storeRepo}) : super(CategoriesState.init()) {
    onInit();
  }

  Future<void> onInit() async {
    emit(state.copyWith(loading: true));
    final res = await storeRepo.getCategories();
    emit(state.copyWith(loading: false, categories: res));
  }
}
