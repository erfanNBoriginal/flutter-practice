import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cubit/domains/store/store_repository.dart';
import 'package:shop_cubit/modules/app/cubit/app_cubit.dart';
import 'package:shop_cubit/modules/favorites/cubit/favorites_cubit.dart';
import 'favorites_card.dart';
import '/ui_kit/ui_kit.dart' as U;

class FavoritesPage extends StatelessWidget {
  //
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => FavoritesCubit(
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
      child: MultiBlocListener(
        listeners: [
          BlocListener<AppCubit, AppState>(
            listenWhen:
                (previous, current) =>
                    previous.selectedIndex != current.selectedIndex,
            listener: (context, state) {
              if (state.selectedIndex == 3) {
                final favoritesCubit = BlocProvider.of<FavoritesCubit>(context);
                favoritesCubit.onRefresh();
              }
            },
          ),
          BlocListener<FavoritesCubit, FavoritesState>(
            listenWhen:
                (previous, current) =>
                    previous.favorites.length != current.favorites.length,
            listener: (context, state) {
              final appCubit = context.read<AppCubit>();
              appCubit.onFavsCountChanged(state.favorites.length);
            },
          ),
        ],
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            return state.loading && state.favorites.isEmpty
                ? Center(
                  child: SizedBox.square(
                    dimension: 30,
                    child: CircularProgressIndicator(),
                  ),
                )
                : state.favorites.isEmpty
                ? Center(child: U.Text('لیست علاقه‌مندی خالیه!!!'))
                : ListView.separated(
                  itemCount: state.favorites.length,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  },
                  itemBuilder: (context, index) {
                    final data = state.favorites[index];
                    return Column(
                      children: [
                        FavoritesCard(product: data),
                        if (state.loading && data == state.favorites.last) ...[
                          SizedBox(height: 20),
                          Center(
                            child: SizedBox.square(
                              dimension: 30,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ],
                      ],
                    );
                  },
                );
          },
        ),
      ),
    );
  }
}
