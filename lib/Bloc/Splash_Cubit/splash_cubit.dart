import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:tour_destiny/Models/services/local_storage_service/local_storage_service.dart';
import 'package:tour_destiny/View/Screen/BottomNavbar/home_display_screen.dart';
import 'package:tour_destiny/routes/routes_imports.gr.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  // var token;
  SplashCubit() : super(SplashState()) {
    checkToken;
  }

  void checkToken(BuildContext context) async {
    var token = await LocalStorageService.read(LocalStorageKeys.accessToken);

    print('YO token: $token');
    if (token == null || token == '' || token!.isEmpty) {
      await Future.delayed(Duration(seconds: 2), () {
        AutoRouter.of(context).replaceAll([LoginScreenRoute()]);
      });
    } else {
      AutoRouter.of(context).replaceAll([HomeDisplayScreenRoute()]);
    }
  }
}
