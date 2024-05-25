import 'package:auto_route/auto_route.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tour_destiny/Bloc/home_display_bloc/home_display_bloc.dart';
import 'package:tour_destiny/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../utils/constant/constant.dart';

@RoutePage()
class HomeDisplayScreen extends StatelessWidget {
  HomeDisplayScreen({super.key});
  final homeBloc = sl<HomeDisplayBloc>();

  @override
  Widget build(BuildContext context) {
    // final bloc = context.read<HomeDisplayBloc>();

    return BlocBuilder<HomeDisplayBloc, HomeDisplayState>(
      builder: (context, state) {
        print('build vayo');
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: state.onNavigation.elementAt(state.selectedIndex),
          bottomNavigationBar: CurvedNavigationBar(
              animationDuration: Duration(milliseconds: 400),
              height: 70,
              backgroundColor: Colors.transparent,
              color: primaryColor,
              buttonBackgroundColor: primaryColor,
              index: state.selectedIndex,
              onTap: (value) {
                homeBloc.add(OnSelectedIndexChanged(index: value));
              },
              items: [
                Icon(
                  Icons.home,
                  color: whiteColor,
                ),
                  Icon(
                    Icons.bookmark_border_rounded,
                    color: whiteColor,
                  ),
                Icon(
                  Icons.person,
                  color: whiteColor,
                )
              ]),
          extendBody: true,
        );
      },
    );
  }
}
