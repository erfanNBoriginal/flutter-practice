import 'package:bloc/bloc.dart';
import 'package:shop_cubit/domains/store/models/product.dart';
import 'package:shop_cubit/domains/store/store_repository.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  //
  final StoreRepository storeRepo;

  FavoritesCubit({required this.storeRepo}) : super(FavoritesState.init()) {
    onInit();
  }

  Future<void> onInit() async {
    emit(state.copyWith(loading: true));
    final res = await storeRepo.getFavorites();
    emit(state.copyWith(loading: false, favorites: res));
  }

  Future<void> onRefresh() async {
    emit(state.copyWith(loading: true));
    final res = await storeRepo.getFavorites();
    emit(state.copyWith(loading: false, favorites: res));
  }

  void onFavoriteButtonTapped(Product data) async {
    //
    emit(state.copyWith(loading: true));
    final favTemp = [...state.favorites];
    final dataIndex = favTemp.indexOf(data);
    if (dataIndex == -1) {
      favTemp.add(data);
    } else {
      favTemp.remove(data);
    }
    emit(state.copyWith(favorites: favTemp));
    storeRepo.updateFavorites(state.favorites);
    final res = await storeRepo.getFavorites();
    emit(state.copyWith(loading: false, favorites: res));
  }

  @override
  void onChange(Change<FavoritesState> change) {
    print('change.currentState.loading');
    print(change.currentState.loading);
    print('change.nextState.loading');
    print(change.nextState.loading);
    print('====================================');
    super.onChange(change);
  }
}
