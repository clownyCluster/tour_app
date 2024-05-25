part of 'login_cubit.dart';

class LoginState extends Equatable {
  //  final DataStatus postStatus;
  bool isLoading;
  String message;
  String email;
  String password;
  LoginState(
      {this.isLoading = false,
      this.message = '',
      this.email = '',
      this.password = '',
      });

  LoginState copyWith(
      {bool? isLoading, String? message, String? email, String? password}) {
    return LoginState(
        isLoading: isLoading ?? this.isLoading,
        message: message ?? this.message,
        email: email ?? this.email,
        password: password ?? this.password);
  }

  @override
  List<Object> get props => [isLoading, message, password, email];
}
