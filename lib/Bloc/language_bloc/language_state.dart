part of 'language_bloc.dart';

class LanguageState extends Equatable {
  Locale locale;
  LanguageState({this.locale = const Locale('en')});
  LanguageState copyWith({Locale? locale}) {
    return LanguageState(locale: locale ?? this.locale);
  }

  @override
  List<Object?> get props => [locale];
}
