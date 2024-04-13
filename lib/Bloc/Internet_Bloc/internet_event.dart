part of 'internet_bloc.dart';

sealed class InternetEvent extends Equatable {
  const InternetEvent();

  @override
  List<Object> get props => [];
}

class OnInternetLossEvent extends InternetEvent {}
class OnInternetGainEvent extends InternetEvent {}
