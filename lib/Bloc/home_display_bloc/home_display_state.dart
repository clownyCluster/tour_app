part of 'home_display_bloc.dart';

class HomeDisplayState extends Equatable {
  int selectedIndex;
  List onNavigation =  [
    HomeScreen(),
    BookingScreen(),
    ProfileScreen(),
    // LoginScreen(),
  ];
  HomeDisplayState({this.selectedIndex = 0});
  HomeDisplayState copyWith({int? selectedIndex}) {
    return HomeDisplayState(selectedIndex: selectedIndex ?? this.selectedIndex);
  }

  @override
  List<Object> get props => [selectedIndex];
}
