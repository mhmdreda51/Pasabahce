import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../constants/size_config.dart';
import '../../../../constants/strings.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../../../widgets/loading_widget.dart';
import '../../../../widgets/main_container.dart';
import '../componants/on_deleting_mood.dart';
import '../cubit/wishlist_cubit.dart';
import '../widgets/fav_item_card.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WishlistCubit>()..getWishListItems(),
      child: BlocConsumer<WishlistCubit, WishlistState>(
        listener: (context, state) {
          final cubit = WishlistCubit.get(context);

          if (state is RemoveOneItemSuccess) {
            cubit.getWishListItems();
            Fluttertoast.showToast(msg: "Item removed Successfully");
          }
        },
        builder: (context, state) {
          final cubit = WishlistCubit.get(context);
          return state is GetWishListLoading
              ? const LoadingWidget()
              : Scaffold(
                  appBar: appBar(context, cubit),
                  backgroundColor: Colors.black,
                  body: cubit.deleting
                      ? OnDeletingMood(
                          cubit: cubit,
                        )
                      : Padding(
                          padding: EdgeInsets.only(
                            top: getScreenHeight(20),
                            bottom: getScreenHeight(50),
                          ),
                          child: MainContainer(
                            child: cubit.wishListItems.isNotEmpty
                                ? GridView.builder(
                                    padding: EdgeInsets.only(
                                        left: getScreenWidth(10)),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                    ),
                                    itemCount: cubit.wishListItems.length,
                                    itemBuilder: (context, index) {
                                      return FavItemCard(
                                        image: cubit.wishListItems[index].image,
                                        name: cubit.wishListItems[index].name,
                                        price: cubit.wishListItems[index].price,
                                      );
                                    },
                                  )
                                : Image.network(emptyWishList),
                          ),
                        ),
                );
        },
      ),
    );
  }
}

AppBar appBar(BuildContext context, WishlistCubit cubit) {
  return AppBar(
    backgroundColor: Colors.black,
    elevation: 0.0,
    leading: Padding(
      padding: EdgeInsets.only(
        left: context.locale.languageCode == 'en'
            ? getScreenWidth(10)
            : getScreenWidth(0),
        right: context.locale.languageCode == 'ar'
            ? getScreenWidth(10)
            : getScreenWidth(0),
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search),
      ),
    ),
    centerTitle: true,
    actions: [
      Padding(
          padding: EdgeInsets.only(
            right: context.locale.languageCode == 'en'
                ? getScreenWidth(10)
                : getScreenWidth(0),
            left: context.locale.languageCode == 'ar'
                ? getScreenWidth(10)
                : getScreenWidth(0),
          ),
          child: IconButton(
            onPressed: () {
              cubit.changeDeleting();
            },
            icon: Icon(
              cubit.deleting ? Icons.close : Icons.delete_outline,
              color: Colors.white,
            ),
          )),
    ],
    title: Center(
      child: Text(
        "FAVORITES",
        style: TextStyle(
          fontSize: getScreenWidth(13),
        ),
      ),
    ),
  );
}
