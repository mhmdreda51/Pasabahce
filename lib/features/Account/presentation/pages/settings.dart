import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/size_config.dart';
import '../../../../core/helpers/router/router.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../../../widgets/main_app_bar.dart';
import '../../../../widgets/main_container.dart';
import '../../../../widgets/navigation_widget.dart';
import '../componants/location_row.dart';
import '../componants/newslietters_row.dart';
import '../componants/notification_row.dart';
import '../componants/password_row.dart';
import '../cubit/account_cubit.dart';
import '../widgets/lang_row.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AccountCubit>(),
      child: BlocConsumer<AccountCubit, AccountState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = AccountCubit.get(context);
          return Scaffold(
            appBar: mainAppBar(
                title: "settings.settings_title".tr(),
                context: context,
                leading: IconButton(
                  onPressed: () => MagicRouter.pop(),
                  icon: const Icon(Icons.arrow_back),
                  iconSize: getScreenWidth(20),
                )),
            backgroundColor: Colors.black,
            body: Padding(
              padding: EdgeInsets.only(
                top: getScreenHeight(20),
                bottom: getScreenHeight(40),
              ),
              child: MainContainer(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LangRow(
                        text: "settings.lang".tr(),
                        hint: "settings.Change".tr(),
                        list: cubit.langList,
                        value: cubit.langDropdownValue,
                        onChanged: (newValue) {
                          cubit.changeLangDropDown(value: newValue!);
                          if (newValue == 'العربية') {
                            context.setLocale(const Locale('ar', 'EG'));
                            MagicRouter.navigateAndPopAll(
                                const NavigationScreen(currentIndex: 0));
                          } else if (newValue == 'English') {
                            context.setLocale(const Locale('en', 'US'));
                            MagicRouter.navigateAndPopAll(
                                const NavigationScreen(currentIndex: 0));
                          }
                        },
                      ),
                      const PasswordRow(),
                      const LocationRow(),
                      NotificationRow(
                        value: cubit.notificationToggle,
                        onChanged: (value) =>
                            cubit.changeNotificationToggle(value: value),
                        title: cubit.notificationToggle == true
                            ? "settings.enabled".tr()
                            : "settings.disabled".tr(),
                      ),
                      NewslettersRow(
                        value: cubit.newslettersToggle,
                        onChanged: (value) =>
                            cubit.changeNewslettersToggle(value: value),
                        title: cubit.newslettersToggle == true
                            ? "settings.enabled".tr()
                            : "settings.disabled".tr(),
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
