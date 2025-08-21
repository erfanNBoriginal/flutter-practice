part of 'app_cubit.dart';

final class AppState {
  //
  final int selectedIndex;

  final int favsCount;

  final int shopItemsCount;

  const AppState({
    required this.selectedIndex,
    required this.favsCount,
    required this.shopItemsCount,
  });

  const AppState.init() : selectedIndex = 2, shopItemsCount = 0, favsCount = 0;

  AppState copyWith({int? selectedIndex, int? favsCount, int? shopItemsCount}) {
    return AppState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      favsCount: favsCount ?? this.favsCount,
      shopItemsCount: shopItemsCount ?? this.shopItemsCount,
    );
  }
}
