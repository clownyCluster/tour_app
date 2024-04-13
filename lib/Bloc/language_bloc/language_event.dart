part of 'language_bloc.dart';

class LanguageEvent extends Equatable {
  LanguageEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ChangeLanguage extends LanguageEvent {
  final Locale locale;

  ChangeLanguage({required this.locale});
}
