part of 'home_cubit.dart';

class HomeState {
  //
  final int selectedIndex;

  final int favsCount;

  final int shopItemsCount;

  const HomeState({
    required this.selectedIndex,
    required this.favsCount,
    required this.shopItemsCount,
  });

  const HomeState.init()
      : selectedIndex = 2,
        shopItemsCount = 0,
        favsCount = 0;

  HomeState copyWith({
    int? selectedIndex,
    int? favsCount,
    int? shopItemsCount,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      favsCount: favsCount ?? this.favsCount,
      shopItemsCount: shopItemsCount ?? this.shopItemsCount,
    );
  }
}
