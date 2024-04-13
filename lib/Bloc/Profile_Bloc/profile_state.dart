part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  UserModel? userModel;
  bool isLoading;

  ProfileState({this.userModel,this.isLoading =true});
  ProfileState copyWith({UserModel? userModel, bool ? isLoading}) {
    return ProfileState(
      userModel: userModel ?? this.userModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [userModel,isLoading];
}
