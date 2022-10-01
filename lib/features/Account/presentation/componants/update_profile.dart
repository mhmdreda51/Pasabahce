import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../constants/strings.dart';
import '../../../../core/helpers/router/router.dart';
import '../../../Auth/presentation/componants/compleat_info.dart';
import '../cubit/account_cubit.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key, required this.cubit, required this.state})
      : super(key: key);
  final AccountCubit cubit;
  final AccountState state;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      ? DecorationImage(image: FileImage(cubit.image!))
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
                    // cubit.pickImageFromGallery();
                    MagicRouter.navigateTo(
                      UpdateProfile(
                        cubit: cubit,
                        state: state,
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.edit,
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
        SizedBox(height: getScreenHeight(20)),
        Text(
          cubit.userEntity!.userName == "" ? "" : cubit.userEntity!.userName,
          style: TextStyle(
            color: Colors.black,
            fontSize: getScreenHeight(20),
          ),
        ),
        SizedBox(height: getScreenHeight(3)),
        Text(
          cubit.userEntity!.email == ""
              ? cubit.userEntity!.phone
              : cubit.userEntity!.email,
          style: TextStyle(
            color: Colors.black,
            fontSize: getScreenHeight(14),
          ),
        ),
      ],
    );
  }
}
