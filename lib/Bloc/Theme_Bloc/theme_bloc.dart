import 'package:bloc/bloc.dart';
import 'package:tour_destiny/Bloc/Theme_Bloc/theme_state.dart';
import 'package:tour_destiny/Models/services/local_storage_service/local_storage_service.dart';
import 'package:tour_destiny/utils/app_constant.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState()) {
    on<OnToggleThemeEvent>(_onToggleThemeEvent);
  }

  void _onToggleThemeEvent(
      OnToggleThemeEvent event, Emitter<ThemeState> emit) async {
    await LocalStorageService.setTheme(event.isDark ? 'dark' : 'light');
    emit(state.copyWith(isDark: event.isDark));
  }

  onToggleChange() {}
}
