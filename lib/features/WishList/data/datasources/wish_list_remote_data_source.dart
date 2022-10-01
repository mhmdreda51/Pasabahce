import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../constants/strings.dart';
import '../../../../core/helpers/cacheHelper/get_storage_cache_helper.dart';
import '../../../../core/use case/base_use_case.dart';
import '../../../Home/domain/usecases/add_to_wish_list_use_case.dart';
import '../../domain/entities/wish_list_entity.dart';

abstract class BaseWishListRemoteDataSource {
  Future<List<WishList>> getWishListItems(
    NoParameters parameters,
  );

  Future<void> removeOneItem(AddToWishListParameters parameters);

  Future<void> clearOnlineWishlist(NoParameters parameters);

  Future<void> clearLocalWishlist(NoParameters parameters);
}

class WishListRemoteDataSource extends BaseWishListRemoteDataSource {
  Map<String, WishList> wishlistItems = {};
  WishList? wishListModel;
  final userColl = FirebaseFirestore.instance.collection(userCollection);
  final uid = GetStorageCacheHelper.getUid;

  Map<String, WishList> get getWishlistItems {
    return wishlistItems;
  }

  @override
  Future<List<WishList>> getWishListItems(
    NoParameters parameters,
  ) async {
    final DocumentSnapshot userDoc = await userColl.doc(uid).get();
    final length = userDoc.get(userWish).length;
    for (int i = 0; i < length; i++) {
      wishlistItems.putIfAbsent(
        userDoc.get(userWish)[i]['productId'],
        () => WishList(
          productId: userDoc.get(userWish)[i]['productId'],
          image: userDoc.get(userWish)[i]['image'],
          price: userDoc.get(userWish)[i]['price'],
          name: userDoc.get(userWish)[i]['name'],
        ),
      );
    }
    return wishlistItems.values.toList().reversed.toList();
  }

  @override
  Future<void> clearLocalWishlist(NoParameters parameters) async {
    wishlistItems.clear();
  }

  @override
  Future<void> clearOnlineWishlist(NoParameters parameters) async {
    await userColl.doc(uid).update({
      userWish: [],
    });
  }

  @override
  Future<void> removeOneItem(AddToWishListParameters parameters) async {
    await userColl.doc(uid).update({
      userWish: FieldValue.arrayRemove([
        {
          'productId': parameters.productId,
          "image": parameters.image,
          "price": parameters.price,
          "name": parameters.name,
        }
      ])
    }).onError((error, stackTrace) => print(error));
    wishlistItems.remove(parameters.productId);
  }
}
