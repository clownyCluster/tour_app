import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:tour_destiny/Models/services/local_storage_service/local_storage_service.dart';
import 'package:tour_destiny/Models/services/toast_service.dart';
import 'package:tour_destiny/routes/routes_imports.gr.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../Models/Repository/auth_repository.dart';
import '../../Models/services/network_response/status.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;
  LoginCubit({required this.authRepository, })
      : super(LoginState());

  Future<void> loginUser(
      String email, String password,BuildContext context ) async {
    emit(state.copyWith(isLoading: true));
    await authRepository.loginUser(email, password).then((value) async {
      print(value['token']);
      await LocalStorageService.write(
          LocalStorageKeys.accessToken, value['token']);

      AutoRouter.of(context).popAndPushAll([SplashScreenRoute()]);
    }).onError((error, stackTrace) {
      print(stackTrace);
    });
    emit(state.copyWith(isLoading: false));
  }
}
