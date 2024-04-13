import 'package:bloc/bloc.dart';
import 'package:tour_destiny/Models/Repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../Models/API_Models/Get_User_Models/get_user_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserRepositoy userRepositoy;
  ProfileBloc({required this.userRepositoy}) : super(ProfileState()) {
    getUser();
  }

  Future getUser() async {
    await userRepositoy.getUser().then((value) {
      emit(state.copyWith(userModel: value, isLoading: true));
      state.isLoading = false;
    }).onError((error, stackTrace) {
      print(stackTrace);
      state.isLoading = false;
    });
  }
}
