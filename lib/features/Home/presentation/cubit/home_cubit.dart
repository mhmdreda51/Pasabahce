import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/use case/base_use_case.dart';
import '../../domain/entities/products.dart';
import '../../domain/usecases/add_to_cart_use_case.dart';
import '../../domain/usecases/add_to_wish_list_use_case.dart';
import '../../domain/usecases/get_cart_length_use_case.dart';
import '../../domain/usecases/get_products_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this.getProductsUseCase,
    this.addToWishListUseCase,
    this.addToCartUseCase,
    this.getCartLengthUseCase,
  ) : super(HomeInitial());

  //===============================================================
  static HomeCubit get(context) => BlocProvider.of(context);

  //===============================================================
  GetProductsUseCase getProductsUseCase;
  AddToCartUseCase addToCartUseCase;
  AddToWishListUseCase addToWishListUseCase;
  GetCartLengthUseCase getCartLengthUseCase;

//===============================================================
  late List<Products> productList = [];
  String cartLength = "";

//===============================================================
  Future<void> getProducts() async {
    final res = await getProductsUseCase.call(const NoParameters());
    emit(GetProductsLoading());
    res.fold(
      (l) => {
        emit(GetProductsFailed(msg: l.message)),
      },
      (r) => {
        productList = r,
        emit(GetProductsSuccess()),
      },
    );
  }

//===============================================================
  Future<void> addToCard(String productId) async {
    final res = await addToCartUseCase.call(AddToCartParameters(productId));
    emit(AddToCartLoading());
    res.fold(
      (l) => {
        emit(AddToCartFailed(msg: l.message)),
      },
      (r) => {
        emit(AddToCartSuccess()),
      },
    );
  }

//===============================================================
  Future<void> addToWishList({
    required String productId,
    image,
    price,
    name,
  }) async {
    final res = await addToWishListUseCase.call(AddToWishListParameters(
      image: image,
      name: name,
      productId: productId,
      price: price,
    ));
    emit(AddToWishListLoading());
    res.fold(
      (l) => {
        emit(AddToWishListFailed(msg: l.message)),
      },
      (r) => {
        emit(AddToWishListSuccess()),
      },
    );
  }

//===============================================================
  Future getCartLength() async {
    final res = await getCartLengthUseCase.call(const NoParameters());
    emit(GetCartLengthLoading());
    res.fold(
      (l) => {
        emit(GetCartLengthFailed(msg: l.message)),
      },
      (r) => {
        cartLength = r,
        emit(GetCartLengthSuccess()),
      },
    );
  }

//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================

}
