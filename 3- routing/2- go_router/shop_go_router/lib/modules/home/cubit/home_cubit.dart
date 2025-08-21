import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.init());

  void onSelectedIndexChanged(int selectedIndex) {
    emit(state.copyWith(selectedIndex: selectedIndex));
  }

  void onFavsCountChanged(int count) {
    emit(state.copyWith(favsCount: count));
  }

  void onShopItemsCountChanged(int count) {
    emit(state.copyWith(shopItemsCount: count));
  }
}
