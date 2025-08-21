part of 'favorites_cubit.dart';

final class FavoritesState {
  //
  final bool loading;

  final List<Product> favorites;

  const FavoritesState({required this.loading, required this.favorites});

  const FavoritesState.init() : loading = false, favorites = const [];

  FavoritesState copyWith({bool? loading, List<Product>? favorites}) {
    return FavoritesState(
      loading: loading ?? this.loading,
      favorites: favorites ?? this.favorites,
    );
  }
}
