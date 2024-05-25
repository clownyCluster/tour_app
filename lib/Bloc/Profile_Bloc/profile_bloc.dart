import 'package:bloc/bloc.dart';
import 'package:tour_destiny/Models/Repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tour_destiny/Models/services/network_response/api_response.dart';

import '../../Models/API_Models/Get_User_Models/get_user_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserRepositoy userRepositoy;
  ProfileBloc({required this.userRepositoy})
      : super(ProfileState(apiResponse: ApiResponse.loading())) {
    getUser();
  }

  Future getUser() async {
    await userRepositoy.getUser().then((value) {
      emit(state.copyWith(
          userModel: value, apiResponse: ApiResponse.completed(value)));
      state.isLoading = false;
    }).onError((error, stackTrace) {
      print(stackTrace);
      emit(state.copyWith(apiResponse: ApiResponse.error(error.toString())));
      state.isLoading = false;
    });
  }
}
