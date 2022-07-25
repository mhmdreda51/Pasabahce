import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pasabahce/constants/size_config.dart';

import '../constants/app_colors.dart';
import '../view/Home/Controller/home_cubit.dart';

class NavigationScreen extends StatelessWidget {
  final int currentIndex;

  const NavigationScreen({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocProvider(
      create: (context) => HomeCubit()..currentIndex = currentIndex,
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);

          return Scaffold(
            extendBody: true,
            body: cubit.bottomViews[cubit.currentIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              height: MediaQuery.of(context).size.height * 0.085,
              child: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                elevation: 0.0,
                selectedItemColor: AppColors.brown,
                iconSize: getScreenWidth(22),
                selectedFontSize: 12,
                unselectedFontSize: 10,
                unselectedItemColor: Colors.black,
                onTap: (index) => cubit.changeBottomViews(index),
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined, size: getScreenWidth(22)),
                    label: "",
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.grid_view_outlined),
                    label: "",
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag_outlined),
                    label: "",
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_border_outlined),
                    label: "",
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.settings_outlined),
                    label: "",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
