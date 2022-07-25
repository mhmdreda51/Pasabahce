import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pasabahce/view/Home/Controller/home_cubit.dart';
import 'package:pasabahce/widgets/main_app_bar.dart';

import '../../constants/size_config.dart';
import '../../widgets/main_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: mainAppBar(
              context: context,
              title: "STORE",
              actions: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: getScreenWidth(18),
                ),
              ),
              leading: const SizedBox(),
            ),
            backgroundColor: Colors.black,
            body: Padding(
              padding: EdgeInsets.only(top: getScreenHeight(20)),
              child: MainContainer(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("home.brands".tr()),
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
