import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../constants/strings.dart';
import '../../../../core/helpers/Keyboard Helper/keyboard.dart';
import '../../../../core/helpers/Validator/validator.dart';
import '../../../../core/helpers/cacheHelper/get_storage_cache_helper.dart';
import '../../../../core/helpers/router/router.dart';
import '../../../../widgets/loading_widget.dart';
import '../../../../widgets/main_app_bar.dart';
import '../../../../widgets/main_button.dart';
import '../../../../widgets/main_container.dart';
import '../../../../widgets/main_text_form_field.dart';
import '../../../Account/presentation/cubit/account_cubit.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({
    Key? key,
    required this.cubit,
    required this.state,
  }) : super(key: key);
  final AccountCubit cubit;
  final AccountState state;

  @override
  Widget build(BuildContext context) {
    cubit.emailController.text = cubit.userEntity!.email.toString();
    cubit.userNameController.text = cubit.userEntity!.userName.toString();
    cubit.phoneController.text = cubit.userEntity!.phone.toString();
    return state is UpdateProfileLoading
        ? const LoadingWidget()
        : Scaffold(
            appBar: mainAppBar(
              title: "Update Profile",
              context: context,
              leading: IconButton(
                onPressed: () => MagicRouter.pop(),
                icon: Icon(Icons.arrow_back_sharp, size: getScreenWidth(20)),
              ),
            ),
            backgroundColor: Colors.black,
            body: Padding(
              padding: EdgeInsets.only(top: getScreenHeight(20)),
              child: MainContainer(
                child: Form(
                    key: cubit.updateProfileFormKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            fit: StackFit.loose,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: getScreenHeight(96.0),
                                  width: getScreenWidth(90.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50),
                                    image: cubit.image != null
                                        ? DecorationImage(
                                            image: FileImage(cubit.image!))
                                        : DecorationImage(
                                            image: NetworkImage(
                                              cubit.userEntity!.image == ""
                                                  ? staticUserImage
                                                  : cubit.userEntity!.image,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0.0,
                                right: 0.0,
                                left: 80.0,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: AppColors.brown,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: () async {
                                      cubit.pickImageFromGallery();
                                    },
                                    icon: Icon(
                                      Icons.camera_alt_outlined,
                                      color: AppColors.whiteColor,
                                      size: getScreenWidth(16),
                                    ),
                                  ),
                                ),
                              ),
                              state is UpdateImageProfileLoading
                                  ? const Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Center(
                                        child: CupertinoActivityIndicator(),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          SizedBox(height: getScreenHeight(30)),
                          MainTextFormField(
                            validator: Validator.validateEmail,
                            controller: cubit.emailController,
                            label: "register.email".tr(),
                          ),
                          MainTextFormField(
                            validator: Validator.validateName,
                            controller: cubit.userNameController,
                            label: "register.user_name".tr(),
                          ),
                          MainTextFormField(
                            validator: Validator.validatePhone,
                            controller: cubit.phoneController,
                            label: "register.phone".tr(),
                            isPhone: true,
                          ),
                          SizedBox(height: getScreenHeight(80)),
                          MainButton(
                            text: "Update",
                            backgroundColor: AppColors.brown,
                            borderColor: Colors.transparent,
                            width: getScreenWidth(240),
                            onTap: () async {
                              if (cubit.updateProfileFormKey.currentState!
                                  .validate()) {
                                cubit.updateUserProfile(
                                  uid: GetStorageCacheHelper.getUid!,
                                  userName: cubit.userNameController.text,
                                  email: cubit.emailController.text,
                                  phone: cubit.phoneController.text,
                                );
                                KeyboardUtil.hideKeyboard(context);
                              }
                            },
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          );
  }
}
