import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasabahcee/features/Account/presentation/pages/settings.dart';

import '../../../../constants/size_config.dart';
import '../../../../core/helpers/cacheHelper/get_storage_cache_helper.dart';
import '../../../../core/helpers/router/router.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../../../widgets/loading_widget.dart';
import '../../../../widgets/main_app_bar.dart';
import '../../../../widgets/main_container.dart';
import '../../../../widgets/navigation_widget.dart';
import '../../../Auth/presentation/pages/intro_screens.dart';
import '../cubit/account_cubit.dart';
import '../widgets/account_item.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<AccountCubit>()..getUserData(uid: GetStorageCacheHelper.getUid!),
      child: BlocConsumer<AccountCubit, AccountState>(
        listener: (context, state) {
          final cubit = AccountCubit.get(context);
          if (state is SignOutSuccess) {
            MagicRouter.navigateTo(const IntroScreens());
            Fluttertoast.showToast(msg: "settings.log_out_Success".tr());
          }
          if (state is UpdateImageProfileSuccess) {
            MagicRouter.navigateTo(const NavigationScreen(currentIndex: 4));
            Fluttertoast.showToast(msg: "settings.upload_profile_success".tr());
          }
          if (state is UpdateProfileSuccess) {
            MagicRouter.navigateTo(const NavigationScreen(currentIndex: 4));
            Fluttertoast.showToast(msg: "Update User Profile Successfully");
          }
          if (state is UpdateProfileFailed) {
            Fluttertoast.showToast(msg: state.msg);
          }
          if (state is PickImageFromGallerySuccess) {
            cubit.updateUserProfileImage(cubit.image!, cubit.userEntity!);
          }
        },
        builder: (context, state) {
          final cubit = AccountCubit.get(context);
          return state is GetUserDataLoading
              ? const LoadingWidget()
              : Scaffold(
                  appBar: mainAppBar(
                    title: "settings.appBar_title".tr(),
                    context: context,
                    leading: const SizedBox(),
                  ),
                  backgroundColor: Colors.black,
                  body: Padding(
                    padding: EdgeInsets.only(
                      top: getScreenHeight(20),
                      bottom: getScreenHeight(40),
                    ),
                    child: MainContainer(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // UserProfile(cubit: cubit, state: state),
                            SizedBox(height: getScreenHeight(15)),
                            AccountItem(
                              text: "settings.Order_History".tr(),
                              onTap: () {},
                            ),
                            AccountItem(
                              text: "settings.My_Addresses".tr(),
                              onTap: () {},
                            ),
                            AccountItem(
                              text: "settings.My_Cards".tr(),
                              onTap: () {},
                            ),
                            AccountItem(
                              text: "settings.Vouchers".tr(),
                              onTap: () {},
                            ),
                            AccountItem(
                              text: "settings.Nearby_Stores".tr(),
                              onTap: () {},
                            ),
                            AccountItem(
                              text: "settings.Latest_Articles".tr(),
                              onTap: () {},
                            ),
                            AccountItem(
                              text: "settings.Settings".tr(),
                              onTap: () => MagicRouter.navigateTo(
                                const SettingsScreen(),
                              ),
                            ),
                            AccountItem(
                              text: "settings.log_out".tr(),
                              isLast: true,
                              onTap: () => cubit.signOut(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
