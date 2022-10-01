import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../constants/strings.dart';
import '../../../../core/helpers/cacheHelper/get_storage_cache_helper.dart';
import '../../../../core/use case/base_use_case.dart';
import '../../domain/usecases/add_to_cart_use_case.dart';
import '../../domain/usecases/add_to_wish_list_use_case.dart';
import '../models/products_model.dart';

abstract class BaseHomeRemoteDataSource {
  Future<List<ProductsModel>> getProducts();

  Future<String> getCartLength(NoParameters parameters);

  Future<void> addToCart(AddToCartParameters parameters);

  Future<void> addToWishList(AddToWishListParameters parameters);
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource {
  final uid = GetStorageCacheHelper.getUid;
  var userColl = FirebaseFirestore.instance.collection(userCollection);
  var productsCol = FirebaseFirestore.instance.collection(productsCollection);

  // final wishListId = const Uuid().v4();
  // final cartId = const Uuid().v4();

  @override
  Future<List<ProductsModel>> getProducts() async {
    return productsCol
        .get()
        .then((value) =>
            value.docs.map((e) => ProductsModel.fromJson(e.data())).toList())
        .catchError((e) {});
  }

  @override
  Future<void> addToCart(AddToCartParameters parameters) async {
    userColl.doc(uid).update({
      userCart: FieldValue.arrayUnion(
        [
          {
            "productId": parameters.productId,
          }
        ],
      ),
    });
  }

  @override
  Future<void> addToWishList(AddToWishListParameters parameters) async {
    userColl.doc(uid).update({
      userWish: FieldValue.arrayUnion(
        [
          {
            "productId": parameters.productId,
            "name": parameters.name,
            "price": parameters.price,
            "image": parameters.image,
          }
        ],
      ),
    });
  }

  @override
  Future<String> getCartLength(NoParameters parameters) async {
    final DocumentSnapshot userDoc = await userColl.doc(uid).get();
    final length = userDoc.get(userCart).length;
    return length.toString();
  }
}
