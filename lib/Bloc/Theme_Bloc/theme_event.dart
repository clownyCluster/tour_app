part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class OnToggleThemeEvent extends ThemeEvent {
 final bool isDark;
  const OnToggleThemeEvent({required this.isDark});
}
