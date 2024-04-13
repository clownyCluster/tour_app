import 'package:bloc/bloc.dart';
import 'package:tour_destiny/View/Screen/Booking_Module/booking_screen.dart';
import 'package:tour_destiny/View/Screen/Home_Screen_Module/home_screen.dart';
import 'package:tour_destiny/View/Screen/Profile_Module/profile_screen.dart';
import 'package:equatable/equatable.dart';

part 'home_display_event.dart';
part 'home_display_state.dart';

class HomeDisplayBloc extends Bloc<HomeDisplayEvent, HomeDisplayState> {
  HomeDisplayBloc() : super(HomeDisplayState()) {
    on<OnSelectedIndexChanged>(_onSelectedIndexChanged);
  }

  void _onSelectedIndexChanged(
      OnSelectedIndexChanged event, Emitter<HomeDisplayState> emit) {
    emit(state.copyWith(selectedIndex: event.index));
  }
}
