import 'package:bloc/bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  //
  AppCubit() : super(AppState.init());

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
