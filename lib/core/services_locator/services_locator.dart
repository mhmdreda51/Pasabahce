//==============================================================================
import 'package:get_it/get_it.dart';

import '../../features/Account/data/datasources/account_remote_data_source.dart';
import '../../features/Account/data/repositories/account_repository.dart';
import '../../features/Account/domain/repositories/base_account_repo.dart';
import '../../features/Account/domain/usecases/get_user_data_use_case.dart';
import '../../features/Account/domain/usecases/logout_use_case.dart';
import '../../features/Account/domain/usecases/update_profile_use_case.dart';
import '../../features/Account/domain/usecases/upload_profile_image_use_case.dart';
import '../../features/Account/presentation/cubit/account_cubit.dart';
import '../../features/Auth/data/datasources/auth_data_source.dart';
import '../../features/Auth/data/repositories/auth_repository.dart';
import '../../features/Auth/domain/repositories/base_auth_rebo.dart';
import '../../features/Auth/domain/usecases/create_new_user_use_case.dart';
import '../../features/Auth/domain/usecases/reset_password_use_case.dart';
import '../../features/Auth/domain/usecases/signIn_with_phone_use_case.dart';
import '../../features/Auth/domain/usecases/sign_in_use_case.dart';
import '../../features/Auth/domain/usecases/sign_in_with_google_use_case.dart';
import '../../features/Auth/domain/usecases/sign_up_use_case.dart';
import '../../features/Auth/domain/usecases/verify_phone_number_use_case.dart';
import '../../features/Auth/presentation/cubit/auth_cubit.dart';
import '../../features/Home/data/datasources/home_remote_data_source.dart';
import '../../features/Home/data/repositories/home_repository.dart';
import '../../features/Home/domain/repositories/base_home_repository.dart';
import '../../features/Home/domain/usecases/add_to_cart_use_case.dart';
import '../../features/Home/domain/usecases/add_to_wish_list_use_case.dart';
import '../../features/Home/domain/usecases/get_cart_length_use_case.dart';
import '../../features/Home/domain/usecases/get_products_use_case.dart';
import '../../features/Home/presentation/cubit/home_cubit.dart';
import '../../features/WishList/data/datasources/wish_list_remote_data_source.dart';
import '../../features/WishList/data/repositories/wish_list_repo.dart';
import '../../features/WishList/domain/repositories/base_wish_list_repo.dart';
import '../../features/WishList/domain/usecases/clear_ofline_wish_list_use_case.dart';
import '../../features/WishList/domain/usecases/clear_online_wish_list_use_case.dart';
import '../../features/WishList/domain/usecases/get_wish_list_ltems_use_case.dart';
import '../../features/WishList/domain/usecases/remove_one_ltem_use_case.dart';
import '../../features/WishList/presentation/cubit/wishlist_cubit.dart';

final sl = GetIt.instance;
//==============================================================================

class ServicesLocator {
  void init() {
    //==========================================================================
    sl.registerFactory(
        () => AuthCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl()));
    sl.registerFactory(() => AccountCubit(sl(), sl(), sl(), sl()));
    sl.registerFactory(() => HomeCubit(sl(), sl(), sl(), sl()));
    sl.registerFactory(() => WishlistCubit(sl(), sl(), sl(), sl()));

    //==========================================================================
    sl.registerLazySingleton<BaseAuthDataSource>(
      () => AuthDataSource(),
    );
    sl.registerLazySingleton<BaseAccountRemoteDataSource>(
      () => AccountRemoteDataSource(),
    );
    sl.registerLazySingleton<BaseHomeRemoteDataSource>(
      () => HomeRemoteDataSource(),
    );
    sl.registerLazySingleton<BaseWishListRemoteDataSource>(
      () => WishListRemoteDataSource(),
    );
    //==========================================================================
    sl.registerLazySingleton<BaseAuthRepository>(
      () => AuthRepository(sl()),
    );
    sl.registerLazySingleton<BaseAccountRepository>(
      () => AccountRepository(sl()),
    );
    sl.registerLazySingleton<BaseHomeRepository>(
      () => HomeRepository(sl()),
    );
    sl.registerLazySingleton<BaseWishListRepository>(
      () => WishListRepository(sl()),
    );
    //==========================================================================

    sl.registerLazySingleton(() => SignInUseCase(sl()));
    sl.registerLazySingleton(() => CreateNewUserUseCase(sl()));
    sl.registerLazySingleton(() => SignInWithGoogleUseCase(sl()));
    sl.registerLazySingleton(() => SingUpUseCase(sl()));
    sl.registerLazySingleton(() => VerifyPhoneNumberUseCase(sl()));
    sl.registerLazySingleton(() => SignInWithPhoneUseCase(sl()));
    sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
    sl.registerLazySingleton(() => GetUserDataUseCase(sl()));
    sl.registerLazySingleton(() => LogOutUseCase(sl()));
    sl.registerLazySingleton(() => UploadProfileImageUseCase(sl()));
    sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));
    sl.registerLazySingleton(() => GetProductsUseCase(sl()));
    sl.registerLazySingleton(() => AddToCartUseCase(sl()));
    sl.registerLazySingleton(() => AddToWishListUseCase(sl()));
    sl.registerLazySingleton(() => GetCartLengthUseCase(sl()));
    sl.registerLazySingleton(() => GetWishListItemsUseCase(sl()));
    sl.registerLazySingleton(() => ClearLocalWishlistUseCase(sl()));
    sl.registerLazySingleton(() => ClearOnlineWishlistUseCase(sl()));
    sl.registerLazySingleton(() => RemoveOneItemUseCase(sl()));

    //==========================================================================

    //==========================================================================

    //==========================================================================

    //==========================================================================

    //==========================================================================

    //==========================================================================
    //==========================================================================
    //==========================================================================
  }
}
