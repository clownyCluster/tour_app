part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class OnSelectedIndexEvent extends HomeEvent {
  String? selectedIndex;
  OnSelectedIndexEvent({this.selectedIndex});
}
