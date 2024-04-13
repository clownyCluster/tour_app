import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tour_destiny/Models/services/local_storage_service/local_storage_service.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState()) {
    on<ChangeLanguage>((event, emit)async {
      // await LocalStorageService.write(LocalStorageKeys.language, event.locale);
      await LocalStorageService.setLanguage( event.locale.toString());


      emit(state.copyWith(locale: Locale(LocalStorageService.read(LocalStorageKeys.language) ?? 'ne') ));
    });
  }
}
