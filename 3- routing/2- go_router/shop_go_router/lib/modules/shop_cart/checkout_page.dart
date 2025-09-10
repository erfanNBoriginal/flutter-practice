import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_go_router/domains/store/store_repository.dart';
import 'package:shop_go_router/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_go_router/modules/shop_cart/shop_cart_card.dart';
import 'package:shop_go_router/ui_kit/button.dart';
import '/ui_kit/ui_kit.dart' as U;

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});
  static String route = '/CheckoutPage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCartCubit(
        storeRepo: RepositoryProvider.of<StoreRepository>(context),
      ),
      child: BlocBuilder<ShopCartCubit, ShopCartState>(
        builder: (BuildContext context, state) {
          // double cardsize = MediaQuery.of(context).size.height * 1 / 2;
          // int finalTemp = 0;
          // state.shopItems.map((e) {
          //   // finalTemp.add(e.product.price);
          //   finalTemp = finalTemp + e.product.price;
          // }).toList;
          print('MediaQuery.of(context).size.height');
          print(MediaQuery.of(context).size.height);
          return Stack(
            children: [
              Positioned(
                top: 71,
                left: 0,
                right: 0,
                bottom: 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: U.Card(
                      height:
                          // MediaQuery.of(context).size.height - cardsize > 0
                          //     ? MediaQuery.of(context).size.height - cardsize
                          //     : 0,
                          MediaQuery.of(context).size.height - 450 > 0
                              ? MediaQuery.of(context).size.height - 450
                              : 0,
                      child: ListView(
                        children: [
                          Row(
                            children: [U.Text('سبد خرید')],
                          ),
                          U.Divider.horizontal(
                            thickness: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: U.Card(
                              // height: 200,
                              // height: MediaQuery.of(context).size.height / 2,
                              height:
                                  MediaQuery.of(context).size.height - 500 > 0
                                      ? MediaQuery.of(context).size.height - 500
                                      : 0,
                              child: state.loading
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : ListView.separated(
                                      separatorBuilder: (_, index) {
                                        return const SizedBox(height: 9);
                                      },
                                      itemCount: state.shopItems.length,
                                      itemBuilder: (context, index) {
                                        print(
                                            'MediaQuery.of(context).size.height');
                                        print(
                                            MediaQuery.of(context).size.height);
                                        return ShopCartCard(
                                            shopItem: state.shopItems[index]);
                                      },
                                    ),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            height: 17,
                            child: U.Divider.horizontal(
                              thickness: 16,
                            ),
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 19,
                              ),
                              U.Text('چمع سبد:', color: U.Theme.primary),
                              U.Text(state.totalCost.toString()),
                              SizedBox(
                                width: 5,
                              ),
                              U.Text('جمع تخفیفات', color: U.Theme.primary),
                              U.Text('0'),
                              SizedBox(
                                width: 19,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 21,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              U.Text('قابل پرداخت:', color: U.Theme.primary),
                              SizedBox(
                                width: 22,
                              ),
                              U.Text(state.totalCost.toString()),
                            ],
                          )
                        ],
                      )),
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                top: 0,
                child: U.AppBar.secondary(
                    title: 'تکمیل خرد',
                    onBackPressed: () {
                      GoRouter.of(context).pop();
                    }),
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: U.Card(
                      height: 230,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              U.Image.icon(
                                path: U.Icons.profile,
                                color: U.Theme.primary,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              U.Text('اطلاعات ارسال و پرداخت ')
                            ],
                          ),
                          U.Divider.horizontal(
                            thickness: 9,
                          ),
                          U.TextInput(
                              hint: 'استان شهر منطقه',
                              title: 'آدرس تحویل :',
                              controller: TextEditingController()),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: U.TextInput(
                                    title: 'کد تخفیف',
                                    hint: 'AHBVI243+',
                                    controller: TextEditingController()),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              U.IconButton(
                                  color: U.Theme.secondary,
                                  icon: Icon(
                                      color: Colors.white,
                                      Icons.airplane_ticket),
                                  onPressed: () {})
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Hero(
                            tag: 1,
                            child: U.Button(
                              title: 'پرداخت',
                              onPressed: () {},
                              color: U.ButtonColor.primary,
                            ),
                          )
                        ],
                      )),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
