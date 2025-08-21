import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_go_router/modules/category/cubit/category_cubit.dart';
import '/ui_kit/ui_kit.dart' as U;

class CategoryBottomSheet extends StatelessWidget {
  const CategoryBottomSheet({super.key});

  static void show(
    BuildContext context, {
    required CategoryCubit categoryCubit,
  }) {
    U.BottomSheet.show(context, builder: (BuildContext context) {
      return BlocProvider.value(
          value: categoryCubit, child: CategoryBottomSheet());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
      final categoryCubit = context.read<CategoryCubit>();

      return Column(
        children: [
          Row(
            children: [
              U.Image.icon(path: U.Icons.filter),
              U.Text(
                'فیلتر محصولات ${state.category?.title ?? ''}',
                size: U.TextSize.s18,
              ),
              const Spacer(),
            ],
          ),
          U.Divider.horizontal(
            thickness: 1,
            space: 24,
          ),
          U.Text(
            'براساس امتیاز',
            size: U.TextSize.s16,
          ),
          SizedBox(
            height: 12,
          ),
          U.RangeSlider(
              minValue: 0,
              maxValue: 5,
              minRangeValue: state.minRate,
              divisions: 10,
              maxRangeValue: state.maxRate,
              onChanged: categoryCubit.onRatingRangeChanged
              //  (min, max) {
              //   categoryCubit.onRatingChanged(min: min, max: max);
              // }
              ),
          SizedBox(
            height: 12,
          ),
          U.Text(
            'براساس قیمت',
            size: U.TextSize.s16,
          ),
          SizedBox(
            height: 12,
          ),
          U.RangeSlider(
            minValue: 0,
            maxValue: 500000000,
            divisions: 5000,
            minRangeValue: state.minPrice.toDouble(),
            maxRangeValue: state.maxPrice.toDouble(),
            showType: U.RangeSliderShowType.int,
            sign: U.Text(
              'تومان',
            ),
            onChanged: categoryCubit.onPriceRangeChanged,
          ),
          SizedBox(
            height: 12,
          ),
          U.Text(
            'به ترتیب',
            size: U.TextSize.s16,
          ),
          Row(
            children: [
              const Spacer(),
              U.RadioButton(
                title: 'قیمت',
                value: 0,
                groupValue: state.sort,
                onPressed: categoryCubit.onSortChanged,
              ),
              const Spacer(),
              U.RadioButton(
                title: 'امتیاز',
                value: 1,
                groupValue: state.sort,
                onPressed: categoryCubit.onSortChanged,
              ),
              const Spacer(),
              SizedBox(
                height: 30,
                child: U.Divider.vertical(
                  thickness: 2,
                  space: 12,
                ),
              ),
              const Spacer(),
              U.RadioButton(
                title: 'صعودی',
                value: 0,
                groupValue: state.order,
                onPressed: categoryCubit.onOrderChanged,
              ),
              const Spacer(),
              U.RadioButton(
                title: 'نزولی',
                value: 1,
                groupValue: state.order,
                onPressed: categoryCubit.onOrderChanged,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          U.Button(
            title: 'اعمال فیلتر',
            loading: state.filterLoading,
            onPressed: () async {
              final res = await categoryCubit.onFilterApplyTapped();
              if (res) {
                GoRouter.of(context).pop();
              }
            },
          ),
        ],
      );
    });
  }
}
