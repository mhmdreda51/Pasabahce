import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/size_config.dart';
import '../../../../widgets/main_container.dart';
import '../cubit/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = CartCubit.get(context);
          return Scaffold(
            appBar: appBar(context, cubit),
            backgroundColor: Colors.black,
            body: Padding(
              padding: EdgeInsets.only(
                top: getScreenHeight(20),
                bottom: getScreenHeight(50),
              ),
              child: MainContainer(
                child: Column(),
              ),
            ),
          );
        },
      ),
    );
  }
}

AppBar appBar(BuildContext context, CartCubit cubit) {
  return AppBar(
    backgroundColor: Colors.black,
    elevation: 0.0,
    leading: const SizedBox(),
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
        "Cart",
        style: TextStyle(
          fontSize: getScreenWidth(16),
        ),
      ),
    ),
  );
}
