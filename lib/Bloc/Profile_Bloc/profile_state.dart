part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  UserModel? userModel;
  bool isLoading;
  ApiResponse<UserModel> apiResponse = ApiResponse.loading();

  ProfileState({this.userModel, this.isLoading = true,required this.apiResponse});
  ProfileState copyWith({UserModel? userModel, bool? isLoading,  ApiResponse<UserModel>? apiResponse}) {
    return ProfileState(
      apiResponse: apiResponse ?? this.apiResponse ,
      userModel: userModel ?? this.userModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [userModel, isLoading,apiResponse];
}
