part of 'home_display_bloc.dart';

sealed class HomeDisplayEvent extends Equatable {
  const HomeDisplayEvent();

  @override
  List<Object> get props => [];
}

class OnSelectedIndexChanged extends HomeDisplayEvent {
  int? index;
  OnSelectedIndexChanged({this.index});
}
